
" Name:         vs2017_cpp_dark
" Description:  Visual Studio 2017 Dark - C/C++ Theme for Vim/Neovim
" Maintainer:   Custom

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "vs2017_cpp_dark"

" --- Основные цвета интерфейса (UI) ---
hi Normal       guifg=#DCDCDC guibg=#1E1E1E gui=NONE
hi NormalFloat  guifg=#DCDCDC guibg=#252526 gui=NONE
hi FloatBorder  guifg=#454545 guibg=#252526 gui=NONE
hi Cursor       guifg=#1E1E1E guibg=#DCDCDC gui=NONE
hi CursorLine   guifg=NONE    guibg=#262626 gui=NONE
hi CursorColumn guifg=NONE    guibg=#262626 gui=NONE
hi ColorColumn  guifg=NONE    guibg=#252526 gui=NONE
hi LineNr       guifg=#2B91AF guibg=#1E1E1E gui=NONE
hi CursorLineNr guifg=#DCDCDC guibg=#262626 gui=NONE
hi SignColumn   guifg=NONE    guibg=#1E1E1E gui=NONE
hi VertSplit    guifg=#3F3F46 guibg=#1E1E1E gui=NONE
hi WinSeparator guifg=#3F3F46 guibg=#1E1E1E gui=NONE
hi StatusLine   guifg=#FFFFFF guibg=#007ACC gui=NONE
hi StatusLineNC guifg=#CCCCCC guibg=#2D2D30 gui=NONE
hi Pmenu        guifg=#DCDCDC guibg=#252526 gui=NONE
hi PmenuSel     guifg=#FFFFFF guibg=#007ACC gui=NONE
hi PmenuSbar    guifg=NONE    guibg=#2D2D30 gui=NONE
hi PmenuThumb   guifg=NONE    guibg=#686868 gui=NONE
hi Visual       guifg=NONE    guibg=#264F78 gui=NONE
hi Search       guifg=NONE    guibg=#515C6A gui=NONE
hi IncSearch    guifg=NONE    guibg=#613214 gui=NONE
hi MatchParen   guifg=#FFFFFF guibg=#0E639C gui=bold
hi Folded       guifg=#808080 guibg=#252526 gui=NONE
hi Directory    guifg=#569CD6 guibg=NONE    gui=NONE
hi NonText      guifg=#404040 guibg=NONE    gui=NONE
hi SpecialKey   guifg=#404040 guibg=NONE    gui=NONE
hi Title        guifg=#569CD6 guibg=NONE    gui=bold
hi ErrorMsg     guifg=#F44747 guibg=NONE    gui=NONE
hi WarningMsg   guifg=#FFCC00 guibg=NONE    gui=NONE

" --- Базовый синтаксис (VS 2017 C/C++ Palette) ---
" Комментарии (в VS 2017 без курсива)
hi Comment      guifg=#57A64A guibg=NONE    gui=NONE

" Строки и числа
hi Constant     guifg=#B5CEA8 guibg=NONE    gui=NONE
hi String       guifg=#D69D85 guibg=NONE    gui=NONE
hi Character    guifg=#D69D85 guibg=NONE    gui=NONE
hi Number       guifg=#B5CEA8 guibg=NONE    gui=NONE
hi Boolean      guifg=#569CD6 guibg=NONE    gui=NONE
hi Float        guifg=#B5CEA8 guibg=NONE    gui=NONE

" Идентификаторы и функции (в классическом VS 2017 функции белые/светло-серые)
hi Identifier   guifg=#DCDCDC guibg=NONE    gui=NONE
hi Function     guifg=#DCDCDC guibg=NONE    gui=NONE

" Ключевые слова и операторы
hi Statement    guifg=#569CD6 guibg=NONE    gui=NONE
hi Conditional  guifg=#569CD6 guibg=NONE    gui=NONE
hi Repeat       guifg=#569CD6 guibg=NONE    gui=NONE
hi Label        guifg=#569CD6 guibg=NONE    gui=NONE
hi Operator     guifg=#B4B4B4 guibg=NONE    gui=NONE
hi Keyword      guifg=#569CD6 guibg=NONE    gui=NONE
hi Exception    guifg=#569CD6 guibg=NONE    gui=NONE

