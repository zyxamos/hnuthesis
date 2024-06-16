LATEXMK_ARGS=-synctex=1 -halt-on-error -time -xelatex -outdir=build -shell-escape

all: build
.PHONY: build clean

build:
	latexmk main.tex $(LATEXMK_ARGS)
	cp build/main.pdf build/main.synctex.gz .

clean:
	latexmk -C $(LATEXMK_ARGS)