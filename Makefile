CC = xelatex
# CC = latexmk -xelatex -shell-escape
BASE_DIR = src

DOC_SRC = $(BASE_DIR)/dukang.tex
DOC_DIR = $(BASE_DIR)/dukang

MAIN_DIR = $(BASE_DIR)/tex
MAIN_SRC = $(shell find $(MAIN_DIR) -name '*.tex')

CLEANFILES = $(foreach x, *.xdv *.aux *.log *.fls *.dvi *.fdb_latexmk $(DOC_DIR)/*.aux $(MAIN_DIR)/*.aux, $(BASE_DIR)/$(x))

# make deletion work on Windows
ifdef SystemRoot
	RM = del /Q
else
	RM = rm -f
endif

.PHONY: main doc all clean cleanall

main: $(BASE_DIR)/main.tex
	$(CC) -output-directory=$(BASE_DIR) $<

doc: $(BASE_DIR)/dukang.tex
	$(CC) -output-directory=$(BASE_DIR) $<

all: main doc

clean:
	-@$(RM) $(CLEANFILES)

cleanall:
	-@$(RM) $(CLEANFILES) $(BASE_DIR)/*.pdf
