"""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""

set nocompatible
" Sets how many line of history VIM has to remember
set history=500
" Sets to auto read when a file is changed from a outside
set autoread
" Ignore compiled files
set wildignore=*.o,*.pyc,*/.git
"set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:$,precedes:«,extends:»
set listchars=tab:→\ ,nbsp:␣,trail:•,precedes:«,extends:»
set list

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch

" Set uftf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off
set nobackup
set nowb
set noswapfile

" Show matching brackets when text indicator is over them
set showmatch

" Tab settings
set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Show numbers of lines
set number

" wrap
set wrap

" automatically creating directory
autocmd BufWritePre *
    \ if !isdirectory(expand("<afile>:p:h")) |
    \   call mkdir(expand("<afile>:p:h"), "p") |
    \ endif

" Use the system clipboard for copy and paste
set clipboard=unnamedplus

" enable mouse
set mouse=a

set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\«ZXCVBNM<>


"""""""""""""""""""""""""""""
" => Style
"""""""""""""""""""""""""""""

syntax on

"set split separator
set fillchars+=vert:│

colorscheme delek
set background=dark

"set termguicolors
set t_Co=256
"let base16colorspace=256

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

if has('gui_running')
    set guioptions-=T " no toolbar
    set guioptions-=m " no menu
    set guioptions-=r " no right scroll
    set guioptions-=L " no left scroll
endif

" Always show current position
set ruler

" How many tenths of a second to blink when matching brackets
set mat=2

" show a visual line under the cursor's current line
set cursorline

" disable folding
set nofoldenable

set guitablabel=%N/\ %t\ %M


"""""""""""""""""""""""""""""
" => General mapping
"""""""""""""""""""""""""""""

let mapleader = " "
let maplocalleader = "\\"

" vimrc
nnoremap <leader>vs :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>ve :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>vo :e ~/.config/nvim/init.vim<cr>

" save & quit
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :qall<cr>

" Fix common typos
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev WQ wq

" uppercase
inoremap <c-u> <ESC>viwUea

" toggle wrap
nnoremap <leader>W :set wrap!<cr>

" toggle number
nnoremap <leader>N :set number!<cr>

" exit insert mode
imap jj <Esc>


"""""""""""""""""""""""""""""
" => Moving
"""""""""""""""""""""""""""""

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" switch CWD
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Close the current buffer
map <leader>bd :bdelete<cr>

" switch between buffers
map <leader>bl :bnext<cr>
map <leader>bh :bprevious<cr>

" switch buffers
nnoremap <leader>bb :buffers<CR>:buffer<Space>

" only one buffer
nnoremap <leader>bo :only<CR>

" mapping for tabs
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>

" Opens a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr><cr>

" moving between windows
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>


"""""""""""""""""""""""""""""
" => Spell Checking
"""""""""""""""""""""""""""""

" toggle spell
nnoremap <leader>ss :setlocal spell! spelllang=ru_ru,en_us<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s


"""""""""""""""""""""""""""""
" => Function
"""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key, '[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

function! WordProcessorMode()
    setlocal spell spelllang=ru_ru,en_us
    setlocal wrap
    setlocal linebreak
    setlocal nolist
    " russian keyboard
    set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\«ZXCVBNM<>
    set iminsert=0
    set imsearch=0
endfu
command! WP call WordProcessorMode()
nnoremap WP :WP<cr>

command! Timestamp execute 'normal o# '.strftime("%d %B %Y %H:%M")
noremap <leader>pt :Timestamp<CR>
