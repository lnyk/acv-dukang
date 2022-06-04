# 默认使用xelatex进行编译
# 由于部分命令使用了minted包，需要打开-shell-escape
CC = latexmk -xelatex -shell-escape
# 源码根目录
BASE_DIR = src
# 项目文档的主文件
DOC_SRC = $(BASE_DIR)/dukang-doc.tex
# 所有需要自动清理的文件
CLEANDIRS = . $(BASE_DIR) $(foreach d, resource tex dukang-doc, $(BASE_DIR)/$(d))
CLEANFILES = $(foreach x, *.pyg *.listing *.xdv *.aux *.log *.fls *.dvi *.fdb_latexmk .auctex* dist _minted*, $(x))

# 定义删除时候使用的命令，用于同时支持Windows和Linux
ifdef SystemRoot
	RM = del /Q
else
	RM = rm -fr
endif

# 以下是定义的所有编译命令
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
	@for d in $(CLEANDIRS); \
	do \
		for f in $(CLEANFILES); \
		do \
			$(RM) $$d/$$f; \
		done \
	done

cleanall: clean
	-@$(RM) $(BASE_DIR)/*.pdf
	make -C $(BASE_DIR)/resource/ -f Makefile cleanall
