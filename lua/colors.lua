local function setHighlithGroups(groups)
    for k, h in pairs(groups) do
        vim.api.nvim_set_hl(0, k, h)
    end
end

M = {}

M.bg0 = "#101010"
M.bg1 = "#1a1a1a"
M.bg2 = "#303030"

M.cursor_line = "#171717"

M.norm_text = "#ffffff"
M.dim_text = "#a0a0a0"
M.inv_text = "#101010"

M.preproc = "#a25fe5"
M.keyword = "#33b5ff"
M.comment = "#7d7d7d"
M.user_type = "#00ffef"
M.function_ = "#FFE489"
M.method = "#afFF89"
M.field = "#BBBBFF"
M.lit = "#E9967A"
M.namespace = "#ff9fff"

M.diagn_error = "#E13333"
M.diagn_warn = "#C79E2D"
M.diagn_info = "#b0b0b0"
M.diagn_hint = "#b0b0b0"


setHighlithGroups({
    Normal = { bg = M.bg0 },
    LineNr = { bg = M.bg1, fg = M.dim_text },
    Folded = { bg = M.bg2 },
    NormalFloat = { bg = M.bg1 },
    FloatTitle = { bg = M.bg1, fg = M.norm_text },
    FloatBorder = { bg = M.bg1, fg = M.dim_text },
    Pmenu = { bg = M.bg1 },
    VertSplit = { bg = M.bg0, fg = M.dim_text },
    ColorColumn = { bg = M.bg2 },
    CursorLine = { bg = M.cursor_line },
    CursorLineNr = { bg = M.bg2, fg = M.norm_text },
    TabLineFill = { bg = M.bg1, fg = M.dim_text },
    TabLineSel = { bg = M.bg2, fg = M.norm_text },
    WinSeparator = { fg = M.bg2 },
    SignColumn = { bg = M.bg1 },

    Identifier = { fg = M.norm_text },
    Preproc = { fg = M.preproc },
    Statement = { fg = M.keyword, bold = true },
    Type = { fg = M.keyword, bold = true },
    Comment = { fg = M.comment },
    Function = { fg = M.function_ },
    String = { fg = M.lit },
    Constant = { fg = M.lit },

    ["@lsp.type.class"] = { fg = M.user_type },
    ["@lsp.type.stuct"] = { fg = M.user_type },
    ["@lsp.type.enum"] = { fg = M.user_type },
    ["@lsp.type.type"] = { fg = M.user_type },
    ["@lsp.type.typeParameter"] = { fg = M.user_type },
    ["@lsp.type.property"] = { fg = M.field },
    ["@lsp.type.method"] = { fg = M.method },

    ["@variable"] = { fg = M.norm_text },

    -- Go
    ["@type.builtin.go"] = { fg = M.keyword, bold = true },
    ["@type.go"] = { fg = M.user_type },
    ["@type.definition.go"] = { fg = M.user_type },
    ["@property.go"] = { fg = M.field },
    ["@variable.member.go"] = { fg = M.field },
    ["@function.method.call.go"] = { fg = M.method },
    ["@module.go"] = { fg = M.namespace },
    ["@constant.go"] = { fg = M.norm_text },
    ["@constant.builtin.go"] = { fg = M.lit },

    -- Java
    ["@type.java"] = { fg = M.user_type },
    ["@type.builtin.java"] = { fg = M.keyword, bold = true },
    ["@constant.java"] = {},
    ["@constant.builtin.java"] = { fg = M.keyword, bold = true },

    -- Lua
    ["@constant.builtin.lua"] = { fg = M.keyword, bold = true },

    -- C/C++
    cString = { fg = M.lit },
    cppString = { fg = M.lit },
    cNumber = { fg = M.lit },
    cppNumber = { fg = M.lit },
    cOperator = { fg = M.keyword, bold = true },
    cIncluded = { fg = M.preproc },

    ["@lsp.type.macro.cpp"] = { fg = M.preproc },
    ["@lsp.type.macro.c"] = { fg = M.preproc },
    ["@lsp.type.operator.cpp"] = { fg = M.keyword, bold = true },
    ["@lsp.type.operator.c"] = { fg = M.keyword, bold = true },
    ["@lsp.typemod.variable.globalScope.cpp"] = { italic = true },
    ["@lsp.typemod.variable.globalScope.c"] = { italic = true },

    ["@type.builtin.c"] = { fg = M.keyword, bold = true },
    ["@type.c"] = { fg = M.user_type },
    ["@type.definition.c"] = { fg = M.user_type },
    ["@keyword.import.c"] = { fg = M.preproc },
    ["@keyword.directive.define.c"] = { fg = M.preproc },
    ["@keyword.directive.c"] = { fg = M.preproc },

    DiagnosticUnderlineError = { undercurl = true, sp = M.diagn_error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = M.diagn_warn },
    DiagnosticUnderlineInfo = { undercurl = true, sp = M.diagn_info },
    DiagnosticUnderlineHint = { undercurl = true, sp = M.diagn_hint },

    StatusColumnDiagnosticError = { bg = M.diagn_error, fg = M.norm_text },
    StatusColumnDiagnosticWarn = { bg = M.diagn_warn, fg = M.norm_text },
    StatusColumnDiagnosticInfo = { bg = M.diagn_info, fg = M.inv_text },
    StatusColumnDiagnosticHint = { bg = M.diagn_hint, fg = M.inv_text },

    NeoTreeTitleBar = { bg = M.bg1, fg = M.dim_text },
    NeoTreeFloatBorder = { bg = M.bg1, fg = M.bg1 },

    IndentBlanklineIndent1 = { fg = M.bg2, nocombine = true },

    Added = { bg = M.bg1, fg = "#4BC062" },
    Changed = { bg = M.bg1, fg = "#4B7AC0" },
    Removed = { bg = M.bg1, fg = "#EE1010" },
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

return M
