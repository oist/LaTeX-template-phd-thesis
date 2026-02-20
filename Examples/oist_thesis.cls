
% A LaTeX2e class for thesis submissions to
% Okinawa Institute of Science and Technology (OIST):
%
% Tadashi Kozuno (tadashi.kozuno@gmail.com)
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{oist_thesis}[2019/3/17 OIST thesis submission class]

\newif\if@final\@finaltrue
\DeclareOption{temporary}{\@finalfalse}
\DeclareOption{final}{\@finaltrue}

\ProcessOptions\relax

%-------------------------------------------------------------------------------
%	HANDLING THE STYLE OF THE THESIS
%-------------------------------------------------------------------------------

\LoadClass[12pt, oneside]{book} % 12 pt font, one-sided book style

\RequirePackage[a4paper, inner=3cm ,outer=2.5cm, top=2.4cm, bottom=2.5cm]{geometry}  % Changing size of document

\usepackage{titlesec} % To move the chapter title up
\titleformat{\chapter}[display]{\normalfont\huge\bfseries}{\chaptertitlename\ \thechapter}{20pt}{\LARGE}
\titlespacing{\chapter}{0pt}{0pt}{20pt} % 0 left, 0 top, 20 bottom

\if@final
    \RequirePackage[font={footnotesize}, labelfont=bf, singlelinecheck=no]{caption} % caption: FIG in bold
	\newcommand{\thesisspacing}{\singlespacing}
\else
	\RequirePackage[font={onehalfspacing, footnotesize}, labelfont=bf, singlelinecheck=no]{caption} % caption: FIG in bold, 1.5 line spacing in figure and table captions
	\newcommand{\thesisspacing}{\doublespacing}
\fi

\newcommand{\unnumberedchapter}[1]{ % Preparation for unnumbered chapters
	\phantomsection % To help hyperref link to the right page
	\addcontentsline{toc}{chapter}{#1} % Also adds the chapter name to the Contents
}

\newcommand{\startpreamble}{
	\frontmatter % Use roman page numbering style (i, ii, iii, iv...) for the preamble pages
	\pagestyle{plain} % plain page number
	\setcounter{page}{2} % Include the title page in page counting
	\thesisspacing % Double or single spacing
}

% Be strict about what counts as "overfull"
\hfuzz=0pt
\vfuzz=0pt

% Make overfull lines visible in the PDF margin (set 0pt to disable)
\overfullrule=5pt

%-------------------------------------------------------------------------------
%	BUILDING THE TITLE PAGE
%-------------------------------------------------------------------------------

\newcommand\BackgroundPic{% Adding background picture
	\put(-250,-160){%
		\parbox[b][\paperheight]{\paperwidth}{%
			\vfill
			\centering
			\includegraphics[width=\paperwidth]{./Images/symbol.jpg}%
			\vfill
}}}

\RequirePackage{xkeyval} % Handling keyword options.

\newif\if@cosupervisorexist\@cosupervisorexistfalse
\define@key[OIST]{title}{title}{\def\thesistitle{#1}}
\define@key[OIST]{title}{name}{\def\name{#1}}
\define@key[OIST]{title}{supervisor}{\def\supervisor{#1}}
\define@key[OIST]{title}{cosupervisor}{\def\cosupervisor{#1}\@cosupervisorexisttrue}
\define@key[OIST]{title}{submissiondate}{\def\submissiondate{#1}}

\providecommand{\puttitle}{}
\renewcommand{\puttitle}[1]{
	\@puttitle{}{#1}
}

\providecommand{\@puttitle}{}
\renewcommand{\@puttitle}[2]{%
	\setkeys[OIST]{title}{#2}

	\begin{titlepage}
		\AddToShipoutPicture*{\BackgroundPic}
		\begin{center}
			\vfill
			{\large \scshape Okinawa Institute of Science and Technology\\Graduate University}\\[0.7cm]
			{\large Thesis submitted for the degree }\\[0.7cm]
			{\Large Doctor of Philosophy}\\[0.5cm]
			\rule{\textwidth}{1.5pt}\\[0cm]
			{\huge \bfseries \thesistitle \par \ }\\[-0.5cm]
			\rule{\textwidth}{1.5pt}\\[2.5cm]
			\hfill  by\\[1cm]
			\hfill  {\large \bfseries\name}\\
			\vfill
			{\hfill \large Supervisor: \textbf{\supervisor}} \\
			\if@cosupervisorexist{\hfill \large Co-Supervisor: \textbf{\cosupervisor} \\}\else\fi
			\vspace{1cm}
			\hfill  \submissiondate
		\end{center}
	\end{titlepage}
}
