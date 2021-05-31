% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% CSULB MS Thesis Class											%
% v1.0 - April 2020												%
%																%
% Written by Arya Daroui:  daroui.arya@gmail.com				%
% This work is under the MIT License							%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% --- Class setup --- %
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csulbmsthesis}[2020/04/23 v1.0]
\AtEndOfClass{\RequirePackage{microtype}}
\ProcessOptions*
\LoadClass[12pt, oneside]{book}


% --- Page setup --- %
\RequirePackage[margin=1in, includefoot, heightrounded]{geometry}
\pagestyle{plain} % remove headers
\usepackage[T1]{fontenc} % 8-bit font encoding
\RequirePackage{newtxtext, newtxmath} % times new roman
\RequirePackage{setspace} % variable spacing commands
\setlength{\parindent}{2em} 
\RequirePackage{enumitem}	% better enumerated lists
\RequirePackage{graphicx} % insert graphics
\RequirePackage{amsmath} % better math
\RequirePackage{hyperref}
\hypersetup{
	colorlinks, 
	citecolor=black, 
	linkcolor=black, 
	urlcolor=black
}

%% ragged paragarphs
\RequirePackage{ragged2e} % fancy ragged right for captions
%%% \setlength{\RaggedRightParindent}{\parindent} % indent paragraphs when using \RaggedRight from ragged2e,  but we just use the OG \raggedright because it throws fewer underfull hbox errors
\RequirePackage{indentfirst} % indents first paragraph
%%% below indents paraggraphs when using OG \raggedright command
\newlength{\normalparindent}
\setlength{\normalparindent}{\parindent}
\raggedright
\setlength{\parindent}{\normalparindent}

%% footnotes
%%% make footnotes normal sized
\let\oldfootnotesize\footnotesize
\renewcommand*{\footnotesize}{\oldfootnotesize\normalsize}


% --- Table of contents and lists --- %
\RequirePackage{tocloft}

%% table of contents
\setcounter{tocdepth}{0} % only display parts and chapters in table of contents
\renewcommand*\contentsname{TABLE OF CONTENTS}
\renewcommand{\cfttoctitlefont}{\hspace*{\fill}\normalsize\bfseries} % keep consistent font size
\renewcommand{\cftaftertoctitle}{\hspace*{\fill}}
\setlength{\cftbeforetoctitleskip}{0pt}
\renewcommand{\cftchapaftersnum}{.}
\setlength{\cftaftertoctitleskip}{0pt}
\setlength{\cftchapindent}{1.5em} % set indents for chapters
%%% make everything normal font and not bold
\addtocontents{toc}{\string\renewcommand{\protect\cftchappagefont}{\protect\normalfont}}
\addtocontents{toc}{\string\renewcommand{\protect\cftchapfont}{\protect\normalfont}}
\addtocontents{toc}{\string\renewcommand{\protect\cftchapleader}{\protect\normalfont\protect\cftdotfill{\protect\cftsecdotsep}}}
\addtocontents{toc}{\string\renewcommand{\protect\cftpartpagefont}{\protect\normalfont}}
\addtocontents{toc}{\string\renewcommand{\protect\cftpartfont}{\protect\normalfont}}
\addtocontents{toc}{\string\renewcommand{\protect\cftpartleader}{\protect\normalfont\protect\cftdotfill{\protect\cftsecdotsep}}}
%%% vertically distribute table of contents items evenly
\setlength{\cftbeforechapskip}{12pt}
\setlength{\cftbeforepartskip}{12pt}

%% list of figures
\renewcommand*\listfigurename{LIST OF FIGURES}
\renewcommand{\cftloftitlefont}{\hspace*{\fill}\normalsize\bfseries} % keep consistent font size
\renewcommand{\cftafterloftitle}{\hspace*{\fill}}
\renewcommand{\cftfigaftersnum}{.}
\setlength{\cftbeforeloftitleskip}{0pt} % keep at 1 inch margin
\setlength{\cftafterloftitleskip}{0pt} % keep the double spacing
\setlength{\cftfigindent}{0pt}  % remove indentation from figures in lof
\cftsetindents{figure}{0em}{4em} % set indents

%% list of tables
\renewcommand*\listtablename{LIST OF TABLES}
\renewcommand{\cftlottitlefont}{\hspace*{\fill}\normalsize\bfseries} % keep consistent font size
\renewcommand{\cftafterlottitle}{\hspace*{\fill}}
\setlength{\cftbeforelottitleskip}{0pt} % keep at 1 inch margin
\renewcommand{\cfttabaftersnum}{.} 
\setlength{\cftafterlottitleskip}{0pt} % keep the double spacing
\setlength{\cfttabindent}{0pt}  % remove indentation from tables in lot
\cftsetindents{table}{0em}{4em}  % set indents


