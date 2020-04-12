let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

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

nnoremap <leader>bb :Buffers<CR>

function! FZF_EXPLORE(dir)
  "let dotfiles_dir = '~/github/dot'
  exec 'lcd' a:dir
  exec 'Files' a:dir
endfunction

" edit dotfiles
command! EditDotfiles :call FZF_EXPLORE("~/github/dot")
nnoremap <leader>ed :EditDotfiles<cr>

" edit notes
command! Notes :call FZF_EXPLORE("~/notes")
nnoremap <leader>en :Notes<cr>
