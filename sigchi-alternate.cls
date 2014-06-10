%%
%% ACM-SIGCHI document class for CHI 
%%
%%    by Henning Pohl, October 8, 2012
%%
%% Adapted from sigchi class previously edited by:
%%   Michel Beaudouin-Lafon (CHI 2013)
%%   William Hudson         (CHI 2012)
%%   Jean-Daniel Fekete     (CHI 2012)
%%   Manas Tungare
%%   Jan O. Borchers
%%   G.K.M. Tobin
%%   Olin Shivers
%%   Kevin B. Theobald
%%
%% Adapted from ARTICLE document style by Ken Traub, Olin Shivers
%% Excerpts were taken from (Journal Style) 'esub2acm.cls'
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sigchi-alternate} [2012/10/08]
\DeclareOption{10pt}{\ClassError{sigchi}{Option `10pt' not supported}{}}
\DeclareOption{11pt}{\ClassError{sigchi}{Option `11pt' not supported}{}}
\DeclareOption{12pt}{\ClassError{sigchi}{Option `12pt' not supported}{}}
\DeclareOption{nohyperref}{\def\@dontloadhyperref{}}
\DeclareOption{tightbibliography}{\def\@tightbibliography{}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{proc}}
\ProcessOptions
\LoadClass[twocolumn]{proc} % extend proc class (is mostly overwritten)
\input{sigchi-alternate.clo} % set font sizes to 9pt (code adapted from classes.dtx)

% Paper size and margin definition
\RequirePackage[
  letterpaper,
  headheight=12pt,
  headsep=25pt,
  footskip=30pt,
  twocolumn,
  columnsep=0.33in,
  nomarginpar,
  footnotesep=5.6pt,
  hmargin=0.75in,
  bottom=1in,
  top=0.75in
]{geometry}
\@ifundefined{footheight}{\newdimen\footheight}{}
\setlength{\footheight}{12pt}

\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}

% Load some utility packages
\RequirePackage{etoolbox}
\RequirePackage{calc}
\RequirePackage{xparse}

% The picture package is needed to use LaTeX lengths directly in the picture environment of the copyright box
\RequirePackage{picture}

% Provides \balance command which has to be manually 
% added at roughly the first column of the last page
\RequirePackage{balance}

% Required for copyright box on first page
\RequirePackage{newfloat}

% Make Helvetica default sans-serif font (scaled to match times)
\RequirePackage[scaled=0.92]{helvet}

% Make Times default serif font
\RequirePackage{mathptmx}

% Make Courier default typewriter font
\RequirePackage{courier}

% Use Type1 fonts
\RequirePackage[T1]{fontenc}

% Figure(*) and Table(*) fixes
\RequirePackage{fixltx2e}

% Figure layout rules
\setcounter{topnumber}{2}
\renewcommand{\topfraction}{.7}
\setcounter{bottomnumber}{1}
\renewcommand{\bottomfraction}{.3}
\setcounter{totalnumber}{5} % allow more floats per page than default
\renewcommand{\textfraction}{.2} 
\renewcommand{\floatpagefraction}{.5}
\setcounter{dbltopnumber}{2}
\renewcommand{\dbltopfraction}{.7}
\renewcommand{\dblfloatpagefraction}{.5}

% Caption formating
\RequirePackage[
  font={small, bf, rm}, % 9pt bold times
  labelformat=simple,
  textformat=simple,
  labelsep=period,
  justification=justified,
  singlelinecheck=true, % center one-line captions
  skip=2pt
]{caption}


% Section format rules
\RequirePackage[overload]{textcase}
\RequirePackage{titlesec}
% command syntax is:
% \titleformat{COMMAND}[SHAPE]{FORMAT FOR WHOLE TITLE}{LABEL}{HORIZONTAL SPACE BETWEEN LABEL AND TITLE BODY}{BEFORE TITLE CODE}[AFTER TITLE CODE]
% \titlespacing{COMMAND}{LEFT MARGIN}{VERTICAL SPACE BEFORE TITLE}{VERTICAL SPACE AFTER TITLE}[RIGHT MARGIN]
\titleformat{\section}[hang]{\baselineskip=14pt\fontsize{9}{14}\selectfont\bfseries\sffamily}{\thesection}{0.5em}{\MakeTextUppercase}
\titlespacing*{\section}{0pt}{8pt plus 3pt minus 3pt -\parskip}{0.5pt-\parskip}
\titleformat{\subsection}[hang]{\baselineskip=14pt\fontsize{9}{14}\selectfont\bfseries\sffamily}{\thesubsection}{0.5em}{}
\titlespacing*{\subsection}{0pt}{8pt plus 3pt minus 3pt -\parskip}{0.5pt-\parskip}
\titleformat{\subsubsection}[hang]{\baselineskip=14pt\fontsize{9}{14}\selectfont\itshape\sffamily}{\thesubsubsection}{0.5em}{}
\titlespacing*{\subsubsection}{0pt}{4pt plus 2pt minus 1pt -\parskip}{0.5pt-\parskip}
\titlespacing*{\paragraph}{0pt}{4pt plus 2pt minus 1pt -\parskip}{0.5pt-\parskip}
\setcounter{secnumdepth}{-2} % turn of section numbering (-1 is part level)


% Set some common hyperref parameters (assume pdftex is used)
\@ifundefined{@dontloadhyperref}{
  \RequirePackage[
    pdftex,
	pdflang={en-US},
    bookmarks=true,
    bookmarksnumbered=false,
    colorlinks,
    allcolors=black,
    breaklinks=true,
  ]{hyperref}
}{}


% Disallow 'list of ...' and marginpar commands
\renewcommand{\tableofcontents}{\ClassError{sigchi}{Tables of contents are not allowed.}{}}
\renewcommand{\listoffigures}{\ClassError{sigchi}{Lists of figures are not allowed.}{}}
\renewcommand{\listoftables}{\ClassError{sigchi}{Lists of tables are not allowed.}{}}
\renewcommand{\marginpar}{\ClassError{sigchi}{Marginpars are not allowed.}{}}


% Various spacing commands
\setlength{\hfuzz}{1pt}      % Allow some variation in column width, otherwise it's
                             % too hard to typeset in narrow columns.
\setlength{\parskip}{6pt}    % Extra vertical space between paragraphs.
\setlength{\parindent}{0pt}  % Width of paragraph indentation.
\setlength{\lineskip}{2pt}   % \lineskip is 1pt for all font sizes.
\setlength{\normallineskip}{2pt}
\setlength{\baselineskip}{11pt}


% Set penalties
\doublehyphendemerits=9999        % No consecutive line hyphens
\brokenpenalty=9999               % No broken words across pages
\widowpenalty=9999                % Almost no widows at bottom of page
\clubpenalty=9999                 % Almost no orphans at top of page
\interfootnotelinepenalty=9999    % Almost never break footnotes

\@lowpenalty   51       % Produced by \nopagebreak[1] or \nolinebreak[1]
\@medpenalty  151       % Produced by \nopagebreak[2] or \nolinebreak[2]
\@highpenalty 301       % Produced by \nopagebreak[3] or \nolinebreak[3]

\@beginparpenalty -\@lowpenalty % Before a list or paragraph environment.
\@endparpenalty   -\@lowpenalty % After a list or paragraph environment.
\@itempenalty     -\@lowpenalty % Between list items.


% Author specification commands
\newcounter{@aucount}
\newcounter{@originalaucount}
\newlength{\@auwidth} \setlength{\@auwidth}{\textwidth}
\newlength{\@auskip} \setlength{\@auskip}{1pc}
\newcounter{@auskipcount}
\newlength{\@allauboxes} \setlength{\@allauboxes}{\@auwidth}
\newcommand{\numberofauthors}[1]{%
  \setcounter{@aucount}{#1}
  \ifnum\the@aucount>3
    \setcounter{@aucount}{3}
    \setcounter{@originalaucount}{3}
  \fi%
  \setcounter{@auskipcount}{2 * (\the@aucount - 1)}
  \setlength{\@auskip}{\@auskip * \the@auskipcount}
  \setlength{\@auwidth}{((\@auwidth - \@auskip) / \the@aucount) - 5pt}
}
\gdef\@addauthors{}
\newcommand{\additionalauthors}[1]{%
  \gdef\@addauthors{#1}
}
\newcommand{\addauthorsection}{%
  \ifnum\@originalaucount>3%
    \section{Additional Authors}%
    \the\@addauthors%
  \fi%
}
\newcommand{\alignauthor}{
  \end{tabular}
  \hskip 1pt
  \begin{tabular}[t]{p{\@auwidth}}
  \centering\baselineskip 13pt
}
\newcommand{\aufnt}{%
  \fontsize{12}{13}\selectfont\bfseries\rmfamily%
}
\newcommand{\affaddr}{%
  \normalfont\fontsize{12}{13}\selectfont\rmfamily%
}
\newcommand{\email}{%
  \normalfont\fontsize{12}{13}\selectfont\rmfamily%
}


% Custom list environment settings
% Itemize labels
\renewcommand{\labelitemi}{\textbullet}
\renewcommand{\labelitemii}{\textbf{--}}
\renewcommand{\labelitemiii}{$\ast$}
\renewcommand{\labelitemiv}{$\cdot$}
% enumerate numbering
\renewcommand{\theenumi}{\arabic{enumi}}
\renewcommand{\labelenumi}{\theenumi.}
\renewcommand{\theenumii}{\alph{enumii}}
\renewcommand{\labelenumii}{\theenumii}
\renewcommand{\theenumiii}{\roman{enumiii}}
\renewcommand{\labelenumiii}{\theenumiii.}
\renewcommand{\theenumiv}{\Alph{enumiv}}
\renewcommand{\labelenumiv}{\theenumiv.}
% Left margins
\setlength{\leftmargini}{10pt}
\setlength{\leftmarginii}{19.8pt}    % > \labelsep + width of '(m)'
\setlength{\leftmarginiii}{16.8pt}   % > \labelsep + width of 'vii.'
\setlength{\leftmarginiv}{15.3pt}    % > \labelsep + width of 'M.'
\setlength{\leftmarginv}{9pt}
\setlength{\leftmarginvi}{9pt}
% Label separation width
\setlength{\labelsep}{4.5pt}


% Numbering format commands (arent't currently used as numbering is turned off)
\renewcommand{\thepart}          {\Roman{part}} 
\renewcommand{\thesection}       {\arabic{section}}
\renewcommand{\thesubsection}    {\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection} {\thesubsection.\arabic{subsubsection}}
\renewcommand{\theparagraph}     {\thesubsubsection.\arabic{paragraph}}
\renewcommand{\thesubparagraph}  {\theparagraph.\arabic{subparagraph}}
\renewcommand{\theequation}      {\arabic{equation}}


% Footnote formating
\renewcommand{\thefootnote}{\arabic{footnote}}
\renewcommand{\footnoterule}{%
  \kern-3\p@\hrule width .4\columnwidth \kern 2.6\p@
}
\renewcommand{\@makefnmark}{%
  \hbox to 0pt{\textsuperscript{\@thefnmark}\hss}
}
\renewcommand{\@makefntext}[1]{%
  \noindent\hbox to .5em{\hss\textsuperscript{\@thefnmark}}#1
}


% Various spacing commands
\setlength{\arraycolsep}{4.5pt}    % Half the space between columns in an array environment.
\setlength{\tabcolsep}{5.4pt}      % Half the space between columns in a tabular environment.
\setlength{\arrayrulewidth}{.4pt}  % Width of rules in array and tabular environment.
\setlength{\doublerulesep}{1.8pt}  % Space between adjacent rules in array or tabular env.
\setlength{\tabbingsep}{\labelsep} % Space used by the \' command.  (See LaTeX manual.)

\skip\@mpfootins =\skip\footins

\setlength{\fboxsep}{2.7pt}      % Space left between box and text by \fbox and \framebox.
\setlength{\fboxrule}{.4pt}      % Width of rules in box made by \fbox and \framebox.


% Commands for the title
\gdef\@subtitle{}
\newcommand{\subtitle}[1]{%
  \gdef\@subtitle{#1}
}
% Use the \teaser command to add a figure below the title
\newcommand{\teaser}[1]{%
  \gdef\@teaser{#1}%
}
\renewcommand{\maketitle}{
  \par
  \begingroup
    \twocolumn[\@maketitle]
    \@thanks
  \endgroup
  \renewcommand{\maketitle}{\relax}
  \renewcommand{\@maketitle}{\relax}
  \gdef\@thanks{}\gdef\@author{}\gdef\@title{}\gdef\@subtitle{}\let\thanks\relax
  \@copyrightspace
  % Make sure no figures get placed in the first column of the first page. Taken from:
  % http://tex.stackexchange.com/questions/63131/start-placing-figures-on-right-hand-side-column-of-first-page
  \global\csname @topnum\endcsname 0
  \global\csname @botnum\endcsname 0
}
\renewcommand{\@maketitle}{
  \newpage
  \null
  \vskip 1em
  \begin{center}
    {\fontsize{18}{18}\selectfont\bfseries\sffamily \@title\par}
    \vskip 0.5ex
    {\fontsize{14}{14}\selectfont\sffamily \@subtitle\par}
    \vskip 0.7ex
    {\baselineskip 16pt\aufnt   % each author set in \12 pt Arial, in a
     \lineskip .5em             % tabular environment
     \begin{tabular}[t]{c}
       \@author
     \end{tabular}\par}
    \vskip 1em 
  \end{center}
  % if a teaser was provided
  \ifx\@teaser\undefined\else 
    \begingroup%
    \def\@captype{figure}%
    \@teaser%
    \endgroup\par%
    \vspace{0.25in}% 
  \fi
}


% Titlenote command - used in title, processed in abstract, prints to copyright
\newcounter{@titlenotecount}
\csdef{@titlenotesymbol1}{$\ast$}
\csdef{@titlenotesymbol2}{$\dagger$}
\csdef{@titlenotesymbol3}{$\ddagger$}
\csdef{@titlenotesymbol4}{$\S$}
\csdef{@titlenotesymbol5}{$\P$}
\newcommand{\titlenote}[1]{%
  \stepcounter{@titlenotecount}%
  \edef\@curcount{\the@titlenotecount}%
  % this box goes to the end of the title
  \raisebox{9pt}{\csuse{@titlenotesymbol\@curcount}}%
  % this other box goes to the copyright section
  % the preceding note symbol is added there
  \csgdef{@titlenoteline\@curcount}{%
    \rule\z@\footnotesep\ignorespaces #1 \@finalstrut\strutbox%
  }%
}


% Typeset abstract (also includes processing code for the titlenotes)
\renewenvironment{abstract}{
  \ifnum\the@titlenotecount>0
    \insert\footins{
      \reset@font\footnotesize
      \interlinepenalty\interfootnotelinepenalty
      \splittopskip\footnotesep
      \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
      \hsize\columnwidth \@parboxrestore
      \protected@edef\@currentlabel{}
      \color@begingroup
      \noindent\raisebox{4pt}{\csuse{@titlenotesymbol1}}
	  \csuse{@titlenoteline1}
	  \ifnum\the@titlenotecount>1  
        \par\noindent\raisebox{4pt}{\csuse{@titlenotesymbol2}}
	    \csuse{@titlenoteline2}
	  \fi
	  \ifnum\the@titlenotecount>2
        \par\noindent\raisebox{4pt}{\csuse{@titlenotesymbol3}}
	    \csuse{@titlenoteline3}
	  \fi
	  \ifnum\the@titlenotecount>3
        \par\noindent\raisebox{4pt}{\csuse{@titlenotesymbol4}}
	    \csuse{@titlenoteline4}
	  \fi
	  \ifnum\the@titlenotecount>4
        \par\noindent\raisebox{4pt}{\csuse{@titlenotesymbol5}}
	    \csuse{@titlenoteline5}
	  \fi
      \color@endgroup
    }
  \fi
  \setcounter{footnote}{0}
  \section{Abstract}\normalsize
}{
  \if@twocolumn\else\endquotation\fi
}


% Basic intro sections
\newcommand{\keywords}[1]{
  \section*{\NoCaseChange{Author Keywords}}
  \begin{flushleft}#1\end{flushleft}
}
\newcommand{\terms}[1]{
  \section*{\NoCaseChange{General Terms}}
  \begin{flushleft}#1\end{flushleft}
}
\newcommand{\classification}[1]{
  \section*{\NoCaseChange{ACM Classification Keywords}}
  \begin{flushleft}#1\end{flushleft}
}
% More complex version for classification keywords
\DeclareDocumentCommand\category{m m m o}{%
  \section*{\NoCaseChange{ACM Classification Keywords}}%
  #1 [#2]: #3%
  \IfNoValueF{#4}{\kern\z@---\hskip\z@ \textit{#4}}%
  % now change \category to omit section title next time
  \DeclareDocumentCommand\category{m m m o}{%
    \unskip ; \hspace{5pt plus 3pt}% 
    #1 [#2]: #3%
    \IfNoValueF{#4}{\kern\z@---\hskip\z@ \textit{#4}}%
  }%
}


% Code for the copyright/toappear box at the bottom of the first page
\DeclareFloatingEnvironment[placement=b]{copyrightbox}
\newcommand{\@copyrightspace}{
  \begin{copyrightbox}[b]
    \begin{center}
      \setlength{\unitlength}{1pc}
	  \newlength{\heightofta}
	  \settoheight{\heightofta}{\fontsize{8}{9}\selectfont\rmfamily{\@toappear}}
      \begin{picture}(\linewidth, \heightofta - 1.1pc)
        \put(0,-0.95){\fontsize{8}{9}\selectfont\rmfamily{\@toappear}}
      \end{picture}
    \end{center}
  \end{copyrightbox}
}
% Three variations of toappear, all overriding blank default
\def\@toappear{}
\newcommand{\toappear}[1]{%
  \def\@toappear{%
    \parbox[b]{20pc}{\baselineskip 9pt #1}%
  }%
}
\newcommand{\toappearbox}[1]{%
  \def\@toappear{%
    \raisebox{5pt}{%
      \framebox[20pc]{%
        \parbox[b]{19pc}{#1}%
      }%
    }%
  }%
}
\newcommand{\submissionversion}[1]{%
  \toappearbox{\Large Submitted to #1. \\ Do not cite, do not circulate. } %
}
\newcommand{\finalversion}[1]{%
  \toappear{#1} %
}
\newcommand{\authorversion}[3]{%
  \toappear{%
    \urlstyle{same}
    ACM, (#1). This is the authors version of the work. It is posted here by permission of ACM for your personal use. Not for redistribution. The definitive version was published in  #2, \url{http://doi.acm.org/#3}.
	\urlstyle{tt}
  }
}
% Set default
\toappearbox{Use the \texttt{\@backslashchar toappearbox\{ text \}} or \texttt{\@backslashchar submissionversion\{ conference \}} commands to change what's in this box. Use any of \texttt{\@backslashchar authorversion} or \texttt{\@backslashchar finalversion} commands for your camera-ready.}

% Bibliography section
\let\@biblabel\@gobble
\setlength{\bibindent}{0em}
\renewenvironment{thebibliography}[1]{%
  \section{References}
  \begin{enumerate}
    \settowidth{\labelwidth}{#1.}
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \advance\leftmargin\bibindent
    \itemindent -\bibindent
    \listparindent \itemindent
    \usecounter{enumi}
	\@ifundefined{@tightbibliography}{
		\setlength{\itemsep}{2pt plus 1pt minus 1pt}
	}{
		\setlength{\topsep}{0pt}
		\setlength{\partopsep}{0pt}
		\setlength{\itemsep}{-1pt plus 1pt minus 1pt}
	}
    \let\newblock\@empty
    \raggedright
    \sloppy
    \sfcode`\.=1000\relax % set space code for '.' to 1000
}{%
  \end{enumerate}
}


% Appendix definition
\renewcommand{\appendix}{
  \par
  \section{Appendix}
  \setcounter{section}{0}
  \setcounter{subsection}{0}
  \def\thesection{\Alph{section}}  
}


% Miscelaneous
\flushbottom 
\pagestyle{plain}
\mark{{}{}} 

%% DanCo, 10/19/11: Added this to reduce overfull lines per Sheridan
%% request; it leads to occasionally unpleasant extra whitespace,
%% though actually no worse and perhaps better than the 
%% default Word template.
%%
%% This can be manually controlled instead by authors in text
%% by putting \sloppy before and \fussy immediately 
%% after troublesome paras.  Idea found at
%% http://www.economics.utoronto.ca/osborne/latex/PMAKEUP.HTM
\sloppy