% --- Tables, figures, equations --- %
\RequirePackage{caption}
\captionsetup{figurename=FIGURE, tablename=TABLE, labelfont=bf, textfont=bf, compatibility=true, justification=raggedright, singlelinecheck=false, labelsep=period}
\RequirePackage{chngcntr}
\counterwithout{figure}{chapter} % continuous numbering
\counterwithout{table}{chapter}  % continuous numbering
\counterwithout{equation}{chapter}


% --- Headings --- %
\RequirePackage[compact]{titlesec}

%% reduce vertical space after headings
\titleformat{\chapter}[display]{\bfseries\centering}{\chaptertitlename\ \thechapter}{0pt}{\vskip12pt}
\titlespacing*{\chapter}{0pt}{0pt}{0pt}
\titlespacing*{\section}{0pt}{0pt}{0pt}
\titlespacing*{\subsection}{0pt}{0pt}{0pt}
\titlespacing*{\subsubsection}{\parindent}{0pt}{0.4em}

%% placement on page and format
\renewcommand{\chaptername}{CHAPTER} % make chapter titles uppercase
\titleformat{\section}{\normalfont\bfseries\centering}{\thesection}{1em}{}
\titleformat{\subsection}{\normalfont\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}[runin]{\bfseries}{\thesubsubsection}{3pt}{\space}[.]
\setcounter{secnumdepth}{3} % numbered subsubsections


% --- Appendices--- %
\RequirePackage[title]{appendix}

% --- Bibliogaphy and references --- %
\patchcmd{\thebibliography}{\chapter*}{}{}{}


% --- Code listings --- %

% --- Custom commands --- %
%% change \part command so it doesn't make its own page
\renewcommand{\part}[1]{\newpage \begin{center} \textbf{#1} \end{center}  \addcontentsline{toc}{part}{#1}}

%% command for the title of a single appendix for user convenience
\newcommand{\singleAppendixTitle}[1]{
	\def\singleAppendixTitle{#1} \clearpage
	\vspace*{\fill}
	\centering 
	\doublespacing
	\textbf{APPENDIX} \\
	\textbf{\singleAppendixTitle}
	\addcontentsline{toc}{part}{APPENDIX: \singleAppendixTitle}
	\vspace*{\fill}
	\clearpage
	\raggedright
}

%% macro for the title of a appendix when there a multiple appendices for user convenience
\newcommand{\multAppendixTitle}[1]{
	\doublespacing
	\vspace*{\fill} 
	\chapter{#1}
	\vspace*{\fill}
	\singlespacing
	\clearpage
	\raggedright
}

%% macro to place the table of contents, list of figures, and list of tables for user convenience
\newcommand{\tocTabFigLists}{
	\clearpage
	\tableofcontents
	\clearpage
	\listoftables
	\addcontentsline{toc}{part}{LIST OF TABLES}
	\clearpage
	\listoffigures
	\addcontentsline{toc}{part}{LIST OF FIGURES}
}

%% macro to place the title page when there are multiple appendices
\newcommand{\appendicesTitlePage}{
		\clearpage
		\vspace*{\fill}
		\begin{center}
			\textbf{APPENDICES}
		\end{center}
		\addcontentsline{toc}{part}{APPENDICES}
		\vspace*{\fill}
		\renewcommand{\appendixname}{APPENDIX}
		\titleformat{\chapter}[display]{\vspace*{3in}\normalfont\bfseries\centering}{\chaptertitlename\ \thechapter}{12pt}{\normalsize}
}

%% macro to place and name the bibliography title page and the heading in the bibliography
\newcommand{\bibTitlePage}[1]{
		\clearpage
		\vspace*{\fill} 
		\centering
		\textbf{#1}
		\addcontentsline{toc}{part}{#1}
		\vspace*{\fill}
		\clearpage
		\renewcommand\bibname{\textbf{#1}}
}

%% footnote without number
\newcommand\blfootnote[1]{%
  \begingroup
  \renewcommand\thefootnote{}\footnote{#1}%
  \addtocounter{footnote}{-1}%
  \endgroup
}

%% hanging indent in the list of figures/tables and preserve the raggedness in the docoument caption
%%% IMPORTANT. This breaks some features in the caption package such as \caption*,  \caption[],  etc. If these features are needed,  set comptatibility=false in the package options. You will have to use a custom \mycaption{} command to achieve the desired hanging indent effect in all your figures and tables. It is provided below if needed.
\let\oldcaption\caption
\renewcommand{\caption}[1]{\oldcaption[\addtolength{\leftskip}{\bibindent}\hspace{-\bibindent}#1]{#1}}
% \newcommand{\mycaption}[1]% duplicate long and short captions
% {\caption[\addtolength{\leftskip}{\bibindent}\hspace{-\bibindent}#1]{#1}}
% \captionsetup{format=hang}