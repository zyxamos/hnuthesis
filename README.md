# 湖南大学硕士学位论文 LaTeX 模板

本项目基于 [yusanshi/hnuthesis](https://github.com/yusanshi/hnuthesis)。首先非常感谢原作者所做的工作，极大地减轻了撰写毕业论文的工作量。然而在使用中发现了一些小的错误、以及一些不符合数学专业论文习惯的地方，因此本项目仅做以下微小的修改。

- 修复了论文模板以及 PDF bookmark 的一些错误

- 采取更现代化的参考文献编译引擎：`natbib` -> `biblatex`

- 使用 `package: thmtools` 定义定理环境
  
  - 修复了引理、命题、推论等定理环境的 `autorefname` 出错的问题
  - 定理、引理等环境 `bodyfont` 采用斜体；定义、注等环境 `bodyfont` 采用正文字体。

- 更符合数学专业论文习惯的修改
  
  - 调小行间公式与文本之间的距离。对于充满公式的数学论文来说，较大的距离将使得论文整体比较松散。
  
  - 长公式自动换页

<!-- - 其它更适合数学论文编写的模板（例如字体、宏定义等）
- 数学字体
- 一些通用的宏定义，例如 `\setl{R}` -->

## 文件说明

- `main.tex`: 主文件，编译入口；
- `hnuthesis.cls`: 撰写规范，需要调整格式在该文件中对应修改；
- `references.bib`: 参考文献列表；
- `chapters/`: 论文章节文件夹，分章有利于保持 TeX 文件的整洁；
- `figures/`: 插图文件夹，LaTeX 支持多种格式，如 EPS、PDF、PNG 等；
- `main.pdf`: 编译生成的论文 PDF 文件；

## 编译

1. 安装 LaTeX 发行版；

2. 编译主版本：
   
   ```bash
   latexmk -xelatex -shell-escape main.tex
   ```
   
   或者在 vscode 下安装 [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) 插件后 _complie on save_（本项目的 `.vscode/settings.json` 已经对其做了配置）。
