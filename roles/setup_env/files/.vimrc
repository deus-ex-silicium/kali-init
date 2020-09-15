call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible' " .vimrc defaults everyone can agree on
Plug 'hynek/vim-python-pep8-indent' " Python PEP8 style guide
Plug 'scrooloose/syntastic' " Syntax checking plugin
"Plug 'davidhalter/jedi-vim' " Python autocompletion
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " Catalogs browser
"Plug 'jiangmiao/auto-pairs' " Auto completion brackets etc.
Plug 'flazz/vim-colorschemes' " More colorschemes
Plug 'vim-airline/vim-airline' " Lightweight powerline
Plug 'vim-airline/vim-airline-themes' "More airline themes
Plug 'jeffkreeftmeijer/vim-numbertoggle' "Hybrid mode aware line number toggle

call plug#end() " Add plugins to &runtimepath

" **************** General Config ****************
set encoding=utf-8
set list " Enable hidden char display
set nobackup
set noswapfile
set pastetoggle=<F2>
set nu
set relativenumber
map <F3> :set nu! <bar> set relativenumber! <CR>
inoremap jj <esc>
" **************** Airline Config ****************
let g:airline_theme="badwolf"
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#fnamemod=':t' "display name not path
set laststatus=2
if !exists('g:airline_symbols')
	let g:airline_symbols={}
endif
set t_Co=256 " Use 256 colours (Use this if ur term supports it)
" **************** Syntastic Config *************
" return to this after reading ':help syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_highlighting = 0
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "regex": "[E302]"  }
" **************** Mappings *********************
noremap ; :
noremap <C-n> :NERDTree<CR>
noremap <C-e> :bprevious!<CR>
noremap <C-p> :bnext!<CR>
noremap <C-x> :bdelete<CR>
noremap <NUL> :q<CR>
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" ************* Extension Config *****************
au BufNewFile,BufRead *.{py,txt,cpp,c,h}
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=120 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

au BufNewFile,BufRead *.{js,html,css,yaml}
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

silent! colorscheme badwolf
