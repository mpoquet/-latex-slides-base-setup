---
title: "Disruptive Title: Wow"
author: Jane Doe
bibliography: biblio.bib
theme: Estonia
date: 2022-01-26
lang: en
header-includes:
- |
  ```{=latex}
  \usepackage[backend=biber, style=numeric-comp, sorting=none]{biblatex}
  \usepackage{subcaption}
  \setbeamertemplate{footline}[frame number]
  \renewcommand\dots{\ifmmode\ldots\else\makebox[1em][c]{.\hfil.\hfil.}\thinspace\fi}
  \hypersetup{colorlinks,linkcolor=,urlcolor=estonian-blue}
  \graphicspath{{fig/}{img/}}
  \addbibresource{biblio.bib}

  % Fix pandoc shenanigans
  \setbeamertemplate{section page}{}
  \setbeamertemplate{subsection page}{}
  \AtBeginSection{}
  \AtBeginSubsection{}
  ```
---

# Introduction
### Simple slide
- Simple slides can remain simple.
- Typically just as a markdown list.

# Main Matter
### Latex slide
```{=latex}
\begin{itemize}
  \item Plain \LaTeX remains easy to do!
  \item A reference~\footfullcite{wombat2016}.
  \item Another one~\footfullcite{lion2010}.
\end{itemize}
\begin{center}
    \includegraphics[width=.4\textwidth]{triangle.pdf}
\end{center}
```

# Conclusion
### Take home message
Goodbye! Here are some references.

```{=latex}
\printbibliography[heading=none]
```

<!-- ### References {.allowframebreaks}
```{=latex}
\printbibliography[heading=none]
``` -->
