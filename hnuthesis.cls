\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{hnuthesis}
    [2017/07/19 v0.1 HNU thesis template]

% bibtype = {numerical, authoryear}, manual}
% \RequirePackage{xkeyval}
% \newif\if@hnu@numerical
% \newif\if@hnu@authoryear
% \@hnu@numericaltrue % 参考文献默认采取数字引用
% \DeclareOptionX{bibtype}[numerical]{% default value: numerical - 参考文献默认采取数字引用
  
% }
% \define@choicekey*+{hnuthesis.cls}{bibtype}[\val\nr]{numerical,authoryear}{%
%   \ifcase\nr\relax
%     \@hnu@numericaltrue
%     \@hnu@authoryearfalse
%   \or
%     \@hnu@numericalfalse
%     \@hnu@authoryeartrue
%   \fi
% }{%
%   \PackageWarning{hnuthesis}{Error input for option "bibtype"}%
% }
% \ProcessOptionsX

%% Options
\newif\if@hnu@numerical
\newif\if@hnu@authoryear
\newif\if@hnu@manualbib
\DeclareOption{numbers}{\@hnu@numericaltrue \@hnu@authoryearfalse \@hnu@manualbibfalse} % 参考文献默认采取数字引用, by \ExecuteOptions{..., numbers}
\DeclareOption{authoryear}{\@hnu@numericalfalse \@hnu@authoryeartrue \@hnu@manualbibfalse}
\DeclareOption{manualbib}{\@hnu@numericalfalse \@hnu@authoryearfalse \@hnu@manualbibtrue}

\newif\if@hnu@doctor
\DeclareOption{doctor}{\@hnu@doctortrue}

