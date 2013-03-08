" A few macro to write latex faster
map! ,em \emph{
map! ,bf \textbf{<ESC>ea}

" Beamer stuff
"
" Build a block in insert mode, cursor is at the beginning of block
map! ,bl \begin{block}{}<CR>\end{block}<ESC>ko

" Build an alertblock in insert mode, cursor is at the beginning of block
map! ,abl \begin{alertblock}<CR>\end{alertblock}<ESC>ko

" Build a frame, the cursor is positionned to the beginning of frametitle
map! ,fr \frame{<CR>\frametitle{}<CR>}<ESC>k3wa

" Build an itemize list, with a first item, the cursor is after the first
" item
map! ,it \begin{itemize}<CR><TAB>\item <CR>\end{itemize}<ESC>0xk$a

" Build an enumerate list, with a first item, the cursor is after the first
" item
map! ,en \begin{enumerate}<CR><TAB>\item <CR>\end{enumerate}<ESC>0xk$a

" Add an includegraphics, the cursor is at the beginning of the name image
map! ,gr \begin{figure}<CR><TAB>\centering<CR>\includegraphics[scale=1.0]{}<CR>\end{figure}<ESC>0xk$i

" Add an includegraphics, with caption and label stuff. The cursor is at the
" beginning of the name image
map! ,fig \begin{figure}<CR><TAB>\centering<CR>\includegraphics[width=0.9\columnwidth]{}<CR>\caption{}<CR>\label{fig\|}<CR><BS>\\end{figure}<ESC>0x3k$i

" Add a chapter, section, subsection with its label. The cursor is at the
" beginning of the {chapter|section|...} name
map! ,ch \chapter{}<CR>\label{chapter\|}<ESC>0k$i
map! ,se \section{}<CR>\label{sect\|}<ESC>0k$i 
map! ,sse \subsection{}<CR>\abel{subssect\|}<ESC>0k$i
