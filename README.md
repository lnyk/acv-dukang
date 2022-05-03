# LateX Dukang Template
LaTeX Dukang 模板项目

## 项目说明

## 版权引用声明
修改自[Awesome-CV](https://github.com/posquit0/Awesome-CV) 2022-04-28 Master版本

## 项目主要内容
-   修改整个项目目录结构，适应`make`自动构建
-   修改`Makefile`生成选项，并添加清理命令
-   使用`ctex`宏包添加中文支持

## 提交变更信息
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
