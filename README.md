# UIUC Thesis Template 2020

This is a version of [uiucthesis2014](https://github.com/mayhewsw/uiucthesis2014)
with some updates to the new decade compatible with **TeXLive 2018 and newer**.
The main [official requirements](https://grad.illinois.edu/thesis/format) should
still be respected (feel free to file a bug otherwise).

At a technical level, a few things have changed in the class implementation:

* *Use the `scrbook` class from [KOMA-Script](https://ctan.org/pkg/koma-script?lang=en)*.
  The class and surrounding packages have better support for typography and
  improved versatility compared to the standard `book` class.
* *Improve positioning and customization code*. The class uses the
  `scrlayer-scrpage` and `tocbasic` to modify the page style, table of
  contents style, and various positioning code in a more consistent fashion.
* *Use higher level functionality*. Most parts switched from low level TeX
  commands to LaTeX2e commands and standard packages.

**Note**: There is now an officially promoted LaTeX template on the
[Graduate College website](https://grad.illinois.edu/thesis/format) that can be
found [here](https://uofi.app.box.com/s/f5za8r9qi4yahne2l1b6hapuahwve2mb). This
is similarly based on the classic `uiucthesis2014` class. Unless you really like
some formatting choices made here, you should really use that one!

# Usage

To use this class, the easiest way is probably just to copy `uiucthesis2020.cls`
to your own repository / local folder and use is as a document class
```latex
\documentclass[11pt,edeposit,draftthesis]{uiucthesis2020}
% ... custom commands and packages ...

\begin{document}
% ... custom text ...
\end{document}
```

The `thesis.tex` and `thesisstyle.tex` files are provided as inspiration and
likely contain some personal preferences. The example document can be easily built
with
```bash
make example
```

# Options

The class has several options that can be turned on as desired (see the
documentation in ``uiucthesis2020.pdf`` for details). They are

* ``draftthesis``: turns on line numbering, puts the compilation date on
  each page, etc. This is mostly meant to make it easier to review the manuscript.
* ``edeposit``: should be turned on when depositing the thesis electronically.
  This contains some important official requirements.
* ``doublespacing``: turns on double line spacing. By default the lines are
  spaced at 1.5, which is also allowed by the official requirements.
* ``forcebottom``: sets the bottom margin to be exactly ``1in`` as well. By
  default, the class uses standard KOMA-Script margins (with ``DIV=12``),
  which set the bottom margin to about twice the other margins (which are
  already ``1in``).
* ``layoutgrid``: adds a nice grid on each page to allow checking the
  margins.

The provided documentation can also be built with
```bash
make docs
```

# Colors

The standard branding colors are given below. For some suggestions as to how
these should be used, see the [official recommendations](https://marketing.illinois.edu/visual-identity/color).

| Primary Colors       | RGB |
| :-                   | :-
| `IlliniOrange`       | ![#FF5F05](https://placehold.co/15x15/FF5F05/FF5F05.png) `(255, 95, 5)`    |
| `IlliniBlue`         | ![#13294B](https://placehold.co/15x15/13294B/13294B.png) `(19, 41, 75)`    |
| `IlliniAltgeld`      | ![#C84113](https://placehold.co/15x15/C84113/C84113.png) `(200, 65, 19)`   |
| Secondary Colors     | RGB
| :-                   | :-
| `IlliniStorm1`       | ![#707372](https://placehold.co/15x15/707372/707372.png) `(112, 115, 114)` |
| `IlliniStorm2`       | ![#9C9A9D](https://placehold.co/15x15/9C9A9D/9C9A9D.png) `(156, 154, 157)` |
| `IlliniStorm3`       | ![#C8C6C7](https://placehold.co/15x15/C8C6C7/C8C6C7.png) `(200, 198, 199)` |
| `IlliniStorm4`       | ![#FFFFFF](https://placehold.co/15x15/FFFFFF/FFFFFF.png) `(255, 255, 255)` |
| `IlliniStorm5`       | ![#000000](https://placehold.co/15x15/000000/000000.png) `(0, 0, 0)`       |
| Supporting Colors    | RGB
| :-                   | :-
| `IlliniIndustrial`   | ![#1D58A7](https://placehold.co/15x15/1D58A7/1D58A7.png) `(29, 88, 167)`   |
| `IlliniArches`       | ![#009FD4](https://placehold.co/15x15/009FD4/009FD4.png) `(0, 159, 212)`   |
| `IlliniHarvest`      | ![#FCB316](https://placehold.co/15x15/FCB316/FCB316.png) `(252, 179, 22)`  |
| `IlliniPrairie`      | ![#006230](https://placehold.co/15x15/006230/006230.png) `(0, 98, 48)`     |
| `IlliniPatina`       | ![#007E8E](https://placehold.co/15x15/007E8E/007E8E.png) `(0, 126, 142)`   |
| `IlliniBerry`        | ![#5C0E41](https://placehold.co/15x15/5C0E41/5C0E41.png) `(92, 14, 65)`    |
| `IlliniEarth`        | ![#7D3E13](https://placehold.co/15x15/7D3E13/7D3E13.png) `(125, 62, 19)`   |

# References

Some recommended reading

* [microtype: Better Typography](http://www.khirevich.com/latex/microtype/)
* [booktabs: Pretty Tables](https://inf.ethz.ch/personal/markusp/teaching/guides/guide-tables.pdf)
* [xparse: Powerful Commands](https://www.texdev.net/2010/05/23/from-newcommand-to-newdocumentcommand/)
* [fixmath: ISO Math](https://ctan.org/pkg/fixmath)
* [cleveref: Flexible References](https://texblog.org/2013/05/06/cleveref-a-clever-way-to-reference-in-latex/)
