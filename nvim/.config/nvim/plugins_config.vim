call plug#begin('~/.config/nvim/plugged')

" Project navigation
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Color
Plug 'chriskempson/base16-vim'
Plug 'mhinz/vim-startify'

" Organize
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'itchyny/calendar.vim'
Plug 'ryot4/diary.vim'


" HTML
Plug 'mattn/emmet-vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" MarkDown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Kotlin
Plug 'udalov/kotlin-vim'

" Other
Plug 'tpope/vim-surround'
Plug 'lyokha/vim-xkbswitch'

" install curl, mpv
Plug 'soywod/phonetics.vim'
Plug 'camspiers/lens.vim'

call plug#end()

" manage plugins
nnoremap <leader>pli :PlugInstall<cr>
nnoremap <leader>plc :PlugClean<cr>


""""""""""""""""""""""""""""""
" => Colorscheme
""""""""""""""""""""""""""""""

function! g:BG_none(group)
  exec "hi " . a:group . " guibg=NONE ctermbg=NONE"
endfunction

function! s:base16_customize() abort
  call BG_none("Normal")

  call BG_none("LineNr")
  call BG_none("CursorColumn")

  call BG_none("CursorColumn")
  call BG_none("CursorLine")
  call BG_none("CursorLineNr")
  call BG_none("SightColumn")

  call BG_none("NonText")

  call BG_none("TabLine")
  call BG_none("TabLineFill")

  call BG_none("VertSplit")
endfunction

augroup on_change_colorschema
  autocmd!
  autocmd ColorScheme * call s:base16_customize()
augroup END

let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-gruvbox-dark-hard

""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""

noremap <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
let NERDTreeWinPos='left'
let NERDTreeWinSize=28
let NERDTreeMinimalUI=1
let NERDTreeDirArrowExpandable='+'
let NERDTreeDirArrowCollapsible='-'
let NERDTreeIgnore=['__pycache__', '.idea', '.git', '.stfolder']


""""""""""""""""""""""""""""""
" => EasyMotion
""""""""""""""""""""""""""""""

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

map s <Plug>(easymotion-overwin-f)
map s <Plug>(easymotion-overwin-f2)


""""""""""""""""""""""""""""""
" => fzf
""""""""""""""""""""""""""""""
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using Vim function
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

nunmap <leader>bb
nnoremap <leader>bb :Buffers<CR>


""""""""""""""""""""""""""""""
" => Org
""""""""""""""""""""""""""""""
let g:org_agenda_files=['~/org/index.org', '~/org/qwe.org']


""""""""""""""""""""""""""""""
" => Emmet
""""""""""""""""""""""""""""""

let g:user_emmet_leader_key=','


""""""""""""""""""""""""""""""
" => GitGutter
""""""""""""""""""""""""""""""

nnoremap <leader>gt :GitGutterToggle<cr>
autocmd BufWritePost * GitGutter
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_async = 1


""""""""""""""""""""""""""""""
" => vim-fugitive
""""""""""""""""""""""""""""""

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>gd :Gdiffsplit<cr>


""""""""""""""""""""""""""""""
" => phonetics
""""""""""""""""""""""""""""""

nnoremap <leader>ph :Phonetics american<cr>
nnoremap <leader>pp :PhoneticsPlay american<cr>

let g:phonetics_default_accent = 'american | british'


""""""""""""""""""""""""""""""
" => markdown
""""""""""""""""""""""""""""""

nmap <C-p> <Plug>MarkdownPreviewToggle
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'qutebrowser'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


""""""""""""""""""""""""""""""
" => xkb
""""""""""""""""""""""""""""""

let g:XkbSwitchEnabled = 1
let g:XkbSwitchIMappings = ['ru']
