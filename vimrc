set encoding=utf8
"set t_Co=256
call plug#begin()
Plug 'vim-scripts/indentpython.vim'
"Plug 'https://github.com/fholgado/minibufexpl.vim'
Plug 'https://github.com/vim-scripts/taglist.vim'
Plug 'https://github.com/vim-scripts/TaskList.vim'
Plug 'https://github.com/gotcha/vimpdb'
Plug 'https://github.com/vim-scripts/pythoncomplete'
Plug 'Valloric/YouCompleteMe'
Plug 'https://github.com/WolfgangMehner/perl-support'
Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'tibabit/vim-templates'
Plug 'rust-lang/rust.vim'
Plug 'cazador481/perlomni.vim'
Plug 'gabrielelana/vim-markdown'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chrisbra/csv.vim'
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
"Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
Plug 'shawncplus/phpcomplete.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
call plug#end()

filetype plugin indent on

let g:ale_linter_explicit =1
"let g:ale_sign_column_always = 1
let b:ale_linters = {'perl': ['perl','perlcritic'], 'python':['flake8'], 'javascript':['eslint'], 'vue':['eslint'], 'php': ['php']}
let b:ale_fixers  = {'perl': ['perltidy'], 'python': ['generic_python'], 'javascript':['prettier'], 'vue':['prettier'], 'php': ['php_cs_fixer', 'pint']}
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
let $Tlist_Ctags_Cmd='/usr/bin/ctags'
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType php set omnifunc=phpcomplete#Complete
autocmd BufRead,BufNewFile *.vue setfiletype html
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

highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.pl,*.pm match BadWhitespace /\s\+$/

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
  augroup END
endif

let g:airline_powerline_fonts = 1
let g:airline_theme='alduin'
let g:rainbow_active = 1

set bg=dark
color gruvbox
command SetBGT hi Normal guifg=#44cc44 guibg=NONE ctermbg=none

highlight ColorColumn ctermbg=white ctermfg=black
call matchadd('ColorColumn', '\%81v', 120)

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


let &t_TI = ""
let &t_TE = ""

"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
"
"
"
"
imap { {}<Left>
imap ( ()<Left>
inoremap ;<cr> <end>;<cr>
inoremap ;;<cr> <down><end>;<cr>
