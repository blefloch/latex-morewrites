#!/usr/bin/env texlua
-- Build script for morewrites
module = "morewrites"

kpse.set_program_name("kpsewhich")
dofile(kpse.lookup("l3build.lua"))
