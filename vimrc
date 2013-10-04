execute pathogen#infect()
set nocompatible

set guioptions-=T

let mapleader=","

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set hidden
set nowrap
set tabstop=4
set backspace=indent,eol,start
set autoindent
set copyindent
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround
set showmatch
set smarttab
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o
set title
set noerrorbells
set nobackup
set mouse=a
set modelines=0
set showmode
set showcmd
set cursorline
set wildmode=list:longest
set path+=**
set scrolloff=5
"set ruler
set laststatus=2
"set relativenumber
set number
set noswapfile

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

filetype on
filetype plugin on
filetype indent on

autocmd FileType python set omnifunc=pythoncomplete#Complete

"colorscheme mustang
""colorscheme hybrid
colorscheme desert
"colorscheme molokai

syntax on

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
"set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

nnoremap <leader><tab> :Scratch<cr>

"inoremap  <Up>     <NOP>
"inoremap  <Down>   <NOP>
"inoremap  <Left>   <NOP>
"inoremap  <Right>  <NOP>
"noremap   <Up>     <NOP>
"noremap   <Down>   <NOP>
"noremap   <Left>   <NOP>
"noremap   <Right>  <NOP>

"auto save when focus is lost
"au FocusLost * :wa

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

autocmd filetype html,xml set listchars-=tab:>.

set pastetoggle=<F2>

vmap Q gq
nmap Q gqap

map <C-h> <C-w>h
map <C-x> <C-w>x
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-q> <C-w>q
nnoremap <leader>w <C-w>v<C-w>l


cmap w!! w !sudo tee % >/dev/null

" set path to path of current file
function! CHANGE_CURR_DIR()
let _dir = expand("%:p:h")
    exec "cd " . _dir
    unlet _dir
endfunction
autocmd BufEnter * call CHANGE_CURR_DIR()

"nmap <C-N> :bn<cr>
"nmap <C-P> :bp<cr>
"nmap <C-D> :bd<cr>

" move the current line up or down 
nmap <C-Down>  :m+<CR>== 
nmap <C-Up> :m-2<CR>== 
imap <C-Down>  <C-O>:m+<CR><C-O>== 
imap <C-Up> <C-O>:m-2<CR><C-O>== 

" move the current line left or right 
nmap <C-Right> >> 
imap <C-Left> <C-O><< 
imap <C-Right> <C-O>>> 
nmap <C-Left> << 

" move the selected block up or down 
vmap <C-Down>  :m'>+<CR>gv=gv 
vmap <C-Up> :m'<-2<CR>gv=gv 

" move the selected block left or right 
vmap <C-Right> >gv 
vmap <C-Left> <gv

" Map F5 to execute a Python script
autocmd FileType python imap <F5> <Esc>:w<CR>:!python "%"<CR>
autocmd FileType python map <F5> :w<CR>:!python "%"<CR>
" Map F6 to execute a Python script interactively
autocmd FileType python imap <F6> <Esc>:w<CR>:!python -i "%"<CR>
autocmd FileType python map <F6> :w<CR>:!python -i "%"<CR>
" Map F7 to run a Python shell
autocmd FileType python imap <F7> <Esc>:!ipython<CR>
autocmd FileType python map <F7> :!ipython<CR>

" Map F8 to insert a breakpoint
autocmd FileType python imap <F8> import pdb;pdb.set_trace()
autocmd FileType python map <F8> iimport pdb;pdb.set_trace()<CR>

" Map F5 to execute a Perl script
autocmd FileType perl imap <F5> <Esc>:w<CR>:!perl "%"<CR>
autocmd FileType perl map <F5> :w<CR>:!perl "%"<CR>

nmap ,n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nmap ,m :NERDTreeClose<CR>:NERDTreeFind<CR>
nmap ,N :NERDTreeClose<CR>

"let NERDTreeBookmarksFile=expand("$HOME/vimfiles/NERDTreeBookmarks")
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$' ]

"let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeHighlightCursorline=1
let NERDTreeMouseMode=2

"if using version 6 vim, enable folding
if version >= 600
    set foldenable
    set foldmethod=marker
endif

if has('gui_running')
    set guifont=Courier_New:h11:cANSI
endif

let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

"let Tlist_Ctags_Cmd = 'C:\Utilities\ctags58\ctags.exe'

nmap :tlist :TlistToggle
