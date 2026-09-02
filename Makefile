.PHONY: all clean

PDF = resume.pdf
TEX = main.tex

all: $(PDF)

$(PDF): $(TEX)
	pdflatex -interaction=nonstopmode -halt-on-error $(TEX)
	@mv main.pdf $(PDF)

clean:
	rm -f $(PDF) *.aux *.log *.out
