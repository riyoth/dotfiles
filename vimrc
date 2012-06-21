call pathogen#infect()
"" Higligth syntax
syntax on
filetype plugin indent on
let g:solarized_termtrans = 1
colorscheme solarized
"" Set the tab to space
set expandtab
"" Set tab to 4 space
set shiftwidth=4
set tabstop=4
"" display line number
set number
"" Allow to fold code
set foldmethod=indent
set foldlevel=99
""Auto completion
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
"" ___________________________

