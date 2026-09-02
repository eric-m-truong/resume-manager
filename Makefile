.PHONY: all clean

PDF = resume.pdf
TEX = main.tex
JPGDIR = jpg

all: jpgs

$(PDF): $(TEX)
	pdflatex -interaction=nonstopmode -halt-on-error $(TEX)
	@mv main.pdf $(PDF)

jpgs: $(PDF)
	pdftoppm -jpeg -r 100 $(PDF) $(JPGDIR)/tmp
	@mv -f $(JPGDIR)/tmp-1.jpg $(JPGDIR)/CV_page_1.jpg
	@mv -f $(JPGDIR)/tmp-2.jpg $(JPGDIR)/CV_page_2.jpg
	@rm -f $(JPGDIR)/tmp-*.jpg

clean:
	rm -f $(PDF) *.aux *.log *.out
