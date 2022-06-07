# 所有需要自动编译的.tex文件必须以r-开头
NAMEFORMAT = r-*
TEXFILES = $(wildcard $(NAMEFORMAT).tex)
CLEANFILES = $(NAMEFORMAT).pdf

.PHONY: all

make: all

# 如果没有任何资源文件，则跳过编译
ifeq ($(TEXFILES),)
all:
else
all:
	latexmk -xelatex $(TEXFILES)
endif

cleanall:
	-@$(RM) $(CLEANFILES)
