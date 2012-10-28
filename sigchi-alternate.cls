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
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{proc}}
\ProcessOptions
\LoadClass[twocolumn]{proc} % extend proc class (is mosly overwritten)
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

% Provides \balance command which has to be manually 
% added at roughly the first column of the last page
\RequirePackage{balance}

% Required for copyright box on first page
\RequirePackage{float} 

% Make Helvetica default sans-serif font
\RequirePackage[scaled]{helvet}
\renewcommand{\sfdefault}{phv}

% Make Times default serif font
\RequirePackage{times}
\renewcommand{\rmdefault}{ptm}

% Use Type1 fonts
\RequirePackage[T1]{fontenc}

% Figure(*) and Table(*) fixes
\RequirePackage{dblfloatfix}
\RequirePackage{fixltx2e}

% Caption formating
\RequirePackage[
  font={small, bf, rm}, % 9pt bold times
  labelformat=simple,
  textformat=simple,
  labelsep=period,
  justification=justified,
  singlelinecheck=true, % center one-line captions
  skip=2pt % baselineskip
]{caption}


% Section format rules
\RequirePackage[overload]{textcase}
\RequirePackage{titlesec}
\titleformat{\section}[hang]{\baselineskip=14pt\fontsize{9}{14}\selectfont\bfseries\sffamily}{\thesection}{0.5em}{\MakeTextUppercase}
\titlespacing{\section}{0pt}{8pt plus 3pt minus 3pt -\parskip}{0.5pt-\parskip}
\titleformat{\subsection}[hang]{\baselineskip=14pt\fontsize{9}{14}\selectfont\bfseries\sffamily}{\thesubsection}{0.5em}{}
\titlespacing{\subsection}{0pt}{8pt plus 3pt minus 3pt -\parskip}{0.5pt-\parskip}
\titleformat{\subsubsection}[hang]{\baselineskip=14pt\fontsize{9}{14}\selectfont\itshape\sffamily}{\thesubsubsection}{0.5em}{}
\titlespacing{\subsubsection}{0pt}{4pt plus 2pt minus 1pt -\parskip}{0.5pt-\parskip}
\titlespacing{\paragraph}{0pt}{4pt plus 2pt minus 1pt -\parskip}{0.5pt-\parskip}
\setcounter{secnumdepth}{-2} % turn of section numbering (-1 is part level)


% Disallow 'list of ...' and marginpar commands
\renewcommand{\tableofcontents}{\ClassError{sigchi}{Tables of contents are not allowed.}{}}
\renewcommand{\listoffigures}{\ClassError{sigchi}{Lists of figures are not allowed.}{}}
\renewcommand{\listoftables}{\ClassError{sigchi}{Lists of tables are not allowed.}{}}
\renewcommand{\marginpar}{\ClassError{sigchi}{Marginpars are not allowed.}{}}


% Various spacing commands
\hfuzz 1pt          % Allow some variation in column width, otherwise it's
                    % too hard to typeset in narrow columns.
\parskip 6pt        % Extra vertical space between paragraphs.
\parindent 0pt      % Width of paragraph indentation.
\lineskip 2pt       % \lineskip is 1pt for all font sizes.
\normallineskip 2pt
\baselineskip=11pt


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
\leftmargini 10pt
\leftmarginii 19.8pt    % > \labelsep + width of '(m)'
\leftmarginiii 16.8pt   % > \labelsep + width of 'vii.'
\leftmarginiv 15.3pt    % > \labelsep + width of 'M.'
\leftmarginv 9pt
\leftmarginvi 9pt
% Label separation width
\labelsep 4.5pt


% Numbering format commands (arent't actually used as numering is turned off)
\def\thepart          {\Roman{part}} 
\def\thesection       {\arabic{section}}
\def\thesubsection    {\thesection.\arabic{subsection}}
\def\thesubsubsection {\thesubsection.\arabic{subsubsection}}
\def\theparagraph     {\thesubsubsection.\arabic{paragraph}}
\def\thesubparagraph  {\theparagraph.\arabic{subparagraph}}
\def\theequation      {\arabic{equation}}


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
\arraycolsep 4.5pt   % Half the space between columns in an array environment.
\tabcolsep 5.4pt     % Half the space between columns in a tabular environment.
\arrayrulewidth .4pt % Width of rules in array and tabular environment.
\doublerulesep 1.8pt % Space between adjacent rules in array or tabular env.
\tabbingsep \labelsep   % Space used by the \' command.  (See LaTeX manual.)

\skip\@mpfootins =\skip\footins

\fboxsep =2.7pt      % Space left between box and text by \fbox and \framebox.
\fboxrule =.4pt      % Width of rules in box made by \fbox and \framebox.


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
  \section*{Abstract}\normalsize
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
\newcommand{\category}[3]{%
  \section*{\NoCaseChange{ACM Classification Keywords}}%
  \@ifnextchar[{\@category{#1}{#2}{#3}}{\@category{#1}{#2}{#3}[]}%
  % now change \category to omit section title next time
  \renewcommand{\category}[3]{; \hspace{5pt plus 3pt}%
    \@ifnextchar[{\@category{##1}{##2}{##3}}{\@category{##1}{##2}{##3}[]}%
  }%
}
\def\@category#1#2#3[#4]{%
  \begingroup%
    #1 [#2]: #3%
    \if!#4! \else \kern\z@---\hskip\z@ \textit{#4}\fi%
  \endgroup%
}

% Code for the copyright/toappear box at the bottom of the first page
\newfloat{copyrightbox}{b}{cprbox}
\newcommand{\@copyrightspace}{
  \begin{copyrightbox}[b]
    \begin{center}
      \setlength{\unitlength}{1pc}
      \begin{picture}(20, 6)
        \put(0,-0.95){\fontsize{8}{9}\selectfont\rmfamily{\@toappear}}
      \end{picture}
    \end{center}
  \end{copyrightbox}
}
% Three variations of toappear, all overriding blank default
\def\@toappear{}
\newcommand{\toappear}[1]{%
  \def\@toappear{%
    \parbox[b]{20pc}{\baselineskip 9pt  #1}%
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
\newcommand{\confname}[1]{\textit{#1}}
\newcommand{\confcopyright}[4]{%
  \toappear{%
    Permission to make digital or hard copies of all or part of this work for personal or classroom use is granted without fee provided that copies are not made or distributed for profit or commercial advantage and that copies bear this notice and the full citation on the first page.
    To copy otherwise, or republish, to post on servers or to redistribute to lists, requires prior specific permission and/or a fee.\\
    \confname{#1}, #2, #3, #4.\\
    Copyright #3 ACM 978-1-XXXX-XXXX-X/XX/XX...\$10.00.
  }
}
% Set default (here CHI 2013)
\confcopyright{CHI'13}{April 27--May 2}{2013}{Paris, France}


% Bibliography section
\let\@biblabel\@gobble
\setlength{\bibindent}{0em}
\renewenvironment{thebibliography}[1]{%
  \section*{References\markboth{\refname}{\refname}}
  \begin{enumerate}
    \settowidth{\labelwidth}{#1.}
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \advance\leftmargin\bibindent
    \itemindent -\bibindent
    \listparindent \itemindent
    \usecounter{enumi}
    \itemsep 2pt \@plus 1pt \@minus 1pt
    
    \let\newblock\@empty
    \raggedright
    \sloppy
    \sfcode`\.=1000\relax
}{%
  \end{enumerate}
}


% Appendix definition
\renewcommand{\appendix}{
  \par
  \section*{Appendix}
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