" Препроцессор и макросы (характерный серо-синий и фиолетовый из VS 2017)
hi PreProc      guifg=#9B9B9B guibg=NONE    gui=NONE
hi Include      guifg=#9B9B9B guibg=NONE    gui=NONE
hi Define       guifg=#9B9B9B guibg=NONE    gui=NONE
hi Macro        guifg=#BD63C5 guibg=NONE    gui=NONE
hi PreCondit    guifg=#9B9B9B guibg=NONE    gui=NONE

" Типы данных (встроенные синие, пользовательские бирюзовые)
hi Type         guifg=#569CD6 guibg=NONE    gui=NONE
hi StorageClass guifg=#569CD6 guibg=NONE    gui=NONE
hi Structure    guifg=#4EC9B0 guibg=NONE    gui=NONE
hi Typedef      guifg=#4EC9B0 guibg=NONE    gui=NONE

" Спецсимволы и ошибки
hi Special      guifg=#D7BA7D guibg=NONE    gui=NONE
hi SpecialChar  guifg=#D7BA7D guibg=NONE    gui=NONE
hi Delimiter    guifg=#DCDCDC guibg=NONE    gui=NONE
hi Underlined   guifg=#569CD6 guibg=NONE    gui=underline
hi Ignore       guifg=#808080 guibg=NONE    gui=NONE
hi Error        guifg=#F44747 guibg=NONE    gui=underline
hi Todo         guifg=#57A64A guibg=NONE    gui=bold

" --- Диагностика LSP ---
hi DiagnosticError guifg=#F44747 gui=NONE
hi DiagnosticWarn  guifg=#FFCC00 gui=NONE
hi DiagnosticInfo  guifg=#75BEFF gui=NONE
hi DiagnosticHint  guifg=#EEEEEE gui=NONE
hi DiagnosticUnderlineError guisp=#F44747 gui=undercurl
hi DiagnosticUnderlineWarn  guisp=#FFCC00 gui=undercurl

" --- Treesitter и LSP Semantic Tokens (для точного соответствия C/C++ в Neovim) ---
if has('nvim')
  " Классы, структуры, шаблоны и перечисления (бирюзовый #4EC9B0)
  hi! link @type              Structure
  hi! link @type.definition   Structure
  hi! link @constructor       Structure
  hi! link @lsp.type.class    Structure
  hi! link @lsp.type.struct   Structure
  hi! link @lsp.type.enum     Structure
  hi! link @lsp.type.typeParameter Structure

  " Встроенные типы (int, void, bool -> синий #569CD6)
  hi! link @type.builtin      Type
  hi! link @lsp.type.builtinType Type

  " Макросы (фиолетовый #BD63C5)
  hi! link @constant.macro    Macro
  hi! link @function.macro    Macro
  hi! link @lsp.type.macro    Macro

  " Директивы препроцессора (#include, #define -> серый #9B9B9B)
  hi! link @keyword.directive PreProc
  hi! link @keyword.import    PreProc

  " Переменные и параметры функций (в VS 2017 параметры тёмно-серые #9A9A9A)
  hi @variable.parameter      guifg=#9A9A9A gui=NONE
  hi! link @lsp.type.parameter @variable.parameter
  hi! link @variable          Identifier
  hi! link @variable.member   Identifier
  hi! link @lsp.type.variable Identifier
  hi! link @lsp.type.property Identifier

  " Константы и значения enum (бледно-зелёный #B8D7A3)
  hi @lsp.type.enumMember     guifg=#B8D7A3 gui=NONE
  hi! link @constant          @lsp.type.enumMember

  " Пространства имён (белый/светло-серый в VS 2017)
  hi! link @module            Identifier
  hi! link @lsp.type.namespace Identifier

  " Функции и методы (в классической теме VS 2017 они остаются белыми #DCDCDC)
  hi! link @function          Function
  hi! link @function.call     Function
  hi! link @function.method   Function
  hi! link @lsp.type.function Function
  hi! link @lsp.type.method   Function
endif
