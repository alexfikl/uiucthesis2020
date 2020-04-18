# UIUC Thesis Template 2020

This is a version of [uiucthesis2014](https://github.com/mayhewsw/uiucthesis2014)
with some updates to the new decade. The main
[official requirements](https://grad.illinois.edu/thesis/format) should still
be respected (feel free to file a bug otherwise).

At a technical level, a few things have changed in the class implementation:

* it was updated to more recent versions of LaTeX with less care about
  backwards compatibility.
* it is now based on `srcbook` from *KOMA-Script* instead of the default
  `book` document class.
* the actual code class is hopefully easier to read, since a lot of weird
  custom spacing code was removed and replaced with `scrlayer-scrpage`
  and `tocbasic` utilities.

An example document is provided in `thesis.tex` and can be easily built with
```bash
make example
```
The provided documentation can also be built with
```bash
make docs
```

# References

Some recommended reading

* [Typography with microtype](http://www.khirevich.com/latex/microtype/)
* [Tables with booktabs](https://inf.ethz.ch/personal/markusp/teaching/guides/guide-tables.pdf)
* [Powerful Commands with xparse](https://www.texdev.net/2010/05/23/from-newcommand-to-newdocumentcommand/)
* [ISO Math with fixmath](https://ctan.org/pkg/fixmath)
* [References with cleveref](https://texblog.org/2013/05/06/cleveref-a-clever-way-to-reference-in-latex/)
