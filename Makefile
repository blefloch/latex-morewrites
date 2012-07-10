INSNAME = morewrites
DTXNAMES = morewrites primargs
TESTFILE = testfile
TESTFILETMP = $(TESTFILE).aux $(TESTFILE).mtc* $(TESTFILE).maf $(TESTFILE).mw $(TESTFILE).lo* $(TESTFILE).toc

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

all: package documentation testfile


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
