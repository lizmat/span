[![Actions Status](https://github.com/lizmat/span/actions/workflows/linux.yml/badge.svg)](https://github.com/lizmat/span/actions) [![Actions Status](https://github.com/lizmat/span/actions/workflows/macos.yml/badge.svg)](https://github.com/lizmat/span/actions) [![Actions Status](https://github.com/lizmat/span/actions/workflows/windows.yml/badge.svg)](https://github.com/lizmat/span/actions)

NAME
====

span - Provide Haskell's span functionality

SYNOPSIS
========

```raku
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
```

DESCRIPTION
===========

NOTE: this distribution has been deprecated in favour of the [snip](https://raku.land/zef:lizmat/snip) distribution.

The `span` distribution exports a single subroutine `span` that mimics the functionality provided by [Haskell's span functionality](https://hackage.haskell.org/package/base-4.16.1.0/docs/Prelude.html#v:span).

The `span` subroutine takes a matcher much like `grep` does, which can be a `Callable` or any other object that can have the `ACCEPTS` method called on it.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/span . Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2022, 2025 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

