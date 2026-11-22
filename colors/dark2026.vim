
" VS Code "Dark Modern 2026" port for Vim / Neovim
" Converted from dark2026.lua

highlight clear
if exists("syntax_on")
  syntax reset
endif

set background=dark
let g:colors_name = "dark2026"

" Editor / UI
hi Normal          guifg=#bbbebf guibg=#121314 gui=NONE
hi NormalNC        guifg=#bbbebf guibg=#121314 gui=NONE
hi NormalFloat     guifg=#bbbebf guibg=#202122 gui=NONE
hi FloatBorder     guifg=#333536 guibg=#202122 gui=NONE
hi FloatTitle      guifg=#bfbfbf guibg=#202122 gui=bold
hi NonText         guifg=#555555 gui=NONE
hi EndOfBuffer     guifg=#121314 gui=NONE
hi Whitespace      guifg=#555555 gui=NONE
hi SpecialKey      guifg=#555555 gui=NONE
hi Conceal         guifg=#8c8c8c gui=NONE

hi Cursor          guifg=#121314 guibg=#bbbebf gui=NONE
hi CursorLine      guibg=#242526 gui=NONE
hi CursorColumn    guibg=#242526 gui=NONE
hi ColorColumn     guibg=#242526 gui=NONE
hi LineNr          guifg=#555555 gui=NONE
hi CursorLineNr    guifg=#bfbfbf gui=bold
hi SignColumn      guibg=#121314 gui=NONE
hi FoldColumn      guifg=#555555 guibg=#121314 gui=NONE
hi Folded          guifg=#8c8c8c guibg=#242526 gui=NONE

hi Visual          guibg=#276782 gui=NONE
hi VisualNOS       guibg=#276782 gui=NONE
hi Search          guifg=#bbbebf guibg=#276782 gui=NONE
hi IncSearch       guifg=#ffffff guibg=#3994bc gui=NONE
hi CurSearch       guifg=#ffffff guibg=#3994bc gui=NONE
hi MatchParen      guifg=#48a0c7 gui=bold,underline

hi StatusLine      guifg=#8c8c8c guibg=#191a1b gui=NONE
hi StatusLineNC    guifg=#555555 guibg=#191a1b gui=NONE
hi WinSeparator    guifg=#2a2b2c guibg=#121314 gui=NONE
hi VertSplit       guifg=#2a2b2c guibg=#121314 gui=NONE

hi TabLine         guifg=#8c8c8c guibg=#191a1b gui=NONE
hi TabLineFill     guibg=#191a1b gui=NONE
hi TabLineSel      guifg=#bfbfbf guibg=#121314 guisp=#3994bc gui=underline

" Popup menus / completion
hi Pmenu           guifg=#bbbebf guibg=#202122 gui=NONE
hi PmenuSel        guifg=#bfbfbf guibg=#297aa0 gui=NONE
hi PmenuSbar       guibg=#242526 gui=NONE
hi PmenuThumb      guibg=#555555 gui=NONE
hi PmenuKind       guifg=#D2A8FF guibg=#202122 gui=NONE
hi PmenuKindSel    guifg=#D2A8FF guibg=#297aa0 gui=NONE
hi PmenuExtra      guifg=#8c8c8c guibg=#202122 gui=NONE
hi PmenuExtraSel   guifg=#bfbfbf guibg=#297aa0 gui=NONE
hi PmenuMatch      guifg=#48a0c7 gui=bold
hi PmenuMatchSel   guifg=#48a0c7 guibg=#297aa0 gui=bold
hi WildMenu        guifg=#bfbfbf guibg=#297aa0 gui=NONE

" Messages
hi ErrorMsg        guifg=#F44747 gui=NONE
hi WarningMsg      guifg=#CD9731 gui=NONE
hi ModeMsg         guifg=#bfbfbf gui=bold
hi MoreMsg         guifg=#3994bc gui=NONE
hi Question        guifg=#3994bc gui=NONE
hi Title           guifg=#FF7B72 gui=bold
hi Directory       guifg=#48a0c7 gui=NONE

" Syntax (legacy groups)
hi Comment         guifg=#8B949E gui=italic
hi String          guifg=#A5D6FF gui=NONE
hi Character       guifg=#A5D6FF gui=NONE
hi Number          guifg=#79C0FF gui=NONE
hi Boolean         guifg=#79C0FF gui=NONE
hi Float           guifg=#79C0FF gui=NONE

hi Identifier      guifg=#bbbebf gui=NONE
hi Function        guifg=#D2A8FF gui=NONE

hi Statement       guifg=#FF7B72 gui=NONE
hi Conditional     guifg=#FF7B72 gui=NONE
hi Repeat          guifg=#FF7B72 gui=NONE
hi Label           guifg=#FF7B72 gui=NONE
hi Operator        guifg=#FF7B72 gui=NONE
hi Keyword         guifg=#FF7B72 gui=NONE
hi Exception       guifg=#FF7B72 gui=NONE

