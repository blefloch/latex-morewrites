PACKAGE = morewrites
INSNAME = morewrites
DTXNAMES = morewrites primargs
TESTFILE = testfile
TESTFILETMP = $(TESTFILE).aux $(TESTFILE).mtc* $(TESTFILE).maf $(TESTFILE).mw $(TESTFILE).lo* $(TESTFILE).toc
TMPDIR = tmp.$(PACKAGE)

package:
	pdflatex $(INSNAME).ins

documentation: package
	for D in $(DTXNAMES) ; do \
	  pdflatex $$D.dtx ; \
	  makeindex -s gglo.ist -o $$D.gls $$D.glo ; \
	  makeindex -s gind.ist -o $$D.ind $$D.idx ; \
	  pdflatex $$D.dtx ; \
	  pdflatex $$D.dtx ; \
	done

testfile:
	pdflatex $(TESTFILE)

tds: package documentation
	rm -rf $(TMPDIR)
	mkdir -p $(TMPDIR)/tex/latex/$(PACKAGE)
	mkdir -p $(TMPDIR)/doc/latex/$(PACKAGE)
	mkdir -p $(TMPDIR)/source/latex/$(PACKAGE)
	cp README $(TMPDIR)/doc/latex/$(PACKAGE)/
	cp $(INSNAME).ins $(TMPDIR)/source/latex/$(PACKAGE)/
	for D in $(DTXNAMES) ; do \
	  cp $$D.dtx $(TMPDIR)/source/latex/$(PACKAGE)/ ; \
	  cp $$D.pdf $(TMPDIR)/doc/latex/$(PACKAGE)/ ; \
	  cp $$D.sty $(TMPDIR)/tex/latex/$(PACKAGE)/ ; \
	done
	(cd $(TMPDIR) && zip -9r ../$(PACKAGE).tds.zip *)

all: package documentation testfile tds clean

clean:
	@echo \
"The next command will probably produce an error, because it will try to\n\
delete non-existent files. This is not a problem."
	-for D in $(DTXNAMES) ; do \
	  rm $$D.aux $$D*.cmds $$D*.cpt $$D.dvi \
	  $$D.glo $$D.gls $$D.hd $$D.idv \
	  $$D.idx $$D.ilg $$D.ind $$D.lg \
	  $$D.log $$D.mw $$D.out $$D.tmp \
	  $$D.toc $$D.xref $$D.4ct $$D.4tc \
	  > /dev/null 2>&1 ; \
	done
	-rm $(TESTFILETMP) > /dev/null 2>&1
	-rm -rf $(TMPDIR)
