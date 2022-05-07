# LateX Dukang Template
LaTeX Dukang 模板项目

## 项目说明

## 版权引用声明
修改自[Awesome-CV](https://github.com/posquit0/Awesome-CV) 2022-04-28 Master版本

## 项目主要内容
-   修改整个项目目录结构，适应`make`自动构建
-   修改`Makefile`生成选项，并添加清理命令
-   使用`ctex`宏包添加中文支持
-   完成`letter`环境的自定义PDF书签支持中文
-   添加PDF属性定义

## 提交变更信息
### 2022-05-07
-   完成`cvsection`的重定义，修正cvparagraph格式问题
-   增加`dukangBookmarkSection`命令，为`section`类型的环境自动生成书签提供支撑
-   修改`lettersection`和`cvsection`用书签命令生成书签

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