hi PreProc         guifg=#FF7B72 gui=NONE
hi Include         guifg=#FF7B72 gui=NONE
hi Define          guifg=#FF7B72 gui=NONE
hi Macro           guifg=#FF7B72 gui=NONE
hi PreCondit       guifg=#FF7B72 gui=NONE

hi Type            guifg=#4EC9B0 gui=NONE
hi StorageClass    guifg=#FF7B72 gui=NONE
hi Structure       guifg=#4EC9B0 gui=NONE
hi Typedef         guifg=#4EC9B0 gui=NONE

hi Special         guifg=#FFA657 gui=NONE
hi SpecialChar     guifg=#7EE787 gui=NONE
hi Tag             guifg=#7EE787 gui=NONE
hi Delimiter       guifg=#bbbebf gui=NONE
hi SpecialComment  guifg=#8B949E gui=italic
hi Debug           guifg=#B267E6 gui=NONE

hi Underlined      gui=underline
hi Error           guifg=#F44747 gui=NONE
hi Todo            guifg=#CD9731 gui=bold

" Diagnostics
hi DiagnosticError            guifg=#F44747 gui=NONE
hi DiagnosticWarn             guifg=#CD9731 gui=NONE
hi DiagnosticInfo             guifg=#6796E6 gui=NONE
hi DiagnosticHint             guifg=#3a94bc gui=NONE
hi DiagnosticUnderlineError   guisp=#F44747 gui=undercurl
hi DiagnosticUnderlineWarn    guisp=#CD9731 gui=undercurl
hi DiagnosticUnderlineInfo    guisp=#6796E6 gui=undercurl
hi DiagnosticUnderlineHint    guisp=#3a94bc gui=undercurl
hi DiagnosticVirtualTextError guifg=#F44747 guibg=#121314 gui=NONE
hi DiagnosticVirtualTextWarn  guifg=#CD9731 guibg=#121314 gui=NONE
hi DiagnosticVirtualTextInfo  guifg=#6796E6 guibg=#121314 gui=NONE
hi DiagnosticVirtualTextHint  guifg=#3a94bc guibg=#121314 gui=NONE

" Diff / git
hi DiffAdd         guibg=#1b3a1b gui=NONE
hi DiffChange      guibg=#2a2a4a gui=NONE
hi DiffDelete      guifg=#FFA198 guibg=#3a1b1b gui=NONE
hi DiffText        guibg=#2a2a4a gui=bold
hi GitSignsAdd     guifg=#7EE787 gui=NONE
hi GitSignsChange  guifg=#CD9731 gui=NONE
hi GitSignsDelete  guifg=#FFA198 gui=NONE

" Telescope / Snacks picker
hi TelescopeBorder            guifg=#2a2b2c guibg=#202122 gui=NONE
hi TelescopeNormal            guifg=#bbbebf guibg=#202122 gui=NONE
hi TelescopeSelection         guifg=#bfbfbf guibg=#297aa0 gui=NONE
hi TelescopeMatching          guifg=#48a0c7 gui=bold
hi TelescopePromptPrefix      guifg=#3994bc gui=NONE

hi SnacksPickerBorder         guifg=#2a2b2c guibg=#202122 gui=NONE
hi SnacksPickerNormal         guifg=#bbbebf guibg=#202122 gui=NONE
hi SnacksPickerListCursorLine guibg=#297aa0 gui=NONE
hi SnacksPickerInputBorder    guifg=#297aa0 guibg=#202122 gui=NONE
hi SnacksPickerMatch          guifg=#48a0c7 gui=bold

" blink.cmp
hi link BlinkCmpMenu            Pmenu
hi BlinkCmpMenuBorder           guifg=#333536 guibg=#202122 gui=NONE
hi link BlinkCmpMenuSelection   PmenuSel
hi link BlinkCmpScrollBarThumb  PmenuThumb
hi link BlinkCmpScrollBarGutter PmenuSbar
hi BlinkCmpLabel                guifg=#bbbebf gui=NONE
hi BlinkCmpLabelMatch           guifg=#48a0c7 gui=bold
hi BlinkCmpLabelDeprecated      guifg=#555555 gui=strikethrough
hi BlinkCmpLabelDetail          guifg=#8c8c8c gui=NONE
hi BlinkCmpLabelDescription     guifg=#8c8c8c gui=NONE
hi BlinkCmpSource               guifg=#8c8c8c gui=NONE
hi link BlinkCmpDoc             NormalFloat
hi BlinkCmpDocBorder            guifg=#333536 guibg=#202122 gui=NONE

" Bufferline
hi BufferLineFill              guibg=#191a1b gui=NONE
hi BufferLineBackground        guifg=#8c8c8c guibg=#191a1b gui=NONE
hi BufferLineBufferSelected    guifg=#bfbfbf guibg=#121314 gui=bold
hi BufferLineIndicatorSelected guifg=#3994bc guibg=#121314 gui=NONE

" Notify / which-key
hi WhichKey          guifg=#FF7B72 gui=NONE
hi WhichKeyGroup     guifg=#D2A8FF gui=NONE
hi WhichKeyDesc      guifg=#bbbebf gui=NONE
hi WhichKeySeparator guifg=#8c8c8c gui=NONE
hi WhichKeyFloat     guibg=#202122 gui=NONE

