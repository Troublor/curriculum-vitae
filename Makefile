.PHONY: build
build: prepare
	lualatex -shell-escape -interaction=nonstopmode -output-directory=out cv.tex

.PHONY: release
release: build
	cp out/cv.pdf release/cv-`date +%Y-%m-%d`.pdf
	cp release/cv-`date +%Y-%m-%d`.pdf release/cv-latest.pdf

.PHONY: prepare
prepare:
	mkdir -p out release

.PHONY: clean
clean:
	rm -rf out