" install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" file tree
Plug 'scrooloose/nerdtree'

" icons
Plug 'ryanoasis/vim-devicons'

" easy motion
Plug 'easymotion/vim-easymotion'

" fast search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" colors
"Plug 'chriskempson/base16-vim'
Plug 'dylanaraps/wal.vim'

" vim start buffer
Plug 'mhinz/vim-startify'

" org-mode
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'

" calendar
Plug 'itchyny/calendar.vim'

" diary
Plug 'ryot4/diary.vim'

" emmet
Plug 'mattn/emmet-vim'

" git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" kotlin
Plug 'udalov/kotlin-vim'

" Other
Plug 'tpope/vim-surround'
Plug 'lyokha/vim-xkbswitch'

" 
Plug 'camspiers/lens.vim'

Plug 'takac/vim-hardtime'

call plug#end()

" manage plugins
nnoremap <leader>pli :PlugInstall<cr>
nnoremap <leader>plc :PlugClean<cr>

for file in split(glob(Dot('modules/plugins/*.vim')), '\n')
    exec 'source' file
endfor
