use nqp;  # intended to be part of Raku core

my class Span does Iterator {
    has $!tests;
    has $!iterator;
    has $!next;

    method !SET-SELF(@tests, $iterator) {
        $!tests    := nqp::getattr(@tests,List,'$!reified');
        $!iterator := $iterator;
        $!next     := $iterator.pull-one;
        self
    }

    method new(@tests, $iterator) {
        nqp::create(self)!SET-SELF(@tests, $iterator)
    }

    method pull-one() {
        if nqp::eqaddr($!next,IterationEnd) {
            IterationEnd
        }
        else {
            my $buffer := nqp::create(IterationBuffer);
            nqp::push($buffer,$!next);

            my $iterator := $!iterator;
            my $pulled;

            if nqp::elems($!tests) {
                my $test := nqp::shift($!tests);
                nqp::until(
                  nqp::eqaddr(($pulled := $iterator.pull-one),IterationEnd)
                    || nqp::isfalse($test.ACCEPTS($pulled)),
                  nqp::push($buffer,$pulled)
                );

            }
            else {
                nqp::until(
                  nqp::eqaddr(($pulled := $iterator.pull-one),IterationEnd),
                  nqp::push($buffer,$pulled)
                );
            }

            $!next := $pulled;
            $buffer.List
        }
    }
}

my proto sub span($, |) {*}
my multi sub span(\condition,  +values) {
    Seq.new: Span.new: (condition,), values.iterator
}
my multi sub span(@conditions, +values) {
    Seq.new: Span.new: @conditions, values.iterator
}

sub EXPORT() {
    CORE::.EXISTS-KEY('&span')
      ?? Map.new
      !! Map.new: ('&span' => &span)
}

=begin pod

=head1 NAME

span - Provide Haskell's span functionality

=head1 SYNOPSIS

=begin code :lang<raku>

use span;

.say for span * < 10, 2, 2, 2, 5, 5, 7, 13, 9, 6, 2, 20, 4;
# (2 2 2 5 5 7)
# (13 9 6 2 20 4)

.say for span (* < 10, * < 20), 2, 2, 2, 5, 5, 7, 13, 9, 6, 2, 20, 4;
# (2 2 2 5 5 7)
# (13 9 6 2)
# (20 4)

.say for span Int, 2, 2, 2, 5, 5, "a", "b", "c";
# (2 2 2 5 5)
# (a b c)

=end code

=head1 DESCRIPTION

The C<span> distribution exports a single subroutine C<span> that mimics
the functionality provided by L<Haskell's span functionality|https://hackage.haskell.org/package/base-4.16.1.0/docs/Prelude.html#v:span>.
But only if the core does not supply a C<span> subroutine already (which
it may at some point in the future).

The C<span> subroutine takes a matcher much like C<grep> does, which can
be a C<Callable> or any other object that can have the C<ACCEPTS> method
called on it.

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/span .
Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a
L<small sponsorship|https://github.com/sponsors/lizmat/>  would mean a great
deal to me!

=head1 COPYRIGHT AND LICENSE

Copyright 2022 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
