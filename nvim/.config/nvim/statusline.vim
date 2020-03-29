hi Base guibg=none guifg=none ctermbg=none ctermfg=none

" Get current mode
let g:currentmode={
  \'n' : 'Normal ',
  \'no' : 'N·Operator Pending ',
  \'v' : 'Visual ',
  \'V' : 'V·Line ',
  \'^V' : 'V·Block ',
  \'s' : 'Select ',
  \'S': 'S·Line ',
  \'^S' : 'S·Block ',
  \'i' : 'Insert ',
  \'R' : 'Replace ',
  \'Rv' : 'V·Replace ',
  \'c' : 'Command ',
  \'cv' : 'Vim Ex ',
  \'ce' : 'Ex ',
  \'r' : 'Prompt ',
  \'rm' : 'More ',
  \'r?' : 'Confirm ',
  \'!' : 'Shell ',
  \'t' : 'Terminal '
  \}

" Get current mode
function! ModeCurrent() abort
  let l:modecurrent = mode()
  let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
  let l:current_status_mode = l:modelist
  return l:current_status_mode
endfunction

" Get current git branch
function! GitBranch(git)
  if a:git == ""
    return '-'
  else
    return a:git
  endif
endfunction

" Get current filetype
function! CheckFT(filetype)
  if a:filetype == ''
    return '-'
  else
    return tolower(a:filetype)
  endif
endfunction

" Check modified status
function! CheckMod(modi)
  if a:modi == 1
    return expand('%:t').'*'
  else
    return expand('%:t')
  endif
endfunction

" Set active statusline
function! ActiveLine()
  " Set empty statusline and colors
  let statusline = ""

  " Current mode
  let statusline .= " %{ModeCurrent()}"

  let statusline .= "%#StatusLineNC#"

  " Current git branch
  let statusline .= " %{GitBranch(fugitive#head())} %)"


  " Align items to right
  let statusline .= "%="

  " Current modified status and filename
  let statusline .= "%{CheckMod(&modified)} "

  " encoding
  let statusline.="  %{''.(&fenc!=''?&fenc:&enc).''}"
  " file format
  let statusline.="  (%{&ff})"
  " file type
  let statusline .= "%{CheckFT(&filetype)} "
  " current line / total line, file percent"
  let statusline.="  %02l/%L\ %3p%%"
  return statusline
endfunction

function! InactiveLine()
  " Set empty statusline and colors
  let statusline = ""

  " Full path of the file
  let statusline .= "%F "

  return statusline
endfunction

" Change statusline automatically
augroup Statusline
  autocmd!
  autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine()
  autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveLine()
  autocmd FileType nerdtree setlocal statusline=%!NERDLine()
augroup END


"set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode
"set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
"set statusline+=%=                                       " Right Side
