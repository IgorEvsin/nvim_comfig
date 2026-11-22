scriptencoding utf-8 "VimScript files use UTF-8

"Install plugins
call plug#begin(stdpath('data') . '/plugged')
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'mileszs/ack.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'mhinz/vim-startify'
    Plug 'tikhomirov/vim-glsl'
    Plug 'tmsvg/pear-tree'
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'stevearc/oil.nvim'
    Plug 'SirZenith/oil-vcs-status'
    Plug 'catgoose/nvim-colorizer.lua'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'do': 'cd app && npx --yes yarn install' }
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    call plug#end()

" 2. Настройка Oil внутри одного блока lua
lua << EOF
require("oil").setup({
  default_file_explorer = true, -- Это заменяет ваш autocmd
  delete_to_trash = true,       -- Полезный бонус: удаление в корзину
  skip_confirm_for_simple_edits = false, -- Окно со списком для всех правок, кроме создания
  prompt_save_on_select_new_entry = false, -- Убрать голый промпт "Save changes?"
  win_options = {
    signcolumn = "yes",
  },
})

-- Маппинг через Lua API (лучше читается)
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Создание/переименование/перемещение/копирование файлов и папок: без
-- подтверждения и с автосохранением на диск. Удаление — с окном подтверждения.
do
  local confirmation = require("oil.mutator.confirmation")
  local original_show = confirmation.show
  confirmation.show = function(actions, should_confirm, cb)
    -- Применяем сразу без окна, если правки — только create/move/copy
    -- (rename это move)
    local all_auto = #actions > 0
    for _, action in ipairs(actions) do
      if
        action.type ~= "create"
        and action.type ~= "move"
        and action.type ~= "copy"
      then
        all_auto = false
        break
      end
    end
    if all_auto then
      cb(true)
      return
    end
    original_show(actions, should_confirm, cb)
  end

  -- Автосохранение oil-буфера при выходе из insert-режима
  vim.api.nvim_create_autocmd("InsertLeave", {
    group = vim.api.nvim_create_augroup("OilAutoSave", { clear = true }),
    pattern = "oil:*",
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      if vim.bo[bufnr].filetype == "oil" and vim.bo[bufnr].modified then
        require("oil").save()
      end
    end,
  })
end

EOF

"Font (only applies to GUI nvim: nvim-qt, neovide, etc.)
set guifont=Droid\ Sans\ Mono:h12

