% <<< preamble

\def\fileversion{v2.30b}
\def\filedate{2020/02/20}
\def\clsname{uiucthesis2020}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{\clsname}[\filedate\ \fileversion\ UIUC Thesis Class]

% >>>

% <<< declare options

% draft features
\newif\if@thesisdraft \@thesisdraftfalse
\DeclareOption{draftthesis}{\@thesisdrafttrue}

% double spacing
\newif\if@doublespacing \@doublespacingfalse
\DeclareOption{doublespacing}{\@doublespacingtrue}

% electronic deposit format
\newif\if@edeposit \@edepositfalse
\DeclareOption{edeposit}{\@edeposittrue}

% additional options passed to `scrbook` class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\PassOptionsToClass{DIV=12}{scrbook}

% >>>

% <<< process options

\ProcessOptions
\LoadClass{scrbook}

% force serif fonts
\addtokomafont{disposition}{\rmfamily}
% additional options
\KOMAoptions{
    chapterentrydots=true,
}

\if@edeposit
    \KOMAoption{twoside}{false}
\else
    \KOMAoption{twoside}{true}
\fi

\if@thesisdraft
    \newcount\timehh\newcount\timemm
    \timehh=\time \divide\timehh by 60
    \timemm=\time \count255=\timehh \multiply\count255 by -60
        \advance\timemm by \count255
    \def\draftheader{
        \slshape Draft of \today\ at
        \ifnum\timehh<10 0\fi\number\timehh
        \,:\,%
        \ifnum\timemm<10 0\fi\number\timemm}%
\else
    \def\draftheader{\empty}
\fi

% >>>

% <<< required packages

% NOTE: load packages after the class was loaded since they may depend on it

% used to set doublesplacing
\RequirePackage{setspace}
% customize the toc
\RequirePackage{tocbasic}
% customize headers and footers
\RequirePackage{scrlayer-scrpage}

% enable this to better check sizing
% \RequirePackage[grid, gridunit=in, texcoord]{eso-pic}

% >>>

% <<< title commands

\def\@mkuptitle#1{\gdef\@Utitle{#1}}
\def\title#1{\gdef\@title{#1}\uppercase{\protect\@mkuptitle{#1}}}

\def\@mkupauthor#1{\gdef\@Uauthor{#1}}
\def\author#1{\gdef\@author{#1}\uppercase{\protect\@mkupauthor{#1}}}

\def\department#1{\def\@dept{#1}}
\def\college#1{\def\@college{#1}}
\def\schools#1{\def\@schools{#1}}
\def\degreeyear#1{\def\@degreeyear{#1}}

\def\phdthesis{
    \def\@degree{Doctor of Philosophy}
    \def\degree{Ph.D.}
    \def\@thesisname{DISSERTATION}
    \def\@committeename{Doctoral Committee:}
    }

