# uiucthesis2020

This is a version of [uiucthesis2014](https://github.com/mayhewsw/uiucthesis2014)
with some updates to the new decade. The main
[official requirements](https://grad.illinois.edu/thesis/format) should still
be respected (feel free to file a bug otherwise).

At a technical level, a few things have changed in the class implementation:

* it was updated to more recent versions of LaTeX with less care about
backwards compatibility.
* it is now based on `srcbook` from *KOMA-Script* instead of the default
`book` document class.
* it is hopefully a bit better documented and easier to read.

The available options were also trimmed a bit. There are

* `draftthesis`: this option adds a header with the date at which the
  document was compiled and line numbers for easier review. It also disables
  the initial copyright page. It should be removed before submitting the
  final manuscript.
* `edeposit`: used for online (electronic) deposits. The main effect of this
  option is to turn off the default two-sided page style.
* `doublespacing`: use double spacing instead of the default 1.5 spacing
  between lines.
* any additional options are passed directly to the underlying `srcbook` class.

An example document is provided in `thesis.tex` and can be easily built with
```bash
make thesis.pdf
```
