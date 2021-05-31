# CSULB MS Thesis Template Instructions

The thesis template has divided major parts of the document into different files for easier navigation, but they are all included into the `main.tex` file for compilation. Simply go through the different files: `title.tex`, `abstract.tex` , etc., and fill in your content.

## Chapters

Your main content will go in the chapter files. If you need more chapters, duplicate one of the given, edit it, and `\include{}` it in  `main.tex`.

## Appendices

If you have only one appendix entry make sure you only use the following code in `main.tex`:

```latex
%% for SINGLE appendix --- %%
\input{Appendix/appendix-single.tex}
%% ----------------------- %%
```

If you have multiple appendix entries use the following:

```latex
%% for MULTIPLE appendices --- %%
%% Add more appendices below in new .tex files as needed. Use these given appendices as a template.
\appendicesTitlePage	% adds appendices title page
\begin{appendices}		% fixes appendices chapter numbering
	\input{Appendix/appendixA.tex}
	\input{Appendix/appendixB.tex}	

\end{appendices}
%% --------------------------- %%
```

Both have been already provided in the template. Either comment out or delete the one not used.

It is important to use the given files to work from as they use special commands for formatting the title pages, `\singleAppendixTitle{}` and `\multAppendixTitle{}`. If you need more than two appendices, duplicate one of the given ones and work from there.

## References/bibliography

You can manage your bibliography contents in the `references.bib` (preferably using software like BibDesk). Cite the references using the `\cite{}` command. The Bibliography style can be changed in the `\bibliographystyle{}` line.

### Bibliography styles

This can be a little confusing because there are a few ways to style bibliographies in LaTeX, and to conform to certain CSULB department standards, we have to incorporate different commands. What is provided in the template provides acceptable styles for all of the engineering departments, and most of the other ones too.

#### IEEE

To use the IEEE bibliography style, it is very straightforward. 

```tex
\documentclass{csulbmsthesis}

\begin{document}

Your content \cite{reference1}.

% \bibTitlePage{REFERENCES} % Adds the title page and heading at the top of your bibliography/references page, but doesn't actually change the style

\bibliographystyle{ieeetr} % uses IEEE style
\bibliography{references}  % uses the references.bib file

\end{document}
```



#### ASME

The ASME bibliography style is also easy.

```tex
\documentclass{csulbmsthesis}

\begin{document}

Your content \cite{reference1}.

% \bibTitlePage{REFERENCES} % Adds the title page and heading at the top of your bibliography/references page, but doesn't actually change the style

\bibliographystyle{asmejour} % uses the asmejour.bst file
\bibliography{references}  % uses the references.bib file

\end{document}
```



### ASCE

The ASCE style needs the `natbib` package to function, so we include it.

```tex
\documentclass{csulbmsthesis}

\usepackage{natbib} % important! needed for the `ascelike` bib style 

\begin{document}

Your content \cite{reference1}.

% \bibTitlePage{REFERENCES} % Adds the title page and heading at the top of your bibliography/references page, but doesn't actually change the style

\bibliographystyle{ascelike} % uses the ascelike.bst file
\bibliography{references}  % uses the references.bib file

\end{document}
```



### Turabian/Chicago

This gets a little complicated. Turabian style needs the `biblatex-chicago` package which uses its own commands, and we'll need to override some original ones as well.

```tex
\documentclass{csulbmsthesis}

\usepackage[backend=bibtex]{biblatex-chicago}
\addbibresource{references.bib} % uses the references.bib file
\renewcommand{\bibsetup}{\singlespacing}
\renewcommand{\bibitemsep}{1\baselineskip}
\renewcommand{\bibhang}{0.5in}


\begin{document}

Your content \cite{reference1}.

% \bibTitlePage{REFERENCES} % Adds the title page and heading at the top of your bibliography/references page, but doesn't actually change the style

{\centering \textbf{REFERENCES}} % places an unmarked heading at top of page
\printbibliography[heading=none] % the new bibliography command

\end{document}
```



## File structure

-   `Thesis template/`
    -   `Chapters/`
        -   `chapter1.tex`
        -   `chapter2.tex`
    -   `Appendix/`
        -   `appendix-single.tex`
        -   `appendixA.tex`
        -   `appendixB.tex`
    -   `Figures/`
        -   `lb.pdf`
    -   `Front matter/`
        -   `title.tex`
        -   `copyright.tex`
        -   `abstract.tex`
        -   `acknowledgments.tex`
        -   `abbreviations.tex`
        -   `works.tex`
        -   `preface.tex`
    -   `main.tex`
    -   `references.bib`
    -   `csulbmsthesis.cls`
    -   `ascelike.bst`
    -   `asmejour.bst`
    -   `main.pdf`
    -   `instructions.pdf` *
    -   `intro to latex.pdf` *
    -   `license.txt`
-   `instructions.md` *
-   `intro to latex.md` *
-   `license.txt` *
-   `readme.md` *

The items marked with a * are not needed for the template to work properly; they're documentation for your benefit or there so I can edit things more easily in the future.

The `csulbmsthesis.cls` file contains the major formatting instructions and command definitions for the template. It is not recommended that you edit anything in there unless you're comfortable with $\mathrm{\LaTeX}$. 