\def\msthesis{
    \def\@degree{Master of Science}
    \def\degree{M.S.}
    \def\@thesisname{THESIS}
    \def\@committeename{Master's Committee:}
    }

\newcommand{\otherdoctorate}[2]{
    \def\@degree{#1}
    \def\degree{#2}
    \def\@thesisname{DISSERTATION}
    \def\@committeename{Doctoral Committee:}
    }

\newcommand{\othermasters}[2]{
    \def\@degree{#1}
    \def\degree{#2}
    \def\@thesisname{THESIS}
    \def\@committeename{Master's Committee:}
    }

\newcommand{\committee}[1]{\gdef\@committee{#1}}
\newcommand*{\volume}[1]{\gdef\thesis@volume{VOLUME~#1}}
\newcommand*{\thesis@volume}{}

\newcommand*{\advisor}[1]{\gdef\@advisor{#1}}
\newcommand*{\adviser}[1]{\gdef\@advisor{#1}}

\if@edeposit
    \gdef\@committee{%
        \ClassError{\clsname}{A committee must be specified for e-deposit dissertations.}%
        {Use \protect\committee\space with members separated by \protect\\'s.}}
\fi

% define copyright page
\newif\if@thesiscrpage \@thesiscrpagetrue
\def\copyrightnotice{\copyright Copyright~\@degreeyear~by \@author.}
\let\nocopyrightpage\@thesiscrpagefalse
\if@thesisdraft
    \nocopyrightpage
\fi

% set default values
\def\@college{Graduate College}
\def\@degreeyear{\number\year}

% >>>

% <<< title pages

\renewcommand{\maketitle}{
% <<< copyright

\if@thesiscrpage
    \newpage
    \thispagestyle{empty}
    \null\vfill
    \centerline{\copyrightnotice}%
    \vskip 3ex % skip to visually center copyright notice
    \vfill
\fi

% >>>

\newpage

% <<< title

\thispagestyle{empty}

% set font sizes
\begingroup
\def\baselinestretch{1}
\large

% reset top margins so that our offsets work as expected
\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}
\setlength{\topmargin}{0in}

% make odd/even margins the same
\@tempdima=\paperwidth
\advance\@tempdima by -\textwidth
\divide\@tempdima by 2
\advance\@tempdima by -1in
\oddsidemargin=\@tempdima
\let\evensidemargin=\oddsidemargin

\begin{center}
% see https://grad.illinois.edu/files/pdfs/thesis-doctoral-titlepage-example.pdf
% for details about some of these numbers, but note that they are eyeballed
\newlength{\dim@tptopoffset}
\setlength{\dim@tptopoffset}{1in}

\newlength{\dim@tptitleoffset}
\setlength{\dim@tptitleoffset}{1.5in}

\newlength{\dim@tpauthoroffset}
\setlength{\dim@tpauthoroffset}{1.5in}

\newlength{\dim@tpvolumeoffset}
\setlength{\dim@tpvolumeoffset}{0.5in}

\newlength{\dim@tpsubmissionoffset}
\setlength{\dim@tpsubmissionoffset}{2.0in}

\newlength{\dim@tplocationoffset}
\setlength{\dim@tplocationoffset}{0.25in}

% set an offset at the top
\vbox to \dim@tptopoffset {}
% title
\vbox to \dim@tptitleoffset {%
    {\@Utitle}
    \if@thesisdraft
    \\[11pt]
    \draftheader
    \fi
    \vfil}
% author
\vbox to \dim@tpauthoroffset {%
    {BY} \\[11pt]
    {\@Uauthor} \\[11pt]
    \vfil}%
% statement
\vbox to \dim@tpvolumeoffset {\thesis@volume\vfil}
\vbox to \dim@tpsubmissionoffset {%
    {\@thesisname} \\[11pt]
    Submitted in partial fulfillment of the requirements \\
    for the degree of \@degree\ in \@dept \\
    in the \@college\ of the \\
    University of Illinois at Urbana-Champaign, \@degreeyear\vfil}
% location
\vbox to \dim@tplocationoffset {Urbana, Illinois}
\end{center}

% offset for `Doctoral Committee` line
\newlength{\dim@tpcommitteename}
\setlength{\dim@tpcommitteename}{\oddsidemargin}
\advance\dim@tpcommitteename by -0.3125in
% offset for lines with committee members
\newlength{\dim@tpcommittee}
\setlength{\dim@tpcommittee}{\oddsidemargin}
\advance\dim@tpcommittee by -0.6875in

% committee
\begin{flushleft}
    \vbox to 0.3in {
    \hspace{-\dim@tpcommitteename}\@committeename\\}
    \hspace{-\dim@tpcommittee}\begin{tabular}{l}\@committee\end{tabular}\vfil
\end{flushleft}

\endgroup

% >>>

\newpage
}

% add a nice dedication environment
\renewenvironment{dedication}{
    \newpage\leavevmode\vfill
    \begin{center}
        \itshape
}{
    \end{center}
    \vskip 3ex
    \vfill
    \newpage
}

% >>>

% <<< front matter

% NOTE: https://grad.illinois.edu/thesis/format-abstract
% says that `ii` should be the page number on abstract page for the manuscript
\let\thesis@frontmatter=\frontmatter
\def\frontmatter{%
    \thesis@frontmatter
    \if@edeposit
        \setcounter{page}{2}
    \else
        \if@thesiscrpage
            \setcounter{page}{3}
        \else
            \setcounter{page}{2}
        \fi%
    \fi%
}

% >>>

% <<< main matter

% add line numbers if in draft mode
\if@thesisdraft
    \RequirePackage{lineno}
    \RequirePackage{xcolor}
    \renewcommand{\linenumberfont}{
        \normalfont\footnotesize\textcolor{black!50}
    }

    \let\thesis@mainmatter=\mainmatter
    \def\mainmatter{\linenumbers\thesis@mainmatter}
\fi

% >>>

% <<< table of contents

% change name
\AtBeginDocument{
    \renewcommand{\contentsname}{Table of Contents}
}

% make sure its single spaced
\let\thesis@tableofcontents=\tableofcontents
\def\tableofcontents{%
    {\singlespacing\thesis@tableofcontents}}

% add some more spacing to sections
\DeclareTOCStyleEntry[beforeskip=0.5em]{section}{section}

% >>>

% <<< lists of tables and figures and such

\let\thesis@listoftables=\listoftables
\def\listoftables{%
    \addcontentsline{toc}{chapter}{\listtablename}%
    {\singlespacing\thesis@listoftables}%
}

\let\thesis@listoffigures=\listoffigures
\def\listoffigures{%
    \addcontentsline{toc}{chapter}{\listfigurename}%
    {\singlespacing\thesis@listoffigures}%
}

\newenvironment*{symbollist}[1][1in]{
\begin{list}{}{\singlespacing
    \setlength{\leftmargin}{#1}
    \setlength{\labelwidth}{#1}
    \addtolength{\labelwidth}{-\labelsep}
    \setlength{\topsep}{0in}}%
    \def\makelabel##1{\hfil##1\hfil}%
}{
    \end{list}
}

\newenvironment*{symbollist*}[1][1in]{
    \begin{symbollist}[#1]
    \def\makelabel##1{##1\hfil}
}{
    \end{symbollist}
}

% >>>

% <<< abstract

\def\abstractname{Abstract}
\newenvironment{abstract}{\chapter*{\abstractname}}{}

% >>>

% <<< chapter / section styling

% set font sizes
\newcommand\chapternumberfont{\huge\bfseries}
\newcommand\chaptertitlefont{\Huge\bfseries}
\newcommand{\sectiontitlefont}{\Large\bfseries}
\newcommand{\subsectiontitlefont}{\large\bfseries}
\newcommand{\subsubsectiontitlefont}{\normalsize\bfseries}
% add a `Chapter ...` in front of toc entries
\DeclareTOCStyleEntry[
    dynnumwidth
]{chapter}{chapter}
\let\thesis@addchaptertocentry=\addchaptertocentry
\def\addchaptertocentry#1#2{
    \ifstr{#1}{}{
        \thesis@addchaptertocentry{#1}{#2}}{
        \thesis@addchaptertocentry{\chapapp{} #1}{#2}}
}

% nice spacing for the chapter title
\newskip{\dim@chapskip}
\newlength{\dim@chapternumberheight}

\newlength{\chaptertitleheight}
\setlength{\chaptertitleheight}{1.85in}

\def\@makechapterhead#1{%
\vbox to \chaptertitleheight {
    \def\baselinestretch{1}\@normalsize
    \parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \if@mainmatter
            \dim@chapskip=\z@
            {\chapternumberfont \@chapapp\space \thechapter}
            \par\nobreak
            \vskip 20\p@
        \fi
    \fi

    \interlinepenalty\@M
    \vspace*{\dim@chapskip}%
    \chaptertitlefont #1
    \vfil
    }%
\par\nobreak%
}

\def\@makeschapterhead#1{%
\vbox to \chaptertitleheight {
    \def\baselinestretch{1}\@normalsize
    \parindent \z@ \raggedright \normalfont

    \interlinepenalty\@M
    \vspace*{\dim@chapskip}
    \chaptertitlefont #1
    \vfil
    }%
\par\nobreak%
}

% >>>

% <<< appendix

\let\thesis@appendix=\appendix
\if@thesisdraft
    \renewcommand{\appendix}{\linenumbers\thesis@appendix\@ifstar{\gdef\thechapter{}}{}}
\else
    \renewcommand{\appendix}{\thesis@appendix\@ifstar{\gdef\thechapter{}}{}}
\fi

% >>>

% <<< bibliography

\renewcommand{\bibname}{References}

\AtBeginDocument{
\let\thesis@thebib\thebibliography
\let\thesis@endbib\endthebibliography

\def\thebibliography{
    \begingroup%
    \singlespacing%
    \chapter{\bibname}%
    \let\chapter\@gobbletwo%
    \thesis@thebib%
    }
\def\endthebibliography{
    \thesis@endbib%
    \endgroup%
    }
}

% >>>

% <<< index

\let\thesis@theindex=\theindex
\def\theindex{
    \addcontentsline{toc}{chapter}{\indexname}%
    \begingroup\singlespacing\thesis@theindex
}

\let\thesis@endtheindex=\endtheindex
\def\endtheindex{\thesis@endtheindex\endgroup}

% >>>

% <<< page header/footer styles

\pagestyle{plain}
\clearscrheadfoot

\cofoot[\pagemark]{\pagemark}
\lohead[\draftheader]{\draftheader}
\if@edeposit \else
    \cefoot[\pagemark]{\pagemark}
    \rehead[\draftheader]{\draftheader}
\fi

% >>>

% <<< spacing

\pagenumbering{roman}
\if@doublespacing
    \doublespacing
\else
    \onehalfspacing
\fi

% >>>

\endinput

%% vim: nospell:filetype=tex