" Treesitter & LSP Semantic Tokens (Neovim only)
if has('nvim')
  hi! link @comment Comment
  hi @comment.documentation guifg=#8B949E gui=italic
  hi! link @comment.todo Todo
  hi @comment.error guifg=#F44747 gui=bold
  hi @comment.warning guifg=#CD9731 gui=bold
  hi @comment.note guifg=#6796E6 gui=bold

  hi! link @string String
  hi @string.escape guifg=#FF7B72 gui=NONE
  hi @string.regexp guifg=#7EE787 gui=NONE
  hi @string.special guifg=#FFA657 gui=NONE
  hi! link @character Character
  hi! link @number Number
  hi! link @boolean Boolean
  hi! link @float Float

  hi @constant guifg=#79C0FF gui=NONE
  hi @constant.builtin guifg=#79C0FF gui=NONE
  hi @constant.macro guifg=#FF7B72 gui=NONE

  hi @variable guifg=#bbbebf gui=NONE
  hi @variable.builtin guifg=#FF7B72 gui=italic
  hi @variable.parameter guifg=#FFA657 gui=NONE
  hi @variable.member guifg=#79C0FF gui=NONE

  hi @property guifg=#79C0FF gui=NONE
  hi @field guifg=#79C0FF gui=NONE

  hi @function guifg=#D2A8FF gui=NONE
  hi @function.builtin guifg=#D2A8FF gui=NONE
  hi @function.call guifg=#D2A8FF gui=NONE
  hi @function.macro guifg=#48a0c7 gui=NONE
  hi @function.method guifg=#D2A8FF gui=NONE
  hi @function.method.call guifg=#D2A8FF gui=NONE
  hi @constructor guifg=#4EC9B0 gui=NONE

  hi! link @keyword Keyword
  hi @keyword.function guifg=#FF7B72 gui=NONE
  hi @keyword.return guifg=#FF7B72 gui=NONE
  hi @keyword.conditional guifg=#FF7B72 gui=NONE
  hi @keyword.repeat guifg=#FF7B72 gui=NONE
  hi @keyword.import guifg=#FF7B72 gui=NONE
  hi @keyword.exception guifg=#FF7B72 gui=NONE
  hi @keyword.operator guifg=#FF7B72 gui=NONE

  hi! link @operator Operator

  hi! link @type Type
  hi @type.builtin guifg=#FF7B72 gui=NONE
  hi @type.definition guifg=#4EC9B0 gui=NONE
  hi @type.qualifier guifg=#FF7B72 gui=NONE

  hi @attribute guifg=#FFA657 gui=NONE
  hi @module guifg=#4EC9B0 gui=NONE
  hi @namespace guifg=#4EC9B0 gui=NONE

  hi @punctuation guifg=#bbbebf gui=NONE
  hi @punctuation.bracket guifg=#bbbebf gui=NONE
  hi @punctuation.delimiter guifg=#bbbebf gui=NONE
  hi @punctuation.special guifg=#FF7B72 gui=NONE

  hi @tag guifg=#7EE787 gui=NONE
  hi @tag.builtin guifg=#7EE787 gui=NONE
  hi @tag.attribute guifg=#79C0FF gui=NONE
  hi @tag.delimiter guifg=#8c8c8c gui=NONE

  hi @markup.heading guifg=#FF7B72 gui=bold
  hi @markup.strong guifg=#bbbebf gui=bold
  hi @markup.italic guifg=#FF7B72 gui=italic
  hi @markup.underline gui=underline
  hi @markup.strikethrough gui=strikethrough
  hi @markup.link guifg=#48a0c7 gui=underline
  hi @markup.link.label guifg=#A5D6FF gui=NONE
  hi @markup.link.url guifg=#48a0c7 gui=underline
  hi @markup.list guifg=#FF7B72 gui=NONE
  hi @markup.quote guifg=#8B949E gui=italic
  hi @markup.raw guifg=#A5D6FF gui=NONE
  hi @markup.raw.block guifg=#bbbebf guibg=#242526 gui=NONE

  hi! link @lsp.type.class @type
  hi! link @lsp.type.enum @type
  hi! link @lsp.type.interface @type
  hi! link @lsp.type.struct @type
  hi! link @lsp.type.type @type
  hi! link @lsp.type.parameter @variable.parameter
  hi! link @lsp.type.variable @variable
  hi! link @lsp.type.property @property
  hi! link @lsp.type.function @function
  hi! link @lsp.type.method @function.method
  hi! link @lsp.type.namespace @namespace
  hi @lsp.type.enumMember guifg=#79C0FF gui=NONE
  hi! link @lsp.typemod.variable.readonly @constant
  hi @lsp.type.const guifg=#79C0FF gui=NONE
  hi @lsp.typemod.const.static guifg=#79C0FF gui=NONE
  hi @lsp.typemod.const.constant guifg=#79C0FF gui=NONE
  hi @lsp.type.const.rust guifg=#79C0FF gui=NONE
  hi @lsp.type.macro guifg=#48a0c7 gui=NONE
endif
