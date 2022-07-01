# 由于部分命令使用了minted包，需要打开-shell-escape
CC = latexmk -xelatex -shell-escape -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1
# 所有需要自动编译的.tex文件必须以r-开头
NAMEFORMAT = r-*
TEXFILES = $(wildcard $(NAMEFORMAT).tex)
CLEANFILES = $(NAMEFORMAT).pdf

# 定义删除时候使用的命令，用于同时支持Windows和Linux
ifdef SystemRoot
	RM = del /Q
else
	RM = rm -fr
endif

.PHONY: all

make: all

# 如果没有任何资源文件，则跳过编译
ifeq ($(TEXFILES),)
all:
else
all:
	$(CC) $(TEXFILES)
endif

cleanall:
	-@$(RM) $(CLEANFILES)