"Basic configuration
filetype plugin indent on	"Language detection
syntax enable			"Syntax highlighting
set termguicolors		"Full color mode
"Color scheme
colorscheme dark2026            "Molokai color scheme 
set hidden			"Do not close unsaved files
set clipboard=unnamedplus	"System clipboard for y/p
set autoread			"Auto-reload file when changed externally
" language en_US		"Set interface language
set noshowcmd			"Do not show last command
set noshowmode			"Do not show mode in cmd
set splitbelow			"Horizontal splits go downwards
set splitright			"Vertical splits go to the right
set mouse=a			"Full-featured mouse
set mousehide			"Hide system cursor after a while
set encoding=utf-8		"Editor's encoding is UTF-8 (not file's)
""Map Cyrillic keyboard layout back to Latin so mappings work in either layout.
"Letters + symbols that exist in Russian layout (langmap is single-pass; symbols
"that don't exist in Russian, e.g. $, still require switching layout).
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz,жЖ;;:,юЮ;.>,хХ;[{,ъЪ;]},.;/,ёЁ;`~
set autoindent			"Repeat indent if fyletype has none
set expandtab			"Tabs are spaces now
set shiftwidth=4		"Visible width of a tab
set softtabstop=4		"Amount of spaces in a tab
set number relativenumber	"Relative line numbers with absolute current
" set signcolumn=number         "Doesn't work
set nowrap linebreak nolist	"Break lines by words
set whichwrap+=<,>,[,]		"Let Left/Right arrows wrap to prev/next line
set showtabline=0		"Hide buffer list on top
set cursorline			"Highlight current line
set ignorecase			"Ignore case when searching
set smartcase			"Case sensitive search if has uppercase letters
set inccommand=nosplit		"Live preview of :s/// substitute
set foldmethod=indent		"Indent folding (much cheaper than syntax)
set foldlevelstart=99		"Open file unfolded (fold manually with zM/zR)
set visualbell			"Disable annoying beeping
set clipboard=unnamedplus	"Sync Default Yank/Paste
let mapleader="-"		"Prefix for mappings
let maplocalleader="\\"		"Scond prefix for mappings

"Basic settings relevant to plugins
" set nobackup                  "Disable backup 1
" set nowritebackup             "Disable backup 2
set updatetime=300              "Shorter update delay for plugins
set shortmess+=c                "Don't pass messages to completion menu

"tmux coexistence: prefix is <C-a> (not <C-b>, which nvim-cmp uses to scroll).
"<C-s> (save) and <Esc> work because tmux has flow-control off + escape-time 10.
"NOTE: nvim's default <C-a> (increment number) is shadowed inside tmux — use g<C-a>.

"Basic commands
"Run terminal command in a split
command! -nargs=* Term :split term://<args>

"Basic mappings
"Exit terminal mode (stay in the same buffer/tab)
tnoremap <Esc> <C-\><C-n>

"Turn off ex mode
nnoremap Q <Nop>
"Conform 'Y' to 'D' and 'C'
nnoremap Y y$
"Move within wraped line
vnoremap <Up> gk
vnoremap <Down> gj
"Keep Ctrl+Left/Right from wrapping at line edges while landing exactly on word ends
function! s:WordEnd()
	let l = line('.')
	normal! e
	if line('.') != l
		call cursor(l, col([l, '$']) + 1)
	else
		call cursor(l, col('.') + 1)
	endif
endfunction
function! s:WordStart()
	let l = line('.')
	normal! b
	if line('.') != l
		call cursor(l, 1)
	endif
endfunction
inoremap <C-Right> <C-o>:silent call <SID>WordEnd()<CR>
inoremap <C-Left> <C-o>:silent call <SID>WordStart()<CR>
"Copy text. Do NOT map <Esc> to anything if you use it
vnoremap <C-c> "+y
vnoremap <Space>c "+y
"Select whole text
nnoremap <Space>a ggVG
"Save file
nnoremap <Space>s :w<CR>
nnoremap <C-s> :w<CR>
"Edit config
nnoremap <Space>e :e ~/.config/nvim/init.vim<CR>
"Source config
nnoremap <Space>w :source ~/.config/nvim/init.vim<CR>
    \:echom "init.vim is sourced"<CR>
"Open location list
nnoremap <Space>l :lopen<CR>
"Close location list
nnoremap <Space>q :lclose<CR>
"Remove trailing whitespace
nnoremap <Space>t :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
    \:echom "whitespace deleted"<CR>
"Turn off highlight
nnoremap <silent> <Space>h :noh<CR>

"FZF
nnoremap <Space>p :Files<CR>           "File search (respects gitignore)
nnoremap <Space>R :Rg<CR>              "Grep in files with preview
nnoremap <Space>b :Buffers<CR>         "Buffer list
nnoremap <Space>g :GFiles<CR>          "Files tracked by git
nnoremap <Space>c :Commands<CR>        "Command search
nnoremap <Space>m :Marks<CR>           "Marks list

"Basic autocommands
augroup basicgroup
	autocmd!
	"autocmd FileType c,cpp setlocal equalprg=clang-format	"gg=G uses clang-format
        autocmd TermOpen * startinsert                          "Start terminal in insert mode
augroup END

"Startify
let g:startify_custom_header = []   "Turn off the cow

"Pear Tree
let g:pear_tree_repeatable_expand = 0   "Put closing curly bracket on CR
"Smart portion of the plugin
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

"Colorizer
lua require'colorizer'.setup()

"TreeSitter
lua <<EOF
require'nvim-treesitter.config'.setup {
  ensure_installed = {"c", "cpp", "python", "lua", "yaml", "toml", "json", "markdown", "bash", "vim"},
  highlight = {
    enable = true,
  }
}
EOF

"LSP + completion (mason + nvim-lspconfig + nvim-cmp).
"Deferred until the first file buffer is opened (via vim.schedule so that
"vim.v.vim_did_enter == 1, letting vim.lsp.enable self-heal that buffer).
"Saves ~60-70 ms of cold startup: require('cmp') ~20ms, require('luasnip')
"~20ms, require('mason') ~13ms.
lua <<EOF
function _G.LazyLSP()
  if _G._lazy_lsp_loaded then return end
  _G._lazy_lsp_loaded = true

  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLsp", { clear = true }),
    callback = function(ev)
      local opts = { buffer = ev.buf }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<Space>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<Space>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<Space>f", function() vim.lsp.buf.format({ async = true }) end, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<Space>d", vim.diagnostic.open_float, opts)
    end,
  })

  require("mason").setup()

  -- ty owns type checking + completion; ruff handles the style-level linting
  vim.lsp.config("ty", {
    cmd = { "ty", "server" },
    filetypes = { "python" },
    root_markers = { "ty.toml", "pyproject.toml", ".git" },
    settings = {
      ty = {
        diagnosticMode = "openFilesOnly",
        completions = {
          -- Предлагать только импортированные/локальные, без автоимпортов из окружения
          autoImport = false,
        },
      },
    },
  })

  -- Pass nvim-cmp capabilities to servers before they're auto-enabled
  for _, server in ipairs({ "clangd", "ty", "lua_ls", "taplo", "ruff" }) do
    vim.lsp.config(server, { capabilities = capabilities })
  end

  require("mason-lspconfig").setup({
    ensure_installed = {
      "clangd", "ty", "lua_ls",
      "taplo", "ruff",
    },
  })

  local cmp = require("cmp")
  local luasnip = require("luasnip")
  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
    }, {
      { name = "buffer" },
      { name = "path" },
    }),
  })
end

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("LazyLSP", { clear = true }),
  callback = function()
    vim.schedule(function() _G.LazyLSP() end)
  end,
})
EOF

let g:python3_host_prog = '/usr/bin/python3'

"Git branch in lightline (works inside Oil buffers too)
lua <<EOF
-- Cache the git branch: spawning `git rev-parse` costs ~8ms and lightline
-- calls this on every statusline redraw (i.e. every cursor move in Oil),
-- which makes Oil navigation lag. Refresh at most once per 500ms per dir.
function _G.LightlineGitBranch()
  local now = vim.loop.hrtime()
  local ok, oil = pcall(require, "oil")
  local dir = ok and oil.get_current_dir() or nil

  local cached = _G._lightline_git_branch_cache
  if cached and now - cached.t < 500e6 and cached.dir == dir then
    return cached.branch
  end

  local branch
  if dir then
    branch = vim.fn.system("git -C " .. vim.fn.shellescape(dir) .. " rev-parse --abbrev-ref HEAD 2>/dev/null")
    if vim.v.shell_error == 0 then
      branch = vim.trim(branch)
    else
      branch = ""
    end
  else
    branch = vim.fn.FugitiveHead()
  end

  _G._lightline_git_branch_cache = { t = now, dir = dir, branch = branch }
  return branch
end

-- Filename in lightline: inside Oil show the browsed dir relative to where
-- nvim was opened; for regular buffers fall back to %f (path relative to cwd).
function _G.LightlineFilename()
  local ok, oil = pcall(require, "oil")
  local dir = ok and oil.get_current_dir() or nil
  if dir then
    return vim.fn.fnamemodify(dir, ":p:.")
  end
  return vim.fn.expand("%f")
end
EOF

"Vimscript wrapper so lightline can call it
function! GitBranch()
  return luaeval('LightlineGitBranch()')
endfunction

function! LightlineFilename()
  return luaeval('LightlineFilename()')
endfunction


"Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly'], ['filename', 'modified' ] ],
      \   'right': [ [ 'filetype', 'lineinfo' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'filename' ] ],
      \   'right': [ [ 'lineinfo' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'GitBranch',
      \   'filename': 'LightlineFilename'
      \ },
      \ }

augroup plugingroup
    autocmd!
    autocmd BufNewFile,BufRead *.rchit,*.rgen,*.rmiss set filetype=glsl
augroup END
