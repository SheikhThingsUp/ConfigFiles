set encoding=utf-8

call plug#begin()
Plug 'vim-scripts/indentpython.vim'
Plug 'https://github.com/fholgado/minibufexpl.vim'
Plug 'https://github.com/vim-scripts/taglist.vim'
Plug 'https://github.com/vim-scripts/TaskList.vim'
Plug 'https://github.com/gotcha/vimpdb'
Plug 'https://github.com/vim-scripts/pythoncomplete'
Plug 'Valloric/YouCompleteMe'
Plug 'https://github.com/WolfgangMehner/perl-support'
Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
call plug#end()

filetype plugin indent on
let g:ale_linter_explicit =1
let b:ale_linters = {'perl': ['perlcritic', 'perl'], 'python':['flake8']}
let b:ale_fixers  = {'perl': ['perltidy'], 'python': ['generic_python']}

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let $Tlist_Ctags_Cmd='/usr/bin/ctags'
autocmd FileType python set omnifunc=pythoncomplete#Complete

let g:UltiSnipsExpandTrigger="<c-]>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

map T :TaskList<CR>
map L :TlistToggle<CR>

"common for all file types
set foldmethod=indent
set foldlevel=99
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set textwidth=79
set fileformat=unix
set expandtab

au BufNewFile,BufRead *.css,*.html
   \ set tabstop=2|
   \ set softtabstop=2|
   \ set shiftwidth=2

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
  augroup END
endif
