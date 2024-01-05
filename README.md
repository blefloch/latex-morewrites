Always room for a new write stream
=====================================
* E-mail: blflatex@gmail.com
* Released under the LaTeX Project Public License v1.3c or later
  See http://www.latex-project.org/lppl.txt

The morewrites package silently hooks into the TeX primitives
responsible for writing to files to lift the restriction on
the number of files open at the same time (16). Load the package
with `\usepackage{morewrites}` as early as possible to avoid the
`No room for a new \write ` error.

Suggestions/comments/bug reports welcome at
https://github.com/blefloch/latex-morewrites


