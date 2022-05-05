DELAY = 80
DENSITY = 300
WIDTH = 500

# 所有需要自动编译的.tex文件必须以r-开头，用于在cleanall时避免误删其他文件
RESOURCEFILES = $(wildcard r-*.tex)

TEMPFILES = *.class *.html *.log *.aux *.fdb_latexmk *.fls *.xdv
ALLFILES = $(TEMPFILES) r-*.pdf

.PHONY: all clean cleanall

make: all

ifeq ($(RESOURCEFILES),)
all:
else
all:
	latexmk -xelatex $(RESOURCEFILES)
endif

clean:
	rm -rf $(TEMPFILES)

cleanall:
	rm -rf $(ALLFILES)

gif:
	pdfcrop $(SOURCE).pdf
	convert -verbose -delay $(DELAY) -loop 0 -density $(DENSITY) $(SOURCE)-crop.pdf $(SOURCE).gif
	make clean

png:
	make
	make svg
	inkscape $(SOURCE).svg -w $(WIDTH) --export-png=$(SOURCE).png

transparentGif:
	convert $(SOURCE).pdf -transparent white result.gif
	make clean

svg:
	make
	#inkscape $(SOURCE).pdf --export-plain-svg=$(SOURCE).svg
	pdf2svg $(SOURCE).pdf $(SOURCE).svg
	# Necessary, as pdf2svg does not always create valid svgs:
	inkscape $(SOURCE).svg --export-plain-svg=$(SOURCE).svg
