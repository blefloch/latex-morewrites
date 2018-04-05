#!/usr/bin/env texlua
-- Build script for morewrites
module = "morewrites"
packtdszip  = false

kpse.set_program_name("kpsewhich")
dofile(kpse.lookup("l3build.lua"))
