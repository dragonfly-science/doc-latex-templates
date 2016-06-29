SHELL := /bin/bash
PREFIX := TEXINPUTS=.///:

all: doc.pdf presentation.pdf article.pdf report.pdf 

report.pdf: report.tex doc.sty test.bib
	$(PREFIX) xelatex report.tex
	biber report
	$(PREFIX) xelatex report.tex
	$(PREFIX) xelatex report.tex

article.pdf: article.tex doc.sty
	xelatex article.tex

presentation.pdf: presentation.tex doc.sty
	xelatex presentation.tex

doc.sty: doc.ins doc.dtx 
	latex doc.ins

doc.pdf: doc.dtx doc.sty
	xelatex doc.dtx

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
