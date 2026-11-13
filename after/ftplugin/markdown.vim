" Live markdown preview in browser (plugin lazy-loads on this filetype)
nnoremap <buffer> <Space>md :MarkdownPreviewToggle<CR>
" Don't hard-wrap markdown while typing
setlocal textwidth=0
" Format with mdformat via <Space>f (no LSP attaches to markdown)
function! s:MDformat() abort
  if !executable('mdformat')
    echoerr 'mdformat not found'
    return
  endif
  let l:view = winsaveview()
  silent! %!mdformat --wrap 100 -
  call winrestview(l:view)
endfunction
nnoremap <buffer> <Space>f :call <SID>MDformat()<CR>