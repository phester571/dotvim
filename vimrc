execute pathogen#infect()
execute pathogen#incubate()
execute pathogen#helptags()

set nocompatible

set guioptions-=T

let mapleader=","

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set hidden
set wrap
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
set statusline=%f\ %m%R\ \ %{fugitive#statusline()}%=%l/%L\ [%v]\ %P

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set nocp

filetype on
filetype plugin on
filetype indent on

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
set hlsearch
set showmatch

augroup insert_hlsearch
    autocmd!
    autocmd InsertEnter * :setlocal nohlsearch
    autocmd InsertLeave * :setlocal hlsearch
augroup END

nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

nnoremap <leader><tab> :Scratch<cr>

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap il[ :<c-u>normal! F]vi[<cr>

onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

augroup filetype_html_xml
    autocmd!
    autocmd filetype html,xml set listchars-=tab:>.
augroup END

set pastetoggle=<F2>

vmap Q gq
nmap Q gqap

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-q> <C-w>q
nnoremap <leader>w <C-w>v<C-w>l

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

cmap w!! w !sudo tee % >/dev/null

" set path to path of current file
function! CHANGE_CURR_DIR()
let _dir = expand("%:p:h")
    exec "cd " . _dir
    unlet _dir
endfunction

augroup buff_enter
    autocmd!
    autocmd BufEnter * call CHANGE_CURR_DIR()
augroup END

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

:augroup filetype_python
    autocmd!
    autocmd FileType python set omnifunc=pythoncomplete#Complete
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
augroup END

augroup filetype_perl
    autocmd!
    " Map F5 to execute a Perl script
    autocmd FileType perl imap <F5> <Esc>:w<CR>:!perl "%"<CR>
    autocmd FileType perl map <F5> :w<CR>:!perl "%"<CR>
augroup END

"nmap ,n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nmap ,n :NERDTreeToggle<CR>
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
"nmap <leader>t :TlistToggle<CR>
nmap <leader>t :TagbarOpenAutoClose<CR>
nmap <F9> :TagbarOpen fj<CR>
nmap <S-F9> :TagbarClose<CR>

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

if has("autocmd")
    filetype plugin indent on
endif

" Swap default ':', '/' and '?' with cmdline-window equivalent.
nnoremap : q:
xnoremap : q:
"nnoremap / q/
"xnoremap / q/
"nnoremap ? q?
"xnoremap ? q?
"nnoremap q: :
"xnoremap q: :
"nnoremap q/ /
"xnoremap q/ /
"nnoremap q? ?
"xnoremap q? ?

set cmdwinheight=4

augroup command_window
    autocmd!
    " Have <Ctrl-C> leave the cmdline-window
    autocmd CmdwinEnter * nnoremap <buffer> <C-c> :q\|echo ""<cr>
    autocmd CmdwinEnter * inoremap <buffer> <C-c> <esc>:q\|echo ""<cr>

    " Start command line window in insert mode and no line numbers
    autocmd CmdwinEnter * startinsert
    autocmd CmdwinEnter * set nonumber
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|exe "normal g'\"" |endif
augroup END

nnoremap ; :
nnoremap <Space> :wa<Enter>
nnoremap <Enter> o<Esc>
nnoremap <S-Enter> O<Esc>


" Tab function from Hacking Vim by Kim Shulz
" If no completion, insert tab.
" Else check if an omnifunction
function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>
