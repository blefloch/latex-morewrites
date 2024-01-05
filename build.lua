#!/usr/bin/env l3build
-- Build script for morewrites
bundle = ""
module = "morewrites"
typesetruns = 3
packtdszip  = false
checkengines = {"pdftex", "luatex", "xetex", "ptex", "uptex"}
uploadconfig = {
  author       = "Bruno Le Floch",
  ctanPath     = "/macros/latex/contrib/morewrites",
  email        = "blflatex+morewrites@gmail.com",
  license      = "lppl1.3c",
  pkg          = "morewrites",
  summary      = "Always room for a new write stream",
  uploader     = "Bruno Le Floch",
  version      = "2018-12-29",
  bugtracker   = "https://github.com/blefloch/latex-morewrites/issues",
  description  = [[The package aims to solve the error ``No room for a new \write'', which occurs when the user, or when the user's packages have `allocated too many streams' using \newwrite (TeX has a fixed maximum number - 16 - such streams built-in to its code). The package hooks into TeX primitive commands associated with writing to files; it should be loaded near the beginning of the sequence of loading packages for a document.

The package uses the l3kernel bundle.]],
  repository   = "https://github.com/blefloch/latex-morewrites",
  topic        = "io-mgmt",
  update       = true,
}
