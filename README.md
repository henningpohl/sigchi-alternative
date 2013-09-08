sigchi-alternative
==================

LaTeX document style for ACM SIGCHI conferences. 

Adapted from sigchi class previously edited by:
*  Michel Beaudouin-Lafon (CHI 2013)
*  William Hudson         (CHI 2012)
*  Jean-Daniel Fekete     (CHI 2012)
*  Manas Tungare
*  Jan O. Borchers
*  G.K.M. Tobin
*  Olin Shivers
*  Kevin B. Theobald

Sigchi class adapted from ARTICLE document style by Ken Traub, Olin Shivers.
Excerpts were taken from (Journal Style) `esub2acm.cls`

For format specification see http://sheridanprinting.com/sigchi/chi.htm (CHI) and http://sheridanprinting.com/sigchi/uist.htm (UIST).

The new class sigchi-alternative makes extensive use of preexisting packages.
LaTeX commands are used instead of TeX commands and all code has been grouped and formated more consistently.

Compile `MarginTest.tex` for a visualization of page margins, column widths and other layout settings.


SIGCHI biblatex style
---------------------

This repository also contains a custom sigchi style for biblatex. It consists of:
* `sigchi.bbx` - the bibliography style
* `sigchi.cbx` - the citation style
* `biblatex-sigchi.tex` - the package documentation

The sample uses biblatex and this custom style.
Instructions on how to revert to the default sigchi bibliography style defined in `acm-sigchi.bst` are included.
