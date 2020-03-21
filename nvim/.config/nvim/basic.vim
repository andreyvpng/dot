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
"
"set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:$,precedes:«,extends:»
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

" override color scheme to make vertical separator fit
"autocmd ColorScheme * hi VertSplit ctermbg=NONE guibg=NONE

"set split separator
set fillchars+=vert:│

colorscheme delek
set background=dark

"set termguicolors
set t_Co=256
let base16colorspace=256


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
set tabline=%!MyTabLine()  " custom tab pages line
function MyTabLine()
  let s = '' " complete tabline goes here
  " loop through each tab page
  for t in range(tabpagenr('$'))
    " set highlight
    if t + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " set the tab page number (for mouse clicks)
    let s .= '%' . (t + 1) . 'T'
    let s .= ' '
    " set page number string
    let s .= t + 1 . ' '
    " get buffer names and statuses
    let n = ''      "temp string for buffer names while we loop and check buftype
    let m = 0       " &modified counter
    let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
    " loop through each buffer in a tab
    for b in tabpagebuflist(t + 1)
      " buffer types: quickfix gets a [Q], help gets [H]{base fname}
      " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
      if getbufvar( b, "&buftype" ) == 'help'
        let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
      elseif getbufvar( b, "&buftype" ) == 'quickfix'
        let n .= '[Q]'
      else
        let n .= pathshorten(bufname(b))
      endif
      " check and ++ tab's &modified count
      if getbufvar( b, "&modified" )
        let m += 1
      endif
      " no final ' ' added...formatting looks better done later
      if bc > 1
        let n .= ' '
      endif
        let bc -= 1
    endfor
    " add modified label [n+] where n pages in tab are modified
    if m > 0
      let s .= '[' . m . '+]'
    endif
    " select the highlighting for the buffer names
    " my default highlighting only underlines the active tab
    " buffer names.
    if t + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " add buffer names
    if n == ''
      let s.= '[New]'
    else
      let s .= n
    endif
    " switch to no underlining and add final space to buffer list
    let s .= ' '
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLineFill#%999Xclose'
  endif
  return s
endfunction

"""""""""""""""""""""""""""""
" => General mapping
"""""""""""""""""""""""""""""

let mapleader = "\\"

" source vimrc
nnoremap <leader>vs :source ~/.config/nvim/init.vim<cr>

" open vimrc
nnoremap <leader>vo :e ~/.config/nvim/init.vim<cr>

" Fast saving
nnoremap <leader>w :w!<cr>
" Fast quit
nnoremap <leader>q :q<cr>
" Fast quit all windows
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
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" switch buffers
nnoremap <leader>bb :buffers<CR>:buffer<Space>

" mapping for tabs
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>

" switch tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 0gt

" Opens a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr><cr>

" moving between windows
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

set statusline=\ %f\ %*\ %m%=\ %y\ %*


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
