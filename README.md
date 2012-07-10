Provide more writing streams in LaTeX
=====================================
* E-mail: blflatex@gmail.com
* Released under the LaTeX Project Public License v1.3c or later
  See http://www.latex-project.org/lppl.txt

The morewrites LaTeX package should be used when encountering the
`No room for a new \write ` error.  This is done by redefining a
few TeX primitives related to output.

This package uses the `expl3` bundle.

This is work in progress, all suggestions/comments/bug reports are
welcome!


The package is extracted by running

    pdflatex morewrites.ins

The documentation is produced by running

    pdflatex morewrites.dtx
    makeindex -s gglo.ist -o morewrites.gls morewrites.glo
    makeindex -s gind.ist -o morewrites.ind morewrites.idx
    pdflatex morewrites.dtx
    pdflatex morewrites.dtx



