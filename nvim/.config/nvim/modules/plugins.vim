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

for file in split(glob(Dot('modules/plugins/*.vim')), '\n')
    exec 'source' file
endfor
