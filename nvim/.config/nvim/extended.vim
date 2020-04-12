""""""""""""""""""""""""""""""
" => For easy writing and
" browsing notes
""""""""""""""""""""""""""""""

function! Notes()
    let notes_dir = '~/notes'
    if $TERMUX == 1
        let notes_dir = '~/storage/shared/notes'
    endif
    exec 'lcd' l:notes_dir
    exec 'Files' l:notes_dir
endfunction
command! Notes :call Notes()
nnoremap <leader>n :Notes<cr>
