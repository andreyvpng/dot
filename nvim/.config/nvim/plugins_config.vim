call plug#begin('~/.config/nvim/plugged')

" Project navigation
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'

" Color
" Plug 'chriskempson/base16-vim'
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

call plug#end()


""""""""""""""""""""""""""""""
" => Colorscheme
""""""""""""""""""""""""""""""

"let base16colorspace=256  " Access colors present in 256 colorspace
"colorscheme base16-solarized-dark
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
let NERDTreeIgnore=['__pycache__', '.idea', '.git', '.stfolder']


""""""""""""""""""""""""""""""
" => EasyMotion
""""""""""""""""""""""""""""""

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

map s <Plug>(easymotion-overwin-f)
map s <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


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
