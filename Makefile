CC = xelatex
# CC = latexmk -xelatex -shell-escape
SRC_DIR = src
RESUME_DIR = src/resume
CV_DIR = src/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
ALLCLEANFILES = $(foreach x, *.xdv *.aux *.log *.fls *.dvi *.fdb_latexmk $(RESUME_DIR)/*.aux $(CV_DIR)/*.aux *.pdf, $(SRC_DIR)/$(x))

# make deletion work on Windows
ifdef SystemRoot
	RM = del /Q
else
	RM = rm -f
endif

.PHONY: all cover cv resume clean

all: cover cv resume

resume: $(SRC_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(SRC_DIR) $<

cv: $(SRC_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(SRC_DIR) $<

cover: $(SRC_DIR)/cover.tex
	$(CC) -output-directory=$(SRC_DIR) $<

clean:
	-@$(RM) $(ALLCLEANFILES)
