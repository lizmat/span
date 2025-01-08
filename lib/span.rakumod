use snip:ver<0.0.2+>:auth<zef:lizmat>;

sub EXPORT() { Map.new: ('&span' => &snip) }

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

NOTE: this distribution has been deprecated in favour of the
L<snip|https://raku.land/zef:lizmat/snip> distribution.

The C<span> distribution exports a single subroutine C<span> that mimics
the functionality provided by L<Haskell's span functionality|https://hackage.haskell.org/package/base-4.16.1.0/docs/Prelude.html#v:span>.

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

Copyright 2022, 2025 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
