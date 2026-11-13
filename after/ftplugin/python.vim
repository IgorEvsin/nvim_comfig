" Python convention: 4-space indentation, no tabs
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
" Fold by indentation (cleaner than syntax folding for Python)
setlocal foldmethod=indent

" Auto-format with ruff on save (via LSP; no-op if ruff isn't attached)
function! s:RuffFormatOnSave() abort
  call luaeval('pcall(vim.lsp.buf.format, { async = true, filter = function(c) return c.name == "ruff" end })')
endfunction
autocmd BufWritePre <buffer> call s:RuffFormatOnSave()