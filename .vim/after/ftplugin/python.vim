setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4

let g:python_highlight_all = 1

hi OverLength ctermbg=darkblue ctermfg=black
match OverLength /\%80v.*/
