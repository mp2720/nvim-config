local function setHighlithGroups(groups)
    for k, h in pairs(groups) do
        vim.api.nvim_set_hl(0, k, h)
    end
end

local bg0 = "#101010"
local bg1 = "#1a1a1a"
local bg2 = "#303030"

local cursor_line = "#171717"

local norm_text = "#ffffff"
local dim_text = "#a0a0a0"
local inv_text = "#101010"

local preproc = "#a25fe5"
local keyword = "#33b5ff"
local comment = "#7d7d7d"
local user_type = "#00ffef"
local function_ = "#FFE489"
local method = "#afFF89"
local field = "#BBBBFF"
local lit = "#E9967A"
local namespace = "#ff9fff"

local diagn_error = "#E13333"
local diagn_warn = "#C79E2D"
local diagn_info = "#b0b0b0"
local diagn_hint = "#b0b0b0"

setHighlithGroups({
    Normal = { bg = bg0 },
    LineNr = { bg = bg1, fg = dim_text },
    Folded = { bg = bg2 },
    NormalFloat = { bg = bg1 },
    FloatTitle = { bg = bg1, fg = norm_text },
    FloatBorder = { bg = bg1, fg = dim_text },
    Pmenu = { bg = bg1 },
    VertSplit = { bg = bg0, fg = dim_text },
    ColorColumn = { bg = bg2 },
    CursorLine = { bg = cursor_line },
    CursorLineNr = { bg = bg2, fg = norm_text },
    TabLineFill = { bg = bg1, fg = dim_text },
    TabLineSel = { bg = bg2, fg = norm_text },
    WinSeparator = { fg = bg2 },
    SignColumn = { bg = bg1 },

    Identifier = { fg = norm_text },
    Preproc = { fg = preproc },
    Statement = { fg = keyword, bold = true },
    Type = { fg = keyword, bold = true },
    Comment = { fg = comment },
    Function = { fg = function_ },
    String = { fg = lit },
    Constant = { fg = lit },

    ["@lsp.type.class"] = { fg = user_type },
    ["@lsp.type.stuct"] = { fg = user_type },
    ["@lsp.type.enum"] = { fg = user_type },
    ["@lsp.type.type"] = { fg = user_type },
    ["@lsp.type.typeParameter"] = { fg = user_type },
    ["@lsp.type.property"] = { fg = field },
    ["@lsp.type.method"] = { fg = method },

    ["@variable"] = { fg = norm_text },

    -- Go
    ["@type.builtin.go"] = { fg = keyword, bold = true },
    ["@type.go"] = { fg = user_type },
    ["@type.definition.go"] = { fg = user_type },
    ["@property.go"] = { fg = field },
    ["@variable.member.go"] = { fg = field },
    ["@function.method.call.go"] = { fg = method },
    ["@module.go"] = { fg = namespace },
    ["@constant.go"] = { fg = norm_text },
    ["@constant.builtin.go"] = { fg = lit },

    -- Java
    ["@type.java"] = { fg = user_type },
    ["@type.builtin.java"] = { fg = keyword },
    ["@constant.java"] = {},
    ["@constant.builtin.java"] = { fg = keyword, bold = true },

    -- Lua
    ["@constant.builtin.lua"] = { fg = keyword, bold = true },

    -- C/C++
    cString = { fg = lit },
    cppString = { fg = lit },
    cNumber = { fg = lit },
    cppNumber = { fg = lit },
    cOperator = { fg = keyword, bold = true },
    cIncluded = { fg = preproc },

    ["@lsp.type.macro.cpp"] = { fg = preproc },
    ["@lsp.type.macro.c"] = { fg = preproc },
    ["@lsp.type.operator.cpp"] = { fg = keyword, bold = true },
    ["@lsp.type.operator.c"] = { fg = keyword, bold = true },
    ["@lsp.typemod.variable.globalScope.cpp"] = { italic = true },
    ["@lsp.typemod.variable.globalScope.c"] = { italic = true },

    ["@type.builtin.c"] = { fg = keyword, bold = true },
    ["@type.c"] = { fg = user_type },
    ["@type.definition.c"] = { fg = user_type },
    ["@keyword.import.c"] = { fg = preproc },
    ["@keyword.directive.define.c"] = { fg = preproc },
    ["@keyword.directive.c"] = { fg = preproc },

    DiagnosticUnderlineError = { undercurl = true, sp = diagn_error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = diagn_warn },
    DiagnosticUnderlineInfo = { undercurl = true, sp = diagn_info },
    DiagnosticUnderlineHint = { undercurl = true, sp = diagn_hint },

    StatusColumnDiagnosticError = { bg = diagn_error, fg = norm_text },
    StatusColumnDiagnosticWarn = { bg = diagn_warn, fg = norm_text },
    StatusColumnDiagnosticInfo = { bg = diagn_info, fg = inv_text },
    StatusColumnDiagnosticHint = { bg = diagn_hint, fg = inv_text },

    NeoTreeTitleBar = { bg = bg1, fg = dim_text },
    NeoTreeFloatBorder = { bg = bg1, fg = bg1 },

    IndentBlanklineIndent1 = { fg = bg2, nocombine = true },

    Added = { bg = bg1, fg = "#4BC062" },
    Changed = { bg = bg1, fg = "#4B7AC0" },
    Removed = { bg = bg1, fg = "#EE1010" },
})

-- terminal colors
vim.g.terminal_color_0 = "#181818"
vim.g.terminal_color_1 = "#ac4142"
vim.g.terminal_color_2 = "#7e8d50"
vim.g.terminal_color_3 = "#e5b566"
vim.g.terminal_color_4 = "#6c99ba"
vim.g.terminal_color_5 = "#9e4e85"
vim.g.terminal_color_6 = "#7dd5cf"
vim.g.terminal_color_7 = "#d0d0d0"
vim.g.terminal_color_8 = "#505050"
vim.g.terminal_color_9 = "#ac4142"
vim.g.terminal_color_10 = "#7e8d50"
vim.g.terminal_color_11 = "#e5b566"
vim.g.terminal_color_12 = "#6c99ba"
vim.g.terminal_color_13 = "#9e4e85"
vim.g.terminal_color_14 = "#7dd5cf"
vim.g.terminal_color_15 = "#F5F5F5"