\newif\if@hnu@pdf
\DeclareOption{print}{\@hnu@pdffalse}
\DeclareOption{pdf}{\@hnu@pdftrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ExecuteOptions{doctor,chinese,print,numbers}
\ProcessOptions\relax
\newif\if@hnu@addtocspace
\if@hnu@pdf
  \PassOptionsToClass{oneside}{book}
\fi
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[UTF8, a4paper, openany, zihao=-4]{ctexbook}[2015/05/14]
\RequirePackage{etoolbox}
\@ifclasslater{ctexbook}{2015/05/14}{}{%
    \ClassError{hnuthesis}{%
        Requiring ctex 2.0 or later version!\MessageBreak
        Please update the package using your\MessageBreak
        TeX package manager or from CTAN
    }{%
        See logs for more details.
    }
}
\setmainfont{Times New Roman} % \rm, 衬线字体
\setsansfont{Arial} % \sf, 无衬线字体
\setmonofont{Courier New}
% \setCJKmainfont{SimSun}
% \setCJKsansfont{SimHei}
\RequirePackage{hyperref}
\hypersetup{
    bookmarksopen=true,
    bookmarksnumbered=true,
    bookmarksopenlevel=1,
    CJKbookmarks=true,
    pdfborder=0 0 0,
    unicode=true,
    linktoc=all,
}
\if@hnu@pdf
    \hypersetup{
        colorlinks=true,
        allcolors=blue,
    }
\fi

\AtBeginDocument{
    \hypersetup{
        pdftitle={\hnu@title},
        pdfauthor={\hnu@author}
    }
}

\RequirePackage{xparse}
\NewDocumentCommand\setfontsize{mo}{\IfValueTF{#2}{\fontsize{#1}{#2}}{\fontsize{#1}{2\dimexpr#1}}\linespread{1}\selectfont\relax}
\newcommand\zhspace[1][1]{\hspace{#1\ccwd}}
\newcommand\hnu@underline[2][6em]{%
    \hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt\relax
}
\def\hnu@define@term#1{
    \expandafter\gdef\csname #1\endcsname##1{
        \expandafter\gdef\csname hnu@#1\endcsname{##1}
    }
    \csname #1\endcsname{}
}
\hnu@define@term{hnucode}
\hnu@define@term{hnuname}
\hnu@define@term{title}
\hnu@define@term{clc}
\hnu@define@term{secrettext}
\hnu@define@term{author}
\hnu@define@term{authorid}
\hnu@define@term{college}
\hnu@define@term{major}
\hnu@define@term{workon}
\hnu@define@term{supervisor}
\hnu@define@term{cosupervisor}
\hnu@define@term{submitdate}
\hnu@define@term{defensedate}
\hnu@define@term{chair}
\hnu@define@term{entitle}
\hnu@define@term{enauthor}
\hnu@define@term{enmajor}
\hnu@define@term{endoctor}
\hnu@define@term{enmaster}
\hnu@define@term{enbachelor}
\hnu@define@term{enhnuname}
\hnu@define@term{ensupervisor}
\hnu@define@term{endate}

\if@hnu@doctor
 \newcommand\hnu@thesisname{硕士学位论文}%
  \newcommand\hnu@yemeiname{硕士学位论文}% TODO
\fi

% 表格：
% 三线表
\RequirePackage{booktabs}
\RequirePackage{multirow}
% 跨页表格
% \RequirePackage{longtable}



% 题注、标题
\renewcommand\listfigurename{插图索引}
\renewcommand\listtablename{附表索引}
\newcommand\hnu@notesname{\textbf{注}：}
\newcommand\hnu@enabstractname{Abstract}
\newcommand\hnu@abstractname{摘\quad 要}
\newcommand\hnu@acknowledgementsname{致\quad 谢}
\newcommand\hnu@tocname{目\quad 录}
\newcommand\hnu@summaryname{总结与展望}
\newcommand\hnu@notationname{符号说明}
\def\equationautorefname~#1\null{公式~(#1)\null}%
\def\footnoteautorefname{脚注}%
\def\itemautorefname~#1\null{第~#1~项\null}%
\def\figureautorefname{图}%
\def\tableautorefname{表}%
\def\partautorefname~#1\null{第~#1~部分\null}%
\def\appendixautorefname{}%
\def\chapterautorefname~#1\null{第~#1~章\null}%
\def\sectionautorefname~#1\null{第~#1~节\null}%
\def\subsectionautorefname~#1\null{第~#1~小节\null}%
\def\subsubsectionautorefname~#1\null{第~#1~小小节\null}%
\def\paragraphautorefname~#1\null{第~#1~段\null}%
\def\subparagraphautorefname~#1\null{第~#1~小段\null}%
\def\theoremautorefname{定理}%
\def\pageautorefname~#1\null{第~#1~页\null}%

% 页面设置
\RequirePackage{geometry}
\geometry{
    paper=a4paper,
    top=2.2cm, bottom=2.2cm,
    left=2.5cm, right=2.5cm,
    headheight=0.4cm, headsep=1.3cm,
    footskip=1.1cm}
\RequirePackage{fancyhdr}
\renewcommand{\headrulewidth}{0.4pt}
\fancypagestyle{hnu@headings}{%
  \fancyhf{}%
  \fancyhead[CE]{\setfontsize{9pt}\hnu@title}%
  \fancyhead[CO]{\setfontsize{9pt}\hnu@yemeiname}
  \fancyfoot[C]{\setfontsize{9pt}\thepage}
  \fancyheadoffset[LO,LE]{3mm}
  \fancyheadoffset[RO,RE]{-3mm}
  \def\headrule{
    \if@fancyplain\let\headrulewidth\plainheadrulewidth\fi%
    \hrule\@height 1.0pt \@width\headwidth\vskip 1pt %上面线为1pt粗
    \hrule\@height 0.5pt \@width\headwidth  %下面0.5pt粗
    \vskip-2\headrulewidth\vskip-1pt}      %两条线的距离1pt
    \vspace{7mm}
}%

\fancypagestyle{hnu@notation}{\fancyfoot{}}
\pagestyle{hnu@headings}
\patchcmd\chaptermark{#1}{\protect\spacetitle{#1}}{}{}
\renewcommand*{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
  \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\g@addto@macro\frontmatter{%
  \pagenumbering{Roman}%
}
\renewcommand\mainmatter{%
  \cleardoublepage
  \pagenumbering{arabic}%
  \@mainmattertrue
}

% 列表
\RequirePackage{enumitem}
\setitemize{leftmargin=3em,itemsep=0em,partopsep=0em,parsep=0em,topsep=-0em}
\setenumerate{leftmargin=3em,itemsep=0em,partopsep=0em,parsep=0em,topsep=0em}

% 章节、段落、页眉、页脚
\renewcommand\chapter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \setlength{\baselineskip}{20pt}
  \renewcommand{\CJKglue}{\hskip 0.5pt plus \baselineskip}
  \global\@topnum\z@
  \@afterindenttrue
  \secdef\@chapter\@schapter
}

\RequirePackage{pifont}
\def\hnu@textcircled#1{%
  \ifnum\value{#1} >9
    \ClassError{hnuthesis}%
      {Too many footnotes in this page.}{Keep footnote less than 10.}
  \fi
  \ding{\the\numexpr\value{#1}+191\relax}
}

\RequirePackage{stringstrings}
\newcounter{titlelength}
\newcommand\spacetitle[1]{%
  \@getstringlength{#1}{titlelength}%
  \ifnum\thetitlelength=2{\ziju{2}#1}\else%
    \ifnum\thetitlelength=3{\ziju{1}#1}\else%
      \ifnum\thetitlelength=4{\ziju{0.5}#1}\else#1%
      \fi
    \fi
  \fi
}
\setcounter{secnumdepth}{5}
\ctexset{
    chapter = {
        format      = \centering\sffamily\bfseries\setfontsize{18pt},
        nameformat  = {},
        numberformat += \rmfamily,
        % titleformat = \spacetitle,
        number      = \thechapter,
        aftername   = \hspace{\ccwd},
        beforeskip  = -1.5em, % 24bp - 31bp
        afterskip   = 1.5em, % 18bp - 10bp
        % fixskip   = true, % will be used in future version
    },
    section = {
        format     = \bf\sffamily\setfontsize{15pt},
        numberformat += \rmfamily,
        aftername  = \hspace{\ccwd},
        beforeskip = 12pt,
        afterskip  = 12pt,
    },
    subsection = {
        format     = \bf\sffamily\setfontsize{14pt},
        numberformat += \rmfamily,
        aftername  = \hspace{\ccwd},
        % indent     = 2\ccwd,
        beforeskip = 6pt,
        afterskip  = 6pt,
    },
    subsubsection = {
        format    = \sffamily\setfontsize{12.5pt},
        numberformat += \rmfamily,
        number    = (\arabic{subsubsection}),
        % aftername = \hspace{\ccwd},
        beforeskip = 6pt,
        afterskip  = 6pt,
        % indent    = 3\ccwd,
    },
    paragraph = {
        format    = \sffamily\setfontsize{12.5pt},
        numberformat += \rmfamily,
        number    = (\arabic{paragraph}),
        aftername = \hspace{\ccwd},
        % indent    = 3\ccwd,
    },
    subparagraph = {
        format    = \sffamily\setfontsize{12.5pt},
        numberformat += \rmfamily,
        number    = \hnu@textcircled{subparagraph},
        aftername = \hspace{\ccwd},
        % indent    = 3\ccwd,
    },
}

% 书签
\newcounter{hnu@pdfbookmark}
\NewDocumentCommand\hnu@chapter{s m}{%
  \if@openright\cleardoublepage\else\clearpage\fi%
  \addtocounter{hnu@pdfbookmark}\@ne
  \chapter*{#2}
  \IfBooleanF{#1}{% \hnu@chapter{}
    \addcontentsline{toc}{chapter}{\normalfont\sffamily#2}% 添加进目录，并且目录中不使用粗体
  }% % else \hnu@chapter*{}}, do nothing
}

% 封面
\renewcommand\maketitle{%
    \newgeometry{
        top=3.8cm, bottom=3.8cm,
        left=3.2cm, right=3.2cm,
        headheight=0cm, headsep=0.8cm,
        footskip=0.8cm}
    \pagenumbering{gobble}
    % \pdfbookmark[0]{封面}{titlepage}
    \make@cntitle
    % \pdfbookmark[0]{Title page}{entitlepage}
    \make@entitle
    \restoregeometry
    % \pdfbookmark[0]{原创性声明}{statement}
    \make@statement
}

\newcommand\hnu@supervisorline{%
  \ifx\hnu@encosupervisor\@empty%
    Supervisor: \hnu@ensupervisor%
  \else%
    Supervisors: \hnu@ensupervisor, \hnu@encosupervisor%
  \fi
}

\RequirePackage{tikz}
\newcommand\vpostext[2]{%
  \tikz[remember picture,overlay]%
      \node [yshift=-#1] at (current page.north) [below,align=flush center]%
          {\parbox{\textwidth}{\centering#2}};
}

\newcommand\linetext[3]{%
  \underline{\makebox[#1][#2]{#3}}
}


% 中文封面
\RequirePackage{tabularx}
\newcommand\make@cntitle{%
  \begin{titlepage}%
     \tikz[remember picture,overlay]%
        \node [xshift=2.5cm,yshift=-2.5cm] at (current page.north west)%
            [below right,align=left] {%

          \newlength{\@tw}
          \setlength{\@tw}{55pt}
          \newlength{\@cw}
          \setlength{\@cw}{3.2cm}

          \setfontsize{12.5pt}%
          \begin{tabularx}{\linewidth}{lcccr}%
            \makebox[\@tw][s]{\sffamily\textbf{学校代号}} & \linetext{\@cw}{c}{\hnu@hnucode} &
            \makebox[2.5cm][c]{\qquad} &
            \makebox[\@tw][s]{\sffamily\textbf{学号}} & \linetext{\@cw}{c}{\hnu@authorid} \\%
            \makebox[\@tw][s]{\sffamily\textbf{分类号}} & \linetext{\@cw}{c}{\hnu@clc} &
            \makebox[2.5cm][c]{\qquad} &
            \makebox[\@tw][s]{\sffamily\textbf{密级}} & \linetext{\@cw}{c}{\hnu@secrettext}
          \end{tabularx}};%

      \vpostext{5cm}{\includegraphics[height=6cm]{figures/hnu-logo.png}}%
      \vpostext{12cm}{\bf\sffamily\setfontsize{22pt}\hnu@thesisname}%
      \vpostext{15cm}{\bf\sffamily\setfontsize{26pt}\hnu@title}%

      \tikz[remember picture,overlay]
        \node [xshift=5cm,yshift=-20cm] at (current page.north west)%
            [below right,align=left] {%
          \setlength{\@tw}{94pt}
          \setlength{\@cw}{6.4cm}

          \setfontsize{12.5pt}%
          \begin{tabular}{@{}l@{\hspace{\ccwd}}l@{}}%
            \makebox[\@tw][s]{\sffamily\textbf{学位申请人姓名}} & \linetext{\@cw}{l}{\qquad\hnu@author} \\%
            \makebox[\@tw][s]{\sffamily\textbf{培养单位}} & \linetext{\@cw}{l}{\qquad\hnu@college} \\
            \makebox[\@tw][s]{\sffamily\textbf{导师姓名及职称}} & \linetext{\@cw}{l}{\qquad\hnu@supervisor} \\
            \makebox[\@tw][s]{\sffamily\textbf{学科专业}} & \linetext{\@cw}{l}{\qquad\hnu@major} \\
            \makebox[\@tw][s]{\sffamily\textbf{研究方向}} & \linetext{\@cw}{l}{\qquad\hnu@workon} \\
            \makebox[\@tw][s]{\sffamily\textbf{论文提交日期}} & \linetext{\@cw}{l}{\qquad\hnu@submitdate}
          \end{tabular}};%

      \clearpage
      \thispagestyle{empty}

      \tikz[remember picture,overlay]
        \node [xshift=5cm,yshift=-2.5cm] at (current page.north west)%
            [below right,align=left] {%

          \setlength{\@tw}{66.5pt}
          \setlength{\@cw}{3.2cm}

          \setfontsize{12.5pt}%
          \begin{tabularx}{\linewidth}{ll}%
            \makebox[\@tw][s]{\sffamily\textbf{学校代号：}} & \makebox[\@cw][l]{\hnu@hnucode} \\
            \makebox[\@tw][s]{\sffamily\textbf{学号：}} & \makebox[\@cw][l]{\hnu@authorid} \\
            \makebox[\@tw][s]{\sffamily\textbf{密级：}} & \makebox[\@cw][l]{\hnu@secrettext}
          \end{tabularx}};%

      \tikz[remember picture,overlay]
        \node [xshift=5.4cm,yshift=-8cm] at (current page.north west)%
            [below right,align=left]%
            {\parbox{\textwidth}{\setfontsize{18pt}\hnu@hnuname\hnu@thesisname}};

      \tikz[remember picture,overlay]
        \node [xshift=5.4cm,yshift=-12cm] at (current page.north west)%
            [below right,align=left]%
            {\parbox{12cm}{\bf\sffamily\setfontsize{22pt}\hnu@title}};

      \tikz[remember picture,overlay]
        \node [xshift=5.2cm,yshift=-18cm] at (current page.north west)%
            [below right,align=left] {%
          \setlength{\@tw}{107pt}
          \setlength{\@cw}{9.5cm}

          \setfontsize{12.5pt}%
          \begin{tabular}{@{}l}%
            \linetext{\@cw}{l}{\makebox[\@tw][s]{\sffamily\textbf{学位申请人姓名：}}\qquad\hnu@author} \\%
            \linetext{\@cw}{l}{\makebox[\@tw][s]{\sffamily\textbf{培养单位：}}\qquad\hnu@college} \\
            \linetext{\@cw}{l}{\makebox[\@tw][s]{\sffamily\textbf{导师姓名及职称：}}\qquad\hnu@supervisor} \\
            \linetext{\@cw}{l}{\makebox[\@tw][s]{\sffamily\textbf{专业名称：}}\qquad\hnu@major} \\
            \linetext{\@cw}{l}{\makebox[\@tw][s]{\sffamily\textbf{论文提交日期：}}\qquad\hnu@submitdate} \\
            \linetext{\@cw}{l}{\makebox[\@tw][s]{\sffamily\textbf{论文答辩日期：}}\qquad\hnu@defensedate} \\
            \linetext{\@cw}{l}{\makebox[\@tw][s]{\sffamily\textbf{答辩委员会主席：}}\qquad\hnu@chair}
          \end{tabular}};%
    \end{titlepage}
}

% 英文封面
\newcommand\make@entitle{%
    \begin{titlepage}%
        \vpostext{3.9cm}{\setfontsize{15pt}\textbf{\hnu@entitle}}%
        \vpostext{6.5cm}{\setfontsize{12.5pt}\textbf{By}}%
        \vpostext{7.5cm}{\setfontsize{12.5pt}\textbf{\hnu@enauthor}}%
        \vpostext{8.5cm}{\setfontsize{12.5pt}\textbf{\hnu@enbachelor}}%
        % \vpostext{9.5cm}{\setfontsize{12.5pt}\hnu@enmaster}%

        \vpostext{10cm}{\setfontsize{12.5pt}\textbf{A thesis submitted in partial satisfaction of the}}%
        \vpostext{11cm}{\setfontsize{12.5pt}\textbf{requirements for the degree of}}%
        \vpostext{12cm}{\setfontsize{12.5pt}\textbf{\hnu@endoctor}}%
        \vpostext{13cm}{\setfontsize{12.5pt}\textbf{in}}%
        \vpostext{14cm}{\setfontsize{12.5pt}\textbf{\hnu@enmajor}}%
        \vpostext{15cm}{\setfontsize{12.5pt}\textbf{in the}}%
        \vpostext{16cm}{\setfontsize{12.5pt}\textbf{Graduate School}}%
        \vpostext{17cm}{\setfontsize{12.5pt}\textbf{of}}%
        \vpostext{18 cm}{\setfontsize{12.5pt}\textbf{\hnu@enhnuname}}%
        \vpostext{21cm}{\setfontsize{12.5pt}\textbf{Supervisor}}%
        \vpostext{22cm}{\setfontsize{12.5pt}\textbf{\hnu@ensupervisor}}%
        \vpostext{24cm}{\setfontsize{12.5pt}\textbf{\hnu@endate}}%
    \end{titlepage}
}

% 声明
\newcommand{\hnu@declaretext} {
本人郑重声明：所呈交的论文是本人在导师的指导下独立进行研究所取得的研究成果。 除了文中特别加以标注引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写的 成果作品。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完 全意识到本声明的法律后果由本人承担。
}

\newcommand{\hnu@authorization}{
本学位论文作者完全了解学校有关保留、使用学位论文的规定，同意学校保留并向国家有 关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权湖南大学可以 将本学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复 制手段保存和汇编本学位论文。

本学位论文属于

    \qquad\qquad\qquad\quad 1、保密 $\square$，在\hnu@underline[2.5em]{}年解密后适用本授权书。

    \qquad\qquad\qquad\quad 2、不保密 $\square$。

    \qquad\qquad\qquad\quad（请在以上相应方框内打“\checkmark ”）
}

\newcommand\make@statement{
    \newgeometry{left=3.3cm,right=3.3cm,top=3.5cm, bottom=3cm}
    \thispagestyle{plain}
    \pagenumbering{Roman} % 从原创性声明页面开始 Roman 计数
    \setcounter{page}{1}
    \addcontentsline{toc}{chapter}{\normalfont\sffamily 学位论文原创性声明和学位论文版权使用授权书} % 目录中不使用粗体, //TODO: 此部分产生的超链接将跳转到错误的地方
    \setfontsize{12.5pt}[20pt]
    \vspace*{-0.15cm}
    \begin{center}
      \sffamily
      \setfontsize{18pt}
      \makebox[3.5cm][s]{\textbf\hnu@hnuname}\\
      \textbf{学位论文原创性声明}
    \end{center}
    \vskip 0.3cm

    \hnu@declaretext\par

    \vskip 1cm
    作者签名：\qquad\qquad\qquad\qquad\qquad\quad 日期：\qquad\quad 年\qquad 月\qquad 日
    \vskip 1cm

    \begin{center}
      \sffamily
      \setfontsize{18pt}\textbf{学位论文版权使用授权书}
    \end{center}
    \vskip 0.3cm

    \hnu@authorization\par
    \vskip 1cm

    作者签名：\qquad\qquad\qquad\qquad\qquad\quad 日期：\qquad\quad 年\qquad 月\qquad 日
    
    导师签名：\qquad\qquad\qquad\qquad\qquad\quad 日期：\qquad\quad 年\qquad 月\qquad 日
    \restoregeometry
}

% 摘要、关键字
\newenvironment{abstract}{%
    \hnu@chapter{\hnu@abstractname}%
    % \setcounter{page}{2} % 原创性声明处从 1 开始计数，此时不需要重新 set oage counter
}{}
\newenvironment{enabstract}{%
    \begingroup
        \ctexset{chapter/format=\centering\rmfamily\bfseries\setfontsize{18pt}}%
        \hnu@chapter*{\hnu@enabstractname}
    \endgroup
    \addcontentsline{toc}{chapter}{\rmfamily\hnu@enabstractname}% Abstract 不同于其它 \hnu@chapter，在目录中需要使用粗体
}{}
\newenvironment{summary}{%
  \chapter*{\hnu@summaryname}%
  \addcontentsline{toc}{chapter}{\hnu@summaryname}
}{}
\newenvironment{acknowledgements}{%
  \chapter*{\hnu@acknowledgementsname}%
  \addcontentsline{toc}{chapter}{\normalfont\sffamily\hnu@acknowledgementsname}
}{}

\newcommand\keywords[1]{%
  \par\phantom{empty}\par\noindent\hangindent=4\ccwd\relax%
  \sffamily\textbf{关键词}：#1}
\newcommand\enkeywords[1]{%
  \par\phantom{empty}\par\noindent\hangindent=5.3em\relax%
  \textbf{Key Words}: #1}

% 目录
\renewcommand\tableofcontents{%
    \clearpage%
    \setcounter{tocdepth}{2}
    \pdfbookmark[0]{\hnu@tocname}{hnuchapter.\thehnu@pdfbookmark}\chaptermark{\hnu@tocname}% 将目录添加到 PDF bookmark 中，注意一定要先添加 PDF bookmark，再 \hnu@chapter，否则 PDF bookmark 将跳转到目录章节标题的下方的位置，而不是目录章节标题所在的位置
    \hnu@chapter*{\hnu@tocname}% \hnu@chapter*{...}, 不在目录中的 chapter
    \@starttoc{toc}
}

\RequirePackage{titletoc}
\newcommand\hnu@leaders{\titlerule*[0.5pc]{$\cdot$}}
  \titlecontents{chapter}[0bp]
    {\addvspace{6bp}\bf\sffamily\setfontsize{12.5pt}[15pt]}
    {\contentspush{\thecontentslabel\unskip\hskip\ccwd\relax}}
    {}{\hnu@leaders\setfontsize{12.5pt}[12.5pt]\textnormal{\contentspage}}
    \titlecontents{section}
      [2\ccwd]
      {\setfontsize{12.5pt}[20pt]}
      {\contentspush{\thecontentslabel\hskip\ccwd\relax}}
      {}{\hnu@leaders\setfontsize{12.5pt}[12.5pt]\contentspage}
  \titlecontents{subsection}
      [4\ccwd]
      {\setfontsize{12.5pt}[20pt]}
      {\contentspush{\thecontentslabel\hskip\ccwd\relax}}
      {}{\hnu@leaders\setfontsize{12.5pt}[12.5pt]\contentspage}

  \titlecontents{figure}[0bp]
      {\setfontsize{12.5pt}}
      {\figureautorefname\hspace*{0.5em}\thecontentslabel\quad}
      {}{\hnu@leaders\contentspage}
  \titlecontents{table}[0bp]
      {\setfontsize{12.5pt}}
      {\tableautorefname\hspace*{0.5em}\thecontentslabel\quad}
      {}{\hnu@leaders\contentspage}
      % 为了让图目录另页起，重新定义 \cs{listoffigures}
\renewcommand\listoffigures{%
    \clearpage
    \hnu@chapter{\listfigurename}%
    \@starttoc{lof}}
    % 表目录同样
\renewcommand\listoftables{%
    \clearpage
    \hnu@chapter{\listtablename}%
    \@starttoc{lot}}

\newenvironment{notation}{%
    \cleardoublepage
    \thispagestyle{hnu@notation}
    \ctexset{chapter/format = \centering\rmfamily\setfontsize{12bp}}
    \addcontentsline{toc}{chapter}{\hnu@notationname}
    \setfontsize{10.5bp}[16bp]
    \setlength{\itemsep}{0bp}}{}
\newdimen\bp@ \bp@=1bp

\renewcommand\normalsize{%
  \@setfontsize\normalsize{12\bp@}{20\bp@}%
  \abovedisplayskip 12\bp@ \@plus3\bp@ \@minus7\bp@
  \abovedisplayshortskip \z@ \@plus3\bp@
  \belowdisplayshortskip 6.5\bp@ \@plus3.5\bp@ \@minus3\bp@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI}
\normalsize
  \renewcommand\small{%
     \@setfontsize\small{10.5\bp@}{17.5\bp@}%
     \abovedisplayskip 10.5\bp@ \@plus3\bp@ \@minus6\bp@
     \abovedisplayshortskip \z@ \@plus3\bp@
     \belowdisplayshortskip 6.5\bp@ \@plus3.5\bp@ \@minus3\bp@
     \def\@listi{\leftmargin\leftmargini
                 \topsep 9\bp@ \@plus3\bp@ \@minus5\bp@
                 \parsep 4.5\bp@ \@plus2\bp@ \@minus\bp@
                 \itemsep \parsep}%
     \belowdisplayskip \abovedisplayskip
  }
  \renewcommand\footnotesize{%
     \@setfontsize\footnotesize{9\bp@}{15\bp@}
     \abovedisplayskip 9\bp@ \@plus2\bp@ \@minus5\bp@
     \abovedisplayshortskip \z@ \@plus3\bp@
     \belowdisplayshortskip 6\bp@ \@plus3\bp@ \@minus3\bp@
     \def\@listi{\leftmargin\leftmargini
                 \topsep 6\bp@ \@plus2\bp@ \@minus2\bp@
                 \parsep 3\bp@ \@plus2\bp@ \@minus\bp@
                 \itemsep \parsep}%
     \belowdisplayskip \abovedisplayskip
  }
  \renewcommand\scriptsize{\@setfontsize\scriptsize{7.5\bp@}{12.5\bp@}}
  \renewcommand\tiny{\@setfontsize\tiny{6.5\bp@}{10.83\bp@}}
  \renewcommand\large{\@setfontsize\large{15\bp@}{25\bp@}}
  \renewcommand\Large{\@setfontsize\Large{18\bp@}{30\bp@}}
  \renewcommand\LARGE{\@setfontsize\LARGE{22\bp@}{36.67\bp@}}
  \renewcommand\huge{\@setfontsize\huge{24\bp@}{40\bp@}}
  \renewcommand\Huge{\@setfontsize\Huge{26\bp@}{43.33\bp@}}

% 排版风格，标题，图表
\setlength{\parindent}{2\ccwd}
\setlength{\parskip}{\z@}
\RequirePackage{upgreek}
\renewcommand\pi{\uppi}
\RequirePackage{amssymb}
\renewcommand\le{\leqslant}
\renewcommand\leq{\leqslant}
\renewcommand\ge{\geqslant}
\renewcommand\geq{\geqslant}
\DeclareMathSizes{10.5bp}{10.5bp}{7.35bp}{5.25bp}
\renewcommand{\topfraction}{.85}
\renewcommand{\bottomfraction}{.65}
\renewcommand\textfraction{.15}
\renewcommand{\floatpagefraction}{.6}
\RequirePackage{caption}
\RequirePackage{calc}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{\ccwd}}
\captionsetup{
    format = hang,
    font = {small,bf},
    labelsep = zhspace,
}
\captionsetup[figure]{
    position = bottom,
    aboveskip = 6bp,
    belowskip = {12bp-\intextsep},
}
\captionsetup[table]{
    position = top,
    aboveskip = 6bp,
    belowskip = 6bp,
}
\newcommand\note[1]{%
    \captionsetup{position = bottom, font = small}
    \caption*{\hangindent=2\ccwd\relax\hnu@notesname\rmfamily#1}}
\renewcommand{\thefootnote}{\hnu@textcircled{footnote}}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.25\textwidth
  \kern2.6\p@}
\renewcommand\@makefntext[1]{%
  \parindent 2\ccwd%
  \noindent
  \hb@xt@2\ccwd{\hss\@makefnmark}#1}

%% 参考文献 biblatex
\if@hnu@manualbib % 通过手动修改的 bibitem 输出参考文献。此处仅通过 natbib 重定义上标 \cite 和非上标 \parencite 指令
    \RequirePackage[super,square]{natbib}
    \NewDocumentCommand{\parencite}{o m}{%
        \setcitestyle{square,numbers}%
        \hspace{-.25\ccwd}%如果没有此命令，\parencite 和正文之间会产生奇怪的空白间距
        \IfValueTF{#1}{\cite[#1]{#2}}{\cite{#2}}%
    }
\else
    % first pass options
    \PassOptionsToPackage{
      backend     = biber,
      gbnamefmt   = lowercase,
      gbpub       = false,
      gbtitlelink = true,
      sortlocale  = zh__pinyin,
      uniquelist  = true,
      isbn        = false,
      doi         = false,
      url         = false,
      gbpunctin   = false,
      gbfieldtype = true,
      gbtype      = false, % 文献类型和载体标识符，例如期刊论文: true - [J], false - <什么都不输出>
      % gbmedium    = false, % 文献载体标识，例如在线文章: true - [J/OL], false - [J]。当 gbtype == false 时，此选项无所谓设置什么都不会显示。 
    }{biblatex}
    % then load packages
    \if@hnu@numerical
        \RequirePackage[style=gb7714-2015]{biblatex}
    \else
        \if@hnu@authoryear
            \RequirePackage[style=gb7714-2015ay]{biblatex}
        \else
            \ClassError{hnuthesis}{Unknown option about bibtype.}
            % \RequirePackage{biblatex}
        \fi
    \fi

    % 关于 option - gbpunctin = false
    %   对于 inbook, incollection, inproceedings 类型的条目，文献标题满足格式 `title <in or incn> booktitle`
    %   gb7714-2015 规定 in = //, incn = //，然而部分学校或组织可能认为使用符号 // 很奇怪，gb7714-2015 提供了选项 gbpunction 控制该行为
    %   gbpunctuation = true (default) -> 按照 gb7714-2015 规定 in = //, incn = //
    %   gbpunctuation = false -> in = in, incn = 见 (这是 hnu 的规定)

    % 多作者截断关键字 et al -> 等
    \DefineBibliographyStrings{english}{
      andincite         = {和},
      andincitecn       = {和},
      andothersincitecn = {等人},
      andothersincite   = {等人},
    }

    % 学位论文需要额外说明学位论文级别 (with gbfieldtype = true)
    %     biblatex 会首先检查参考文献的 bib 条目中是否存在 type 域，如果不存在则按照以下方式说明
    %     按照 HNU 的要求，
    %         格式为，［学校及学位论文级别］.保存地点：保存单位
    %         例如，  湖南大学：博士学位论文. 长沙：湖南大学
    %     对于这样的输出要求，由于能力有限，暂时没法做到自动化显示参考文献
    \DefineBibliographyStrings{english}{
    mathesis={str you want ma thesis},
    mathesiscn={硕士学位论文},
    phdthesis={str you want for phd thesis},
    phdthesiscn={博士学位论文}
    }

    % 对于包括 arxiv(@misc) 在内的 online 条目，不显示 urldate
    %     urldate is splitted into (urlyear, urlmonth, urlday)
    %     clear urlyear is enough, when urlyear is lacking, do not print urlmonth and urlday
    \AtEveryBibitem{%
    \ifentrytype{online}{
        % \clearfield{url}%
        \clearfield{urlyear}
    }{}
    }

    % Provice \printbibitembibliography -> 输出 biblatex 参考文献输出结果所对应的 bibitem 条目
    \RequirePackage{biblatex2bibitem}
\fi

%% 链接
\urlstyle{same}
\g@addto@macro\UrlBreaks{%
  \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j%
  \do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t%
  \do\u\do\v\do\w\do\x\do\y\do\z%
  \do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J%
  \do\K\do\L\do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T%
  \do\U\do\V\do\W\do\X\do\Y\do\Z%
  \do\1\do\2\do\3\do\4\do\5\do\6\do\7\do\8\do\9\do\0%
}


%% 数学环境
\RequirePackage{amsmath,amsthm,thmtools}

% the flexible space before and after display equation (see https://www.overleaf.com/learn/latex/%5Cabovedisplayskip_and_related_commands)
%   原模板采取固定的 16bp，对于充满公式的数学论文来说显得整体比较松散
%   另外，通过 \@minus 2bp 增加灵活的调整空间
\g@addto@macro\normalsize{%
  \abovedisplayskip       = 10bp \@minus 2bp
  \abovedisplayshortskip  = 10bp \@minus 2bp
  \belowdisplayskip       = \abovedisplayskip
  \belowdisplayshortskip  = \abovedisplayshortskip
}

% theorem
\declaretheoremstyle[
  headindent    = 2em,
  headpunct     = {},
  notefont      = \normalfont\bfseries,
  bodyfont      = \it, % 定理环境下采用斜体
  postheadspace = 1em
]{theoremStyle}
\declaretheorem[name={定理},style=theoremStyle,numberwithin=chapter]{theorem}
\declaretheorem[name={引理},style=theoremStyle,numberlike=theorem]{lemma}
\declaretheorem[name={命题},style=theoremStyle,numberlike=theorem]{proposition}
\declaretheorem[name={推论},style=theoremStyle,numberlike=theorem]{corollary}
\declaretheorem[name={断言},style=theoremStyle,numberlike=theorem]{assertion}
\declaretheorem[name={公理},style=theoremStyle,numberlike=theorem]{axiom}

% definition
\declaretheoremstyle[
  headindent    = 2em,
  headpunct     = {},
  notefont      = \normalfont\bfseries,
  bodyfont      = \normalfont, % 定义环境下不采用斜体
  postheadspace = 1em
]{defStyle}
\declaretheorem[name={定义},style=defStyle,numberwithin=chapter]{definition}
\declaretheorem[name={算例},style=defStyle,numberwithin=chapter]{example}
\declaretheorem[name={注},style=defStyle,numberwithin=chapter]{remark}

% proof
\declaretheoremstyle[
  % spaceabove = -6pt, 
  spacebelow    = 10bp, 
  headindent    = 2em,
  headpunct     = {},
  headfont      = \normalfont\bfseries, 
  bodyfont      = \normalfont,
  postheadspace = 1em, 
  qed           = $\blacksquare$, 
]{proofStyle}
\declaretheorem[name={证明}, style=proofStyle, unnumbered]{Proof}
\renewcommand{\proof}{\Proof} % 不太优雅的实现。declaretheorem[...]{} 只能定义新的环境，不能重新定义环境

% 允许太长的公式断行、分页等（From TongjiThesis）
\allowdisplaybreaks[4]
\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter.\fi\@arabic\c@equation}

% 算法和代码：
% 算法环境
\RequirePackage[algoruled, algochapter, lined, linesnumbered]{algorithm2e}
\renewcommand{\algorithmcfname}{算法}
\RequirePackage{listings}
\lstset{
    basicstyle=\small\ttfamily,
    xleftmargin=2pc,
    xrightmargin=2pc,
    frame=single,
    columns=flexible,
    numbers=left,
}
\newcommand{\rememberlines}{\xdef\rememberedlines{\number\value{AlgoLine}}}
\newcommand{\resumenumbering}{\setcounter{AlgoLine}{\rememberedlines}}

\RequirePackage[skins]{tcolorbox}
\newtcolorbox{talgorithm}[2][]{%
  blanker,float=tbp,grow to left by=#2,grow to right by=#2,
  before upper={\begin{algorithm}[H]},
  after upper={\end{algorithm}},
  #1
}
