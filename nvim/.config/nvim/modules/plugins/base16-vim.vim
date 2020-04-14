function! g:BG_none(group)
  exec "hi " . a:group . " guibg=NONE ctermbg=NONE"
endfunction

function! s:base16_customize() abort
  "call BG_none("Normal")

  "call BG_none("LineNr")
  call BG_none("CursorColumn")

  call BG_none("CursorColumn")
  "call BG_none("CursorLine")
  call BG_none("CursorLineNr")
  call BG_none("SightColumn")

  call BG_none("NonText")

  call BG_none("TabLine")
  call BG_none("TabLineFill")

  "call BG_none("VertSplit")
endfunction

augroup on_change_colorschema
  autocmd!
  autocmd ColorScheme * call s:base16_customize()
augroup END

let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme wal
"colorscheme base16-classic-dark
