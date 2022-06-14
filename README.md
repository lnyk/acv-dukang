# Awesome-CV Dukang Project
Awesome-CV Dukang项目

## 项目说明

## 版权引用声明
修改自[Awesome-CV](https://github.com/posquit0/Awesome-CV) 2022-04-28 Master版本

## 项目主要内容

## 提交变更信息
### 2022.06.14
-   更名为`Awesome-CV Dukang`项目，文档类名称`awesome-cv-dukang`
-   根据LaTeX2e手册建议，由于本项目主要基于其他类或宏包进行修改增强，不能通用于特定环境之外，因此将本项目从`Package`类型变更为`Class`类型
-   重构部分自定义命令，同时调整文档类引用方式及参数传递方式。
-   重构PDF标题书签生成命令，放弃使用\@firstname和\@lastname，使用新命令\dkpdftitle在主文档中指定
-   调整`cvsubsection`字体风格
-   开启`04-comp`和`05-update`

### 2022.06.13
-   修改`cventry`参数及顺序，简化使用方式，不再需要显式输入`cvitems`环境
-   完成`03-usage`

### 2022.06.09
-   解决图片`ICC` Color Profile Embedded问题

### 2022.06.08
-   增加`LICENSE`文件
-   替换`icon.png`
-   增加`caption`宏包引用，调整`dkresource`的`caption`格式
-   解决`dkcode`和`dkcodefile`在使用可选参数`O{}`时与`xparse`新版本不兼容的问题，需要在可选参数`o`或`O{}`前加`!`，否则可选参数必须全部给出，不然会出错，详情参考`tcolorbox`文档471页的特别说明
-   编写`01-intro`
-   编写`03-usage`

### 2022.06.06
-   完善`dukang-doc.tex`备注信息
-   编写`03-usage`
-   合并`dkbotton`和`dkbuttonr`，使用`*`控制风格，默认不带`*`为上下边框风格，带`*`为圆角按钮风格

### 2022.06.04
-   重构2个`Makefile`内容，原先清理的不干净
-   重构`dkcomment`支持xparse可选项
-   重构`dkcodefile`支持xparse可选项
-   增加`dkcodebox`支持短代码高亮，尚有bug，不能用在环境或命令参数中，否则提示`Verbatim-Like`错误
-   重构`dkcode`和`dkcodefile`，使用`*`配合xparse代替`dkcodeh`和`dkcodefileh`，同时提供两种标题风格的自由切换
-   重构`dkcomment`，增加`*`选项，提供两种标题风格切换
-   调整`cvsubsection`书签编号为`n.n`，调整`cvsubsection`标题与上一段落间距

### 2022.06.03
-   增加`cvhonors`的颜色可选开关，调整带底色时的表格边距自适应

### 2022.06.02
-   新增`cvsubsection`部分
-   调整`cvsection`和`cvsubsection`标题前后以及正文段落的间距
-   新增`cvhonors`和`cvhonor`并调整格式
-   修改`cvhonors`为使用`xparse`设置三栏对齐方式
-   完善`Makefile`备注信息
-   开启第三章节

### 2022-05-30
-   重新调整`cventry`的行间距为1.56em
-   完成`02-intro`章节

### 2022-05-17
-   修改`cvsection`之后正文的样式和`cvparagraph`相同，这样就可以直接输入正文了

### 2022-05-13
-   添加自定义脚注设置
-   使用`makeatletter`组合修正了原先需要插入命令来生成首页PDF书签的过程
-   增加`tcbset`全局配置项，统一部分`tcolorbox`环境和命令的字体行距等格式输出

### 2022-05-07
-   完成`cvsection`的重定义，修正cvparagraph格式问题
-   增加`dukangBookmarkSection`命令，为`section`类型的环境自动生成书签提供支撑
-   修改`lettersection`和`cvsection`用书签命令生成书签
-   完善备注信息

### 2022-05-06
-   增加`dkbutton`和`dkbuttonr`两个`in-line`风格的显示按钮
-   修改所有`dkcode*`和`dkcomment`环境为主色调自适应并可选手动指定主色调，字体为\sffamily
-   删除之前用于手动指定主色调的所有`dkcode*c`环境
-   重新定义`section`标题的高亮显示部分，调整高亮显示到前4个字符，用于适应中文习惯
-   完成使用`cvletter`环境定义的`01-cover.tex`
-   开启使用`cvsection`环境定义的`02-intro.tex`，重点参考`summary.tex`和`skills.tex`

### 2022-05-05
-   增加对`resource`中`.tex`等文件的编译支持
-   增加`resource/Makefile`的功能
-   增加`dkresource`命令，联动编译`resource/r-*.tex`
-   增加`resource/r-arch.tex`文档的`tikz`中文化支持以及美化
-   增加`ctex-fontset-custom.def`字体自定义文件到`resource`的相对位置符号软连接
-   完成`Page 1`

### 2022-05-04
-   增加`Makefile`对`minted`生成的临时文件进行清理
-   增加`outputdir`选项到`\RequirePackage{minted}`解决编译时`.listing`文件找不到的问题
-   修改`dukang.sty`宏包的自定义环境
-   更新`dukang-doc`对应的示例部分
-   解决所有自定义命令针对Awesome-CV的颜色自适应
-   todo: 所有`tcblisting`仍然没有解决中英文混乱环境下由于`CTeX`环境引入的中文前的空格问题

### 2022-05-03
-   重新修改结构，将原本文档相关的`dukang`文件更改为`dukang-doc`相关文件
-   重新封装为`dukang`宏包
-   增加首页主标题书签自适应
-   增加`letter`环境书签自动生成

### 2022-04-29
-   完成项目目录结构调整，`dukang.tex`用于生成说明文档，`main.tex`用于`starter-kit`
-   对应调整`Makefile`，`make doc`编译`dukang.tex`，`make`或`make main`生成`main.tex`
-   增加`make clean`和`make cleanall`，用于自动清理目录
-   引入`utils.tex`自定义部分，完善备注信息，解决重复引用的问题
-   调整`profile`位置到`resource`文件夹

### 2022-04-28
-   初始化项目基础文件以及`git`相关文件
-   完成修改目录结构
-   完成修改`Makefile`适应新的目录结构
-   添加`ctex`引用，支撑中文环境，默认字体使用`adobe`
-   为`cover`环境添加`dukangParIndent`全局变量，用于控制部分内容的首行缩进
