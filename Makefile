.PHONY: default
default:
	$(MAKE) continuous

.PHONY: main.pdf
main.pdf:
	latexmk $(OPT) -pdf -e '$$pdflatex=q/pdflatex -shell-escape %O %S/' main

.PHONY: continuous
continuous:
	OPT="-pvc -halt-on-error" $(MAKE) main.pdf

.PHONY: clean
clean:
	latexmk -C

.PHONY: distclean
distclean: clean
	$(RM) main.pdf
