% !TeX encoding = UTF-8
% !TeX program = xelatex
% !TeX spellcheck = en_US
%% Start of file `awesome-cv-dukang.cls'.


%-------------------------------------------------------------------------------
% Awesome-CV-Dukang Class File
%
% This class has been downloaded from:
% https://github.com/lnyk/awesome-cv-dukang
%
% Author:
% William Yao <me@williamyao.com>
% https://www.williamyao.com
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%-------------------------------------------------------------------------------


%-------------------------------------------------------------------------------
% 定义开始
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[2021-11-15]
\ProvidesClass{acv-dukang}[2022-04-28 Awesome-CV-Dukang]
% 传递参数到awesome-cv
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{awesome-cv}}
% 处理参数
\ProcessOptions\relax
% 激活xcolor宏包的table选项，用于支持tabular环境的颜色配置
\PassOptionsToPackage{table}{xcolor}
% 最后加载awesome-cv文档类
\LoadClass{awesome-cv}
%-------------------------------------------------------------------------------
% 基础依赖部分
%
% 所有功能包的引入、依赖和设定都放在这个部分
%-------------------------------------------------------------------------------
% ctex
% 加载中文环境支持
%
% 选项：
%   fontset
%     定义中文环境使用的字体，可选项为：
%       adobe, fandol, founder, mac, macnew,
%       macold, ubuntu, windows, none, <自定义>
%       其中如果指定自定义名称的配置，需配合ctex-fontset-<自定义>.def使用
% 说明：
%   本项目默认使用自定义字体文件进行编译，更多细节可查看ctex-fontset-custom.def
%   所用字体为：
%     Adobe 黑体 Std, Adobe 楷体 Std, Adobe 仿宋 Std, Adobe 宋体 Std,
%     幼圆, 隶书, 方正小标宋, YaHei Consolas Hybrid, Inconsolata
%   上述字体如果系统未安装，请自行下载安装，或根据需要自行变更
\RequirePackage[scheme=chinese, fontset=custom, UTF8]{ctex}
\ctexset{
  today=big,
  space=false,
}
%-------------------------------------------------------------------------------
% minted
% 使用minted实现代码高亮
%
% 选项：
%   cache=true
%     缓存目录
%     如果开启缓存，有可能会出现undefined control sequence错误
%     解决办法，要么在重新编译前，删除_minted-*缓存目录，要么关闭缓存
%     自动删除已添加到Makefile的make clean以及make cleanall命令中，无需手动删除
%     如果关闭缓存，风格指定将出现错误，当前可行的最佳做法依然是打开缓存，
%     使用make联动清理缓存目录
% \RequirePackage[cache=false, outputdir=src]{minted}
\RequirePackage[outputdir=src]{minted}
%-------------------------------------------------------------------------------
% minted的全局样式设定
% 以下设定即可以放在导言区，也可以在文档区随用随定义
%
% 指定所有语言的全局高亮样式
%   \usemintedstyle{minted_style}
%
% 单独指定语言的全局高亮样式
%   \usemintedstyle[lang]{minted_style}
%
% 单独指定语言的行内代码样式
%   \newmintinline{lang}{option}
%   其中option选项可为：
%     showspaces 将空格显式的打印出来
%
% 说明：
%   lang
%     Pygments支持超过300种编程语言的语法高亮，具体列表请使用下面命令查看
%       pygmentize -L lexers
%   minted_style
%     可选，minted预定义的高亮样式，默认为tango，可选项请使用下面命令查看
%       pygmentize -L styles
%-------------------------------------------------------------------------------
% tcolorbox
% 引入tcolorbox的库
\tcbuselibrary{skins, listings, xparse, breakable, minted}
%-------------------------------------------------------------------------------
% tcolorbox的全局设定
\tcbset{
  % \baselineskip是根据默认字号对应的默认行距
  % 由于ctex的中文行距是1.56（1.3）倍字体高度，所以英文单倍行距需要0.641\baselineskip
  % \singlespacing是默认单倍行距的命令
  % code={...}是tcolorbox的选项之一，可以指定要执行的命令
  % code的作用域是tcolorbox的整体，包括标题行、upper和lower
  % 所以经过测试之后，效果最好的是使用before upper和\fontsize来直接指定字号和行距
  % 否则标题行也会被影响
  % 指定字号和行距
  before upper=\fontsize{10pt}{10pt}\selectfont,
  before={\vspace{0.641\baselineskip}},
  % 指定字体
  fontupper=\sffamily,
  default minted options={tabsize=2,breaklines,linenos,numbersep=3mm},
}
%-------------------------------------------------------------------------------
% tabular
% 用于支撑tcblisting环境
\RequirePackage{tabularx}
\newcolumntype{\CeX}{>{\centering\let\newline\\\arraybackslash}X}%
\newcommand{\TwoSymbolsAndText}[3]{%
  \begin{tabularx}{\textwidth}{c\CeX c}%
    #1 & #2 & #3
  \end{tabularx}%
}
%-------------------------------------------------------------------------------
% dirtree
% 用于在文档中以漂亮的方式显示文件目录树
\RequirePackage{dirtree}
% 设置字体
\renewcommand*\DTstylecomment{\sffamily}
\renewcommand*\DTstyle{\sffamily}
%-------------------------------------------------------------------------------
% lcg
% 该包会生成随机数，主要用于文档各部分书签标签的随机生成
% 用法：
%   \usepackage[first=-100, last=100]{lcg}
%   如果不指定边界，则默认会生成[1, 2^31-1]区间内的随机数
% 这里定义了\random命令，可以简化\arabic{}的调用
% 否则，\rand生成的是数值类型，只有调用\arabic才能转换成字符串输出到文档
%
% 需要手动创建dk@random计数器，否则会存储不成功
\newcounter{dk@random}
% 指定存储计数器为dk@random，lcg宏包的默认计数器为rand
\RequirePackage[counter=dk@random]{lcg}
% 创建\random命令，方便直接将随机数输出至文档字符串
\newcommand{\random}{\rand\arabic{dk@random}}
%-------------------------------------------------------------------------------
% 脚注
\RequirePackage[perpage,symbol*]{footmisc}
% 修改脚注数字为圆圈数字
\RequirePackage{pifont}
\renewcommand\thefootnote{\ding{\numexpr171+\value{footnote}}}
% 修改脚注字体
\renewcommand{\footnotesize}{\fontsize{10pt}{\baselineskip}\sffamily\selectfont}
%-------------------------------------------------------------------------------
% figure设置
%-------------------------------------------------------------------------------
% 引入figure包用于支持dkresource命令
\RequirePackage{caption}
% 定义新的标签格式，#1为标签名（图），#2为分隔符（：），#3为标签内容
\DeclareCaptionFormat{colordotcap}{\makebox[\textwidth][c]{\#~#3~\#}}
\captionsetup[figure]{%
  % 使用上面的自定义标签格式
  format=colordotcap,
  % 设置字体，stretch是行距的倍数
  font={small,sf,stretch=1},
}
%-------------------------------------------------------------------------------
% fancyvrb设置
\RequirePackage{fancyvrb}
\DefineShortVerb{\|}
%-------------------------------------------------------------------------------
% layouts设置
%
% 用于支持\dkmeasure命令，打印一些测量数值
%-------------------------------------------------------------------------------
\RequirePackage{layouts}
%-------------------------------------------------------------------------------
% pgffor
%
% 用于支持foreach循环
\RequirePackage{pgffor}
%-------------------------------------------------------------------------------
% 表格环境
%
% 用于支持长表格环境
\RequirePackage{longtable}
% 支持给p{len}标记的列指定对齐方式
\RequirePackage{array}
% 支持landscape模式，把页面横过来
\RequirePackage{lscape}
% 支持表格中跨行
\RequirePackage{multirow}
% 表格中的反斜线
\RequirePackage{diagbox}
%-------------------------------------------------------------------------------
% \RequirePackage[utf8]{inputenc}


%-------------------------------------------------------------------------------
% Awesome-CV 定义修改部分
%
% 包含所有对Awesome-CV<.cls>非侵入的修改内容
%-------------------------------------------------------------------------------
% 自定义开关
%-------------------------------------------------------------------------------
% dukangParIndent
% 添加某些正文部分的首行缩进开关
\newbool{dukangParIndent}
\setbool{dukangParIndent}{true}
% 是否为PDF书签添加标题前的标号
\newbool{dukangBookmarkLeadingNumber}
\setbool{dukangBookmarkLeadingNumber}{true}
%-------------------------------------------------------------------------------
% 自定义配置
%-------------------------------------------------------------------------------
% 定义首页主标题的书签
%-------------------------------------------------------------------------------
\newcommand*{\dukangPDFTitle}[1]{%
  \bookmark[named=FirstPage, level=-1, view={FitH \calc{\paperheight-\topmargin-10pt}}]{#1}%
}
%-------------------------------------------------------------------------------
% 以下计数器用于支持PDF书签标题开头的编号
%-------------------------------------------------------------------------------
\ifbool{dukangBookmarkLeadingNumber}{%
  \newcounter{dk@counter@section}
  \setcounter{dk@counter@section}{0}
  \newcounter{dk@counter@subsection}
  \setcounter{dk@counter@subsection}{0}
  \newcounter{dk@counter@subsubsection}
  \setcounter{dk@counter@subsubsection}{0}
}{}
%-------------------------------------------------------------------------------
% 自定义命令
%
% 所有自定义命令的具体实现都放在该部分
%-------------------------------------------------------------------------------
% dk
% 定义一个简短的命令用于显示完整名称
\newcommand{\dk}{\hyperref{https://williamyao.com}{}{}{\sffamily ACV-Dukang}}
%-------------------------------------------------------------------------------
% 利用随机数生成器指定书签标签
%-------------------------------------------------------------------------------
% 用法（subsection及subsubsection参照此处）：
%   \dk@bookmark@section<[level]>{section_title}
%
% 说明：
%   level
%     可选，表示书签列表的层级，默认为1，（因为文档主标题为0）
%   section_title
%     section的标题，同时也是书签的文字内容
%-------------------------------------------------------------------------------
\newcommand*{\dk@bookmark@section}[2][1]{%
  % 使用随机数生成器直接对应标签和书签
  % 先调用一次lcg宏包的\rand命令，将生成的随机数保存在定义时的计数器中
  \rand
  \ifbool{dukangBookmarkLeadingNumber}{%
    % 如果指定需要编号，则调用自定义计数器来进行手动编号
    % 新开启section时，先重置subsection计数器
    \setcounter{dk@counter@subsection}{0}
    % 对应的计数器在命令外定义
    \stepcounter{dk@counter@section}
    % 使用\arabic调用计数器，否则读出来的是数值，不是文档字符串输出
    % \hypertarget创建的是标签，后面指定的样式对应的是正文中输出的样式
    \hypertarget{\arabic{dk@random}}{\sectionstyle{#2}}
    % \bookmark创建的是对应标签的书签，后面指定的样式是PDF阅读器中书签目录中对应书签的样式
    \bookmark[dest=\arabic{dk@random}, level=#1, view={FitH \calc{\paperheight-\topmargin-10pt}}]{\arabic{dk@counter@section}~~~~#2}%
  }{%
    % 如果不用编号
    % \hypertarget创建的是标签，后面指定的样式对应的是正文中输出的样式
    \hypertarget{\arabic{dk@random}}{\sectionstyle{#2}}
    % \bookmark创建的是对应标签的书签，后面指定的样式是PDF阅读器中书签目录中对应书签的样式
    \bookmark[dest=\arabic{dk@random}, level=1, view={FitH \calc{\paperheight-\topmargin-10pt}}]{#2}
  }
}
%-------------------------------------------------------------------------------
\newcommand*{\dk@bookmark@subsection}[2][2]{%
  % 使用随机数生成器直接对应标签和书签
  % 先调用一次lcg宏包的\rand命令，将生成的随机数保存在定义时的计数器中
  \rand
  \ifbool{dukangBookmarkLeadingNumber}{%
    % 如果指定需要编号，则调用自定义计数器来进行手动编号
    % 新开启subsection时，先重置subsubsection计数器
    \setcounter{dk@counter@subsubsection}{0}
    % 对应的计数器在命令外定义
    \stepcounter{dk@counter@subsection}
    % 使用\arabic调用计数器，否则读出来的是数值，不是文档字符串输出
    % \hypertarget创建的是标签，后面指定的样式对应的是正文中输出的样式
    \hypertarget{\arabic{dk@random}}{\subsectionstyle{#2}}
    % \bookmark创建的是对应标签的书签，后面指定的样式是PDF阅读器中书签目录中对应书签的样式
    \bookmark[dest=\arabic{dk@random}, level=#1, view={FitH \calc{\paperheight-\topmargin-10pt}}]{\arabic{dk@counter@section}.\arabic{dk@counter@subsection}~~~~#2}%
  }{%
    % 如果不用编号
    % \hypertarget创建的是标签，后面指定的样式对应的是正文中输出的样式
    \hypertarget{\arabic{dk@random}}{\subsectionstyle{#2}}
    % \bookmark创建的是对应标签的书签，后面指定的样式是PDF阅读器中书签目录中对应书签的样式
    \bookmark[dest=\arabic{dk@random}, level=1, view={FitH \calc{\paperheight-\topmargin-10pt}}]{#2}
  }
}
%-------------------------------------------------------------------------------
\newcommand*{\dk@bookmark@subsubsection}[2][3]{%
  % 使用随机数生成器直接对应标签和书签
  % 先调用一次lcg宏包的\rand命令，将生成的随机数保存在定义时的计数器中
  \rand
  \ifbool{dukangBookmarkLeadingNumber}{%
    % 如果指定需要编号，则调用自定义计数器来进行手动编号
    % 对应的计数器在命令外定义
    \stepcounter{dk@counter@subsubsection}
    % 使用\arabic调用计数器，否则读出来的是数值，不是文档字符串输出
    % \hypertarget创建的是标签，后面指定的样式对应的是正文中输出的样式
    \hypertarget{\arabic{dk@random}}{\subsubsectionstyle{#2}}
    % \bookmark创建的是对应标签的书签，后面指定的样式是PDF阅读器中书签目录中对应书签的样式
    \bookmark[dest=\arabic{dk@random}, level=#1, view={FitH \calc{\paperheight-\topmargin-10pt}}]{\arabic{dk@counter@section}.\arabic{dk@counter@subsection}.\arabic{dk@counter@subsubsection}~~~~#2}%
  }{%
    % 如果不用编号
    % \hypertarget创建的是标签，后面指定的样式对应的是正文中输出的样式
    \hypertarget{\arabic{dk@random}}{\subsubsectionstyle{#2}}
    % \bookmark创建的是对应标签的书签，后面指定的样式是PDF阅读器中书签目录中对应书签的样式
    \bookmark[dest=\arabic{dk@random}, level=1, view={FitH \calc{\paperheight-\topmargin-10pt}}]{#2}
  }
}
%-------------------------------------------------------------------------------


%-------------------------------------------------------------------------------
% 重定义Awesome-CV的部分命令
%-------------------------------------------------------------------------------
% Awesome section color
%
% 重新定义section标题的高亮显示部分
% 原始定义为#1#2#3，即为将前三个字符进行高亮处理
% 这里修改为#1#2#3#4，即前四个字符，更符合中文习惯
% 可以为#1，表示有第一个字符高亮，而不是整个字符串
%
% 注意：
%   由于原版默认为前三个英文字母，对于后续空格没有进行处理，所以如果在高亮范围内有空格，
%   需要显式声明该空格，比如使用~符号。
%-------------------------------------------------------------------------------
\def\@sectioncolor#1#2{%
  \ifbool{acvSectionColorHighlight}{{\color{awesome}#1#2}}{#1#2}%
}
%-------------------------------------------------------------------------------
% lettersection
%-------------------------------------------------------------------------------
\renewcommand{\lettersection}[1]{%
  % 重置首行缩进为0，适应单独设置\noindent的情况
  \setlength{\parindent}{0em}
  \par\addvspace{2.5ex}
  \phantomsection{}
  \dk@bookmark@section{#1}
  \color{sectiondivider}\vhrulefill{0.9pt}
  \par\nobreak\addvspace{0.4ex}
  \ifbool{dukangParIndent}{% if
    % 设定首行缩进为2em
    \setlength{\parindent}{2em}
  }{% else
    % 用于解决cvparagraph紧接着cvsection
    % 如果中间没有空行，会没有段落标记，造成编译失败，读不到\end{document}
    \setlength{\parindent}{0em}
  }
  \lettertextstyle
}
%-------------------------------------------------------------------------------
% cvparagraph
%-------------------------------------------------------------------------------
% 重新定义paragraphstyle，不指定字体大小，使用默认设置
\renewcommand*{\paragraphstyle}{\bodyfont\upshape\color{text}}
% 重新定义cvparagraph环境，调整\par的位置，解决与分割线同行的问题
\renewenvironment{cvparagraph}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  % 增加\par，解决cvparagraph紧接着cvsection，内容会出现在分割线同一行的情况
  \par\paragraphstyle
}{} % 注意这里结尾的{}
%-------------------------------------------------------------------------------
% cvsection
%-------------------------------------------------------------------------------
\renewcommand*{\sectionstyle}[1]{{\fontsize{14pt}{1em}\bodyfont\fzxbs\color{text}\@sectioncolor #1}}
\renewcommand{\cvsection}[1]{%
  \vspace{\acvSectionTopSkip}
  \setlength{\parskip}{0em}
  % 重置首行缩进为0，适应单独设置\noindent的情况
  \setlength{\parindent}{0em}
  \phantomsection{}
  \dk@bookmark@section{#1}
  \color{sectiondivider}\vhrulefill{0.9pt}
  % \par\nobreak\addvspace{0.4ex}
  \ifbool{dukangParIndent}{% if
    % 设定首行缩进为2em
    \setlength{\parindent}{2em}
  }{% else
    \setlength{\parindent}{0em}%
  }
  % 用于解决cvparagraph紧接着cvsection
  % 如果中间没有空行，会没有段落标记，造成编译失败，读不到\end{document}
  \vspace{\acvSectionContentTopSkip}
  \par\paragraphstyle
}
%-------------------------------------------------------------------------------
% cvsubsection
%-------------------------------------------------------------------------------
\renewcommand*{\subsectionstyle}[1]{{\fontsize{12pt}{1em}\bodyfont\fzxbs\color{text}\@sectioncolor #1}}
\renewcommand{\cvsubsection}[1]{%
  \vspace{0.641\baselineskip}
  % \vspace{\baselineskip}
  \setlength{\parskip}{0em}
  \setlength{\parindent}{0em}
  \dk@bookmark@subsection{#1}
  \ifbool{dukangParIndent}{% if
    % 设定首行缩进为2em
    \setlength{\parindent}{2em}
  }{% else
    \setlength{\parindent}{0em}%
  }
  \phantomsection
  % 用于解决cvparagraph紧接着cvsection
  % 如果中间没有空行，会没有段落标记，造成编译失败，读不到\end{document}
  \par
}
%-------------------------------------------------------------------------------
% cvsubsubsection
%-------------------------------------------------------------------------------
\newcommand*{\subsubsectionstyle}[1]{{\fontsize{10pt}{1em}\bodyfont\fzxbs\color{text}\@sectioncolor #1}}
\newcommand{\cvsubsubsection}[1]{%
  \vspace{0.641\baselineskip}
  % \vspace{\baselineskip}
  \setlength{\parskip}{0em}
  \setlength{\parindent}{0em}
  \dk@bookmark@subsubsection{#1}
  \ifbool{dukangParIndent}{% if
    % 设定首行缩进为2em
    \setlength{\parindent}{2em}
  }{% else
    \setlength{\parindent}{0em}%
  }
  \phantomsection
  % 用于解决cvparagraph紧接着cvsection
  % 如果中间没有空行，会没有段落标记，造成编译失败，读不到\end{document}
  \par
}
% -------------------------------------------------------------------------------
% cvskills
%
% 参数说明：
%   * 打开颜色支持
%-------------------------------------------------------------------------------
\renewcommand*{\skilltypestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\renewcommand*{\skillsetstyle}[1]{{\fontsize{10pt}{1em}\bodyfont\color{text} #1}}
% 定义宏，解析4个参数，使用IfBoolenTF解析*
\def\dk@parse@cvskillalignment#1#2#3{%
  \begin{tabular*}{\textwidth}{#2{0.12\textwidth} #3{\IfBooleanTF{#1}{0.83\textwidth}{0.83\textwidth + \tabcolsep}}}
}
\DeclareDocumentEnvironment{cvskills}{ s O{RL} }
{%
  \vspace{0.641\baselineskip}
  % 使用spacing包控制单元格内的line之间的距离
  \begin{spacing}{1}
    \begin{center}
      % 判断第一个可选参数是否带*，设置底色和表格内边距
      \IfBooleanT{#1}{% 如果带*
        % 从第1行开始，奇数行颜色，偶数行颜色
        \rowcolors{1}{awesome!10}{awesome!5}
      }
      \setlength\tabcolsep{1ex}%
      \setlength{\extrarowheight}{0pt}
      % 控制表格的row之间的距离
      \renewcommand{\arraystretch}{1.5}
      \dk@parse@cvskillalignment #1#2
}{%
      \end{tabular*}
    \end{center}
  \end{spacing}
  \vspace{0.641\baselineskip}
}
%-------------------------------------------------------------------------------
% cventries
%-------------------------------------------------------------------------------
% 重新定义字体颜色和风格
% 1.56em为中文环境的标准行距，或者设置为1.3em也较为合适
\renewcommand*{\entrytitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\renewcommand*{\entrylocationstyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\slshape\color{awesome} #1}}
\renewcommand*{\entrypositionstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\color{graytext} #1}}
\renewcommand*{\entrydatestyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\renewcommand*{\descriptionstyle}[1]{{\fontsize{10pt}{1.3em}\bodyfontlight\color{text} #1}}
% 修改cventry参数及顺序，简化使用方式
\DeclareDocumentCommand{\cventry}{ O{} O{} O{} O{} m }{%
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \ifempty{#3#4}{%
      \entrytitlestyle{#1} & \entrylocationstyle{#2} \\
    }{%
      \entrytitlestyle{#1} & \entrylocationstyle{#2} \\
      \entrypositionstyle{#3} & \entrydatestyle{#4} \\
    }
    \multicolumn{2}{L{\textwidth}}{\begin{cvitems}\descriptionstyle{#5}\end{cvitems}}
  \end{tabular*}%
}
% -------------------------------------------------------------------------------
% cvhonors & cvhonor
%
% cvhonors支持3个列对齐方式的可选调整参数及行色开关
%
% 参数说明：
%   * 打开颜色支持
%   L 左对齐，C 居中对齐，R 右对齐
%
% 例如：
%   \begin{cvhonors} % 使用默认参数，无底色，LLR对齐
%   \begin{cvhonors}[LLR] % 同上
%   \begin{cvhonors}* % 打开底色开关
%   \begin{cvhonors}*[CLC] % 打开底色开关，并且1列居中，2列左对齐，3列居右
%
% 注意：
%   参数要么不写，要么3列都需要指定
%   -------------------------------------------------------------------------------
% 定义宏，解析4个参数，使用IfBoolenTF解析*
\def\dk@parse@cvhonoralignment#1#2#3#4{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} #2{3cm} #3{\textwidth - \IfBooleanTF{#1}{7.0cm}{6.0cm}} #4{3cm}}
}
% 使用xparse重定义cvhonor环境，支持可选默认值参数用来指定3个部分的对齐方式
\DeclareDocumentEnvironment{cvhonors}{ s O{LLR} }
{%
  \vspace{0.641\baselineskip}
  % 使用spacing包控制单元格内的line之间的距离
  \begin{spacing}{1}
    \begin{center}
      % 判断第一个可选参数是否带*，设置底色和表格内边距
      \IfBooleanTF{#1}{% 如果带*
        % 从第1行开始，奇数行颜色，偶数行颜色
        \rowcolors{1}{awesome!10}{awesome!5}
        \setlength\tabcolsep{0.2cm}%
      }{% 否则
        \setlength\tabcolsep{0cm}
      }
      \setlength{\extrarowheight}{0pt}
      % 控制表格的row之间的距离
      \renewcommand{\arraystretch}{1.5}
      % 调用自定义宏，#1和#2全部传递过去
      \dk@parse@cvhonoralignment #1#2
}{%
      \end{tabular*}
    \end{center}
  \end{spacing}
  \vspace{\baselineskip}
}
% 重新定义3个风格
\renewcommand*{\honorpositionstyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{text} #1}}
\renewcommand*{\honortitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\color{text} #1}}
\renewcommand*{\honorlocationstyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\slshape\color{awesome} #1}}
% 重新定义cvhonor三个部分的显示顺序
\renewcommand*{\cvhonor}[3]{%
  \honorpositionstyle{#1} & \honortitlestyle{#2} & \honorlocationstyle{#3} \\
}
%-------------------------------------------------------------------------------


%-------------------------------------------------------------------------------
% 自定义环境
%
% 所有自定义环境的具体实现都放在该部分
% 自定义环境统一以dk开头，用于区分其他宏包的自定义环境
%-------------------------------------------------------------------------------
% dkbutton
% inline风格的代码小盒子，两种风格可选，颜色自适应或手动指定
%
% 用法：
%   \dkbutton<*>[color]{text}
%
% 说明：
%   *
%     不带星号为上下边框风格，带星号为圆角按钮风格
%   color
%     可选，指定主色调或省略进行自适应，默认为awesome
%
% 已知Bug：
%   不要在同一个中文段落里用太多或者单个太长，否则影响中文的断行和标点压缩
%
% 例如：
%   \dkbutton{Hello Dukang}
%   \dkbutton*{Hello Dukang}
%   \dkbutton{Hello Dukang}[blue]
%   \dkbutton*{Hello Dukang}[red]
%-------------------------------------------------------------------------------
\DeclareTCBox{dkbutton}{ s O{awesome} }{%
  on line,
  colframe=#2,
  colback=#2!5,
  boxsep=0pt,
  IfBooleanTF={#1}{%
    boxrule=1pt,
    arc=7pt,
    before upper={\rule[-3pt]{0pt}{10pt}},
    left=6pt,
    right=6pt,
    top=3pt,
    bottom=1pt,
  }{%
    boxrule=0pt,
    toprule=1pt,
    arc=0pt,
    outer arc=0pt,
    left=1pt,
    right=1pt,
    top=2pt,
    bottom=2pt,
    bottomrule=1pt,
  }
}
%-------------------------------------------------------------------------------
% dkresource
% 引入外部pdf或图片的命令
%
% 用法：
%   \dkresource<[caption]>{file}<[width_factor]><[htbp!]>
%
% 说明：
%   <htbp!>
%     控制图像浮动方式的可选参数，默认为htbp
%     h: 当前位置（代码所处的上下文）
%     t: Top（页面顶部）
%     b: Bottom（页面底部）
%     p: Page（单独成页）
%     !: 在判定位置时忽视限制
%     排版位置的选取与参数里符号的顺序无关，总是以h-t-b-p的优先级顺序决定浮动体位置
%     限制包括：
%       浮动体个数：
%         除单独成页外，默认每页不超过3个浮动体，其中顶部不超过2个，底部不超过1个
%       浮动体空间占页面的百分比：
%         默认顶部不超过70%，底部不超过30%
%   file
%     需要引入的文件，相对地址的起点为src根目录
%   width_factor
%     相对于整个页宽的占比，取值为0-1
%   caption
%     图形下方的说明，可为空，但不能省略
%
% 例如：
%   带说明，不可单独成页：
%     \dkresource[htb]{resource/r-1}{0.9}{这里是图形说明}
%   不带说明，使用默认参数（htbp），可单独成页：
%     \dkresource{resource/r-2}{1.0}{}
%-------------------------------------------------------------------------------
\DeclareDocumentCommand \dkresource { o m O{0.9} O{htb} }{%
  \begin{figure}[#4]
    \centering
    \includegraphics[width=#3\textwidth]{#2}
    \IfValueT{#1}{%
      \caption{#1}
    }
  \end{figure}
}
%-------------------------------------------------------------------------------
% dkcode
% 代码高亮块，颜色自适应或手动指定
%
% 用法：
%   \begin{dkcode}<*>{lang}<[title]><[color]><[minted_style]>
%     ...
%   \end{dkcode}
%
% 说明：
%   *
%     不带星号为普通标题栏，带星号为瘦标题栏，两者只是标题风格不同
%   lang
%     Pygments支持超过300种编程语言的语法高亮，具体列表请使用下面命令查看
%       pygmentize -L lexers
%   title
%     可选，代码块标题栏文字，如果不指定该参数，则自适应隐藏标题栏
%   color
%     可选，指定主色调或省略进行自适应，默认为awesome
%   minted_style
%     可选，minted预定义的高亮样式，默认为tango，可选项请使用下面命令查看
%       pygmentize -L styles
%
% 例如：
%   \begin{dkcode}{python3}
%   \begin{dkcode}*{python3}[代码示例]
%   \begin{dkcode}{python3}[代码示例][blue]
%   \begin{dkcode}*{python3}[代码示例][blue][tango]
%     ...
%   \end{dkcode}
%
% 注意：
%   参数的给定是有顺序的，只可从后往前省略。
%-------------------------------------------------------------------------------
\DeclareTCBListing{dkcode}{ s m !o !O{awesome} !O{tango} }{
  breakable,
  drop shadow,
  listing engine=minted,
  minted language=#2,
  minted style=#5,
  listing only,
  left=6mm,
  right=6mm,
  enhanced,
  colframe=#4,
  colback=#4!5,
  coltitle=white,
  IfBooleanTF={#1}{%
    IfValueT={#3}{title={#3}},
    colbacktitle=#4!85,
    attach boxed title to top center={
      yshift=-0.25mm-\tcboxedtitleheight/2,
      yshifttext=2mm-\tcboxedtitleheight/2
    },
    boxed title style={
      enhanced,boxrule=0.5mm,
      frame code={
        \path[tcb fill frame]
        ([xshift=-4mm]frame.west)
        -- (frame.north west)
        -- (frame.north east)
        -- ([xshift=4mm]frame.east)
        -- (frame.south east)
        -- (frame.south west)
        -- cycle;
      },
      interior code={
        \path[tcb fill interior]
        ([xshift=-2mm]interior.west)
        -- (interior.north west)
        -- (interior.north east)
        -- ([xshift=2mm]interior.east)
        -- (interior.south east)
        -- (interior.south west)
        -- cycle;
      }
    },
    overlay={
      \begin{tcbclipinterior}
        \fill[#4!20]
        (frame.south west)
        rectangle
        ([xshift=5mm]frame.north west);
      \end{tcbclipinterior}
    }
  }{%
    IfValueT={#3}{title=\TwoSymbolsAndText{\faCode}{#3}{\faCode}},
  }
}
%-------------------------------------------------------------------------------
% dkcodefile
% 代码高亮块，主色调既可以手动指定，也可以基于Awesome-CV的awesome颜色自适应
% 该命令从指定文件中读取内容进行高亮显示，同时提供2种标题风格
%
% 用法：
%   \dkcodefile<*>{file}{lang}<[title]><[color]><[minted_style]>
%
% 说明：
%   *
%     不带星号为普通标题栏，带星号为瘦标题栏，两者只是标题风格不同
%   file
%     代码块内容的来源文件，必须为内容可读的文本文件
%   lang
%     Pygments支持超过300种编程语言的语法高亮，具体列表请使用下面命令查看
%       pygmentize -L lexers
%   title
%     可选，代码块标题栏文字，如果不指定该参数，则自适应隐藏标题栏
%   color
%     可选，指定主色调或省略进行自适应，默认为awesome
%   minted_style
%     可选，minted预定义的高亮样式，默认为tango，可选项请使用下面命令查看
%       pygmentize -L styles
%
% 例如：
%   \dkcodefile{src/code.go}{golang}
%   \dkcodefile*{src/code.go}{golang}[主文件代码]
%   \dkcodefile{src/code.go}{golang}[主文件代码][blue]
%   \dkcodefile*{src/code.go}{golang}[主文件代码][blue][vim]
%
% 注意：
%   参数的给定是有顺序的，只可从后往前忽略。
%-------------------------------------------------------------------------------
\DeclareTCBInputListing{dkcodefile}{ s m m !o !O{awesome} !O{tango} }{
  breakable,
  drop shadow,
  listing engine=minted,
  minted language=#3,
  minted style=#6,
  listing only,
  left=6mm,
  right=6mm,
  enhanced,
  colframe=#5,
  colback=#5!5,
  coltitle=white,
  listing file={#2},
  IfBooleanTF={#1}{%
    IfValueT={#4}{title={#4}},
    colbacktitle=#5!85,
    attach boxed title to top center={
      yshift=-0.25mm-\tcboxedtitleheight/2,
      yshifttext=2mm-\tcboxedtitleheight/2
    },
    boxed title style={
      enhanced,boxrule=0.5mm,
      frame code={
        \path[tcb fill frame]
        ([xshift=-4mm]frame.west)
        -- (frame.north west)
        -- (frame.north east)
        -- ([xshift=4mm]frame.east)
        -- (frame.south east)
        -- (frame.south west)
        -- cycle;
      },
      interior code={
        \path[tcb fill interior]
        ([xshift=-2mm]interior.west)
        -- (interior.north west)
        -- (interior.north east)
        -- ([xshift=2mm]interior.east)
        -- (interior.south east)
        -- (interior.south west)
        -- cycle;
      }
    },
    overlay={
      \begin{tcbclipinterior}
        \fill[#5!20]
        (frame.south west)
        rectangle
        ([xshift=5mm]frame.north west);
      \end{tcbclipinterior}
    }
  }{%
    IfValueT={#4}{title=\TwoSymbolsAndText{\faCode}{#4}{\faCode}},
  }
}
%-------------------------------------------------------------------------------
% dkcomment
% 备注框，主色调既可以手动指定，也可以基于Awesome-CV的awesome颜色自适应
%
% 用法：
%   \begin{dkcomment}<*><[title]><[color]><[fontawesome]>
%     ...
%   \end{dkcomment}
%
% 说明：
%   *
%     不带星号为普通标题栏，带星号为瘦标题栏，两者只是标题风格不同
%   title
%     可选，代码块标题栏文字，如果不指定该参数，则自适应隐藏标题栏
%   color
%     可选，指定主色调或省略进行自适应，默认为awesome
%   fontawesome
%     可选，FontAwesome的图标代码或名称，默认为\faTheaterMasks
%
% 例如：
%   \begin{dkcomment}
%   \begin{dkcomment}*[这里是标题]
%   \begin{dkcomment}[这里是标题][blue]
%   \begin{dkcomment}*[这里是标题][blue][\faTree]
%
% 注意：
%   参数的给定是有顺序的，只可从后往前忽略。
%-------------------------------------------------------------------------------
\DeclareTColorBox{dkcomment}{ s o O{awesome} O{\faTheaterMasks} }{
  breakable,
  drop shadow,
  size=title,
  top=3mm,
  bottom=3mm,
  left=6mm,
  right=6mm,
  arc=1.5mm,
  enhanced jigsaw,
  boxrule=0.5mm,
  colframe=#3,
  colback=#3!5,
  coltitle=white,
  coltext=text,
  IfBooleanTF={#1}{%
    IfValueT={#2}{title={#2}},
    colbacktitle=#3!85,
    attach boxed title to top center={
      yshift=-0.25mm-\tcboxedtitleheight/2,
      yshifttext=2mm-\tcboxedtitleheight/2
    },
    boxed title style={
      enhanced,boxrule=0.5mm,
      frame code={
        \path[tcb fill frame]
        ([xshift=-4mm]frame.west)
        -- (frame.north west)
        -- (frame.north east)
        -- ([xshift=4mm]frame.east)
        -- (frame.south east)
        -- (frame.south west)
        -- cycle;
      },
      interior code={
        \path[tcb fill interior]
        ([xshift=-2mm]interior.west)
        -- (interior.north west)
        -- (interior.north east)
        -- ([xshift=2mm]interior.east)
        -- (interior.south east)
        -- (interior.south west)
        -- cycle;
      }
    },
  }{%
    IfValueT={#2}{title=\TwoSymbolsAndText{#4}{#2}{#4}},
  }
}
%-------------------------------------------------------------------------------
% dkcodebox
%
% 短命令行，颜色自适应，类似于dkbutton
% 分为带*和不带*两个版本，前者有命令提示符和关键字高亮，后者没有
%
% 用法：
%   \dkcodebox<*>{text}
%
% 说明：
%   *
%     带星号有命令提示符和关键字高亮，不带星号的没有
%   text
%     正文文本
%
% 例如：
%   \dkcodebox*{echo 'nice'}
%   \dkcodebox{Some Text}
%
% 注意：
%   由于使用了动词，该命令不能用在其他环境和命令的参数中，
%   目前尚未解决该问题，还是推荐使用dkbutton
%-------------------------------------------------------------------------------
\DeclareTotalTCBox{\dkcodebox}{ s v }{
  verbatim,
  colback=awesome!5,
  colframe=awesome
}{
  \IfBooleanT{#1}{\textcolor{awesome}{\ttfamily\bfseries > }}%
  \lstinline[%
    language=command.com,%
    keywordstyle=\color{awesome}\bfseries%
  ]%
  ^#2^%
}
%-------------------------------------------------------------------------------
% dkmeasure
%
% 打印长度数值，主要用于在构建页面时对长度变量进行测量。
% 分为带*和不带*两个版本，类似于dkbutton，主要用于调试目的。
%
% 用法：
%   \dkmeasure<*><[unit]>{something}
%
% 说明：
%   *
%     可选参数，带*显示长度单位，不带*只显示转换结果
%   unit
%     长度单位，可以是cm, mm, pt等，默认为cm
%   something
%     需要打印的宏或命令，例如\textwidth, \baselineskip, 1em, 20pt等
%
% 例如：
%   \dkmeasure*[cm]{\textwidth}
%   \dkmeasure*{\linewidth}
%   \dkmeasure[mm]{1em}
%-------------------------------------------------------------------------------
\DeclareDocumentCommand{\dkmeasure}{ s O{cm} m }{%
  \dkbutton*{%
    \IfBooleanT{#1}{%
      {\color{awesome}{\ttfamily\bfseries \Verb{#3} > }}%
    }%
    \printinunitsof{#2}\prntlen{#3}%
  }
}
%-------------------------------------------------------------------------------


%-------------------------------------------------------------------------------
% 定义结束
%-------------------------------------------------------------------------------
