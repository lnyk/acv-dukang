# Ennable -shell-escape for minted package
CC = latexmk -xelatex -shell-escape
BASE_DIR = src

DOC_SRC = $(BASE_DIR)/dukang-doc.tex
DOC_DIR = $(BASE_DIR)/dukang-doc

MAIN_DIR = $(BASE_DIR)/tex
MAIN_SRC = $(shell find $(MAIN_DIR) -name '*.tex')

CLEANFILES = $(foreach x, *.pyg *.listing *.xdv *.aux *.log *.fls *.dvi *.fdb_latexmk $(DOC_DIR)/*.aux $(MAIN_DIR)/*.aux, $(BASE_DIR)/$(x))

# make deletion work on Windows
ifdef SystemRoot
	RM = del /Q
else
	RM = rm -f
endif

.PHONY: main doc all clean cleanall

make: main

main: $(BASE_DIR)/main.tex
	make -C $(BASE_DIR)/resource/ -f Makefile all
	$(CC) -output-directory=$(BASE_DIR) $<

doc: $(BASE_DIR)/dukang-doc.tex
	make -C $(BASE_DIR)/resource/ -f Makefile all
	$(CC) -output-directory=$(BASE_DIR) $<

resource:
	make -C $(BASE_DIR)/resource/ -f Makefile all

all: main doc

clean:
	-@$(RM) $(CLEANFILES)
	-@$(RM) -r dist _minted*
	make -C $(BASE_DIR)/resource/ -f Makefile clean

cleanall:
	-@$(RM) $(CLEANFILES) $(BASE_DIR)/*.pdf
	-@$(RM) -r $(BASE_DIR)/dist $(BASE_DIR)/_minted*
	make -C $(BASE_DIR)/resource/ -f Makefile cleanall
