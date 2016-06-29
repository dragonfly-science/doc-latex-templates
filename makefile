SHELL := /bin/bash
PREFIX := TEXINPUTS=.///:
LATEXMK_VERSION=$(strip $(patsubst Version,,$(shell latexmk -v | grep -oi "version.*")))
ifeq ($(LATEXMK_VERSION),4.24)
	LATEXMK_OPTIONS=-pdflatex=xelatex -latex=xelatex -pdf 
else
	LATEXMK_OPTIONS=-xelatex
endif

all: doc.pdf presentation.pdf article.pdf report.pdf 

report.pdf: report.tex doc.sty
	$(PREFIX) latexmk $(LATEXMK_OPTIONS) report.tex

article.pdf: article.tex doc.sty
	latexmk $(LATEXMK_OPTIONS) article.tex

presentation.pdf: presentation.tex doc.sty
	latexmk $(LATEXMK_OPTIONS) presentation.tex

doc.sty: doc.ins doc.dtx 
	latex doc.ins

doc.pdf: doc.dtx doc.sty
	latexmk $(LATEXMK_OPTIONS) doc.dtx

pkg:
	debuild -us -uc

.PHONY: cleanClass clean

cleanClass:
	rm -f doc.sty doc-report.cls doc-article.cls doc.pdf beamerthemeDoc.sty
		

clean: cleanClass
	rm -f  *.pdf *.aux *.log *.out *.backup *.glo *.idx \
		 *.fdb_latexmk *.fls *-self.bib *.toc *.snm *.nav \
		 *.ilg *-blx.bib *.run.xml *.bbl *.ind *.blg *.bcf \
		 *.xwm
