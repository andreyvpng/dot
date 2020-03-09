call plug#begin('~/.config/nvim/plugged')

" Project navigation
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'

" Color
Plug 'chriskempson/base16-vim'
Plug 'mhinz/vim-startify'

" Organize
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'

" HTML
Plug 'mattn/emmet-vim'

" Git
Plug 'airblade/vim-gitgutter'

" MarkDown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Kotlin
Plug 'udalov/kotlin-vim'

" Other

" install curl, mpv
Plug 'soywod/phonetics.vim'
Plug 'camspiers/lens.vim'
Plug 'ap/vim-css-color'

call plug#end()


""""""""""""""""""""""""""""""
" => Colorscheme
""""""""""""""""""""""""""""""

let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-solarized-dark
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE


""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""

noremap <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=28
let NERDTreeMinimalUI=1
let NERDTreeDirArrowExpandable='+'
let NERDTreeDirArrowCollapsible='-'
let NERDTreeIgnore=['__pycache__', '.idea',]


""""""""""""""""""""""""""""""
" => Emmet
""""""""""""""""""""""""""""""

let g:user_emmet_leader_key=','


""""""""""""""""""""""""""""""
" => GitGutter
""""""""""""""""""""""""""""""

nnoremap <leader>gt :GitGutterToggle<cr>
autocmd BufWritePost * GitGutter

let g:gitgutter_enabled = 0
let g:gitgutter_signs = 1
let g:gitgutter_async = 1
let g:gitgutter_sign_added = '│' " U+2502
let g:gitgutter_sign_removed = '│' " U+2502
let g:gitgutter_sign_removed_first_line = '│' " U+2502
let g:gitgutter_sign_modified = '│' " U2
let g:gitgutter_sign_modified_removed = '│' " U+2502


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

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
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

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
