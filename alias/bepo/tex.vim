" A few macro to write latex faster
map! ,em \emph{}<left>
map! ,bf \textbf{}<left>

"""""" Beamer stuff
" Build a block in insert mode, cursor is at the beginning of block
map! ,bl \begin{block}{}<CR>\end{block}<ESC>so

" Build an alertblock in insert mode, cursor is at the beginning of block
map! ,abl \begin{alertblock}<CR>\end{alertblock}<ESC>so

" Build a frame, the cursor is positionned to the beginning of frametitle
map! ,fr \frame{<CR>\frametitle{}<CR>}<ESC>s$i

" Build an itemize list, with a first item, the cursor is after the first item
map! ,it \begin{itemize}<CR><TAB>\item <CR>\end{itemize}<ESC>0ed0s$a

" Build an enumerate list, with a first item, the cursor is after the first item
map! ,en \begin{enumerate}<CR><TAB>\item <CR>\end{enumerate}<ESC>0ed0s$a

" Add an includegraphics, the cursor is at the beginning of the name image
map! ,gr \begin{figure}<CR><TAB>\centering<CR>\includegraphics[scale=0.9]{}<CR>\end{figure}<ESC>0ed0s$i

" Add an includegraphics, with caption and label stuff. The cursor is at the
" beginning of the name image
map! ,fig \begin{figure}<CR><TAB>\centering<CR>\includegraphics[width=0.9\columnwidth]{}<CR>\caption{}<CR>\label{fig\|}<CR><BS>\\end{figure}<ESC>0x3s$i

" Add a chapter, section, subsection with its label. The cursor is at the
" beginning of the {chapter|section|...} name
map! ,ch \chapter{}<CR>\label{chp:}<ESC>0s$i
map! ,se \section{}<CR>\label{sec:}<ESC>0s$i 
map! ,sse \subsection{}<CR>\abel{ssec:}<ESC>0s$i

" Add an align or equation block, with its label. The cursor is at the beginning
" of the equation
map! ,al \begin{align}<CR>\label{eq:}<CR>\end{align}<ESC>0s$o
map! ,eq \begin{equation}<CR>\label{eq:}<CR>\end{equation}<ESC>0s$o

