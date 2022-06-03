# 所有需要自动编译的.tex文件必须以r-开头
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
