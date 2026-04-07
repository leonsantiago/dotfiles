vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "warm_custom"

local set = vim.api.nvim_set_hl

local c = {
  bg = "#0a0908",
  bg_alt = "#151311",
  bg_alt2 = "#232221",
  fg = "#e4e6d1",
  fg_alt = "#afad96",
  muted = "#57553d",
  yellow = "#feb648",
  amber = "#fb9800",
  orange = "#fe7702",
  red = "#de4c01",
  string = "#ffd27a",
  number = "#ff9440",
}

-- UI
set(0, "Normal", { fg = c.fg, bg = c.bg })
set(0, "NormalFloat", { fg = c.fg, bg = c.bg_alt })
set(0, "FloatBorder", { fg = c.muted, bg = c.bg_alt })
set(0, "FloatTitle", { fg = c.amber, bg = c.bg_alt, bold = true })

set(0, "CursorLine", { bg = c.bg_alt })
set(0, "CursorColumn", { bg = c.bg_alt })
set(0, "ColorColumn", { bg = c.bg_alt })

set(0, "LineNr", { fg = c.muted })
set(0, "CursorLineNr", { fg = c.yellow, bold = true })
set(0, "SignColumn", { bg = c.bg })
set(0, "FoldColumn", { fg = c.fg_alt, bg = c.bg })

set(0, "VertSplit", { fg = c.bg_alt2 })
set(0, "WinSeparator", { fg = c.bg_alt2 })

set(0, "Visual", { bg = c.muted })
set(0, "Search", { fg = c.bg, bg = c.yellow })
set(0, "IncSearch", { fg = c.bg, bg = c.amber, bold = true })
set(0, "CurSearch", { fg = c.bg, bg = c.orange, bold = true })
set(0, "MatchParen", { fg = c.bg, bg = c.orange, bold = true })

set(0, "StatusLine", { fg = c.fg, bg = c.bg_alt2 })
set(0, "StatusLineNC", { fg = c.fg_alt, bg = c.bg_alt })
set(0, "TabLine", { fg = c.fg_alt, bg = c.bg_alt })
set(0, "TabLineSel", { fg = c.bg, bg = c.amber, bold = true })
set(0, "TabLineFill", { bg = c.bg })

set(0, "Pmenu", { fg = c.fg, bg = c.bg_alt })
set(0, "PmenuSel", { fg = c.bg, bg = c.amber })
set(0, "PmenuSbar", { bg = c.bg_alt2 })
set(0, "PmenuThumb", { bg = c.muted })

set(0, "Folded", { fg = c.fg_alt, bg = c.bg_alt })
set(0, "NonText", { fg = c.muted })
set(0, "Whitespace", { fg = c.muted })
set(0, "SpecialKey", { fg = c.muted })

-- Syntax
set(0, "Comment", { fg = c.muted, italic = true })
set(0, "Constant", { fg = c.yellow })
set(0, "String", { fg = c.string })
set(0, "Character", { fg = c.string })
set(0, "Number", { fg = c.number })
set(0, "Boolean", { fg = c.number, bold = true })
set(0, "Float", { fg = c.number })

set(0, "Identifier", { fg = c.fg })
set(0, "Function", { fg = c.amber })
set(0, "Statement", { fg = c.orange, bold = true })
set(0, "Conditional", { fg = c.orange, bold = true })
set(0, "Repeat", { fg = c.orange, bold = true })
set(0, "Keyword", { fg = c.orange, bold = true })
set(0, "Operator", { fg = c.fg_alt })
set(0, "PreProc", { fg = c.amber })
set(0, "Type", { fg = c.yellow })
set(0, "Special", { fg = c.red })
set(0, "Delimiter", { fg = c.fg_alt })
set(0, "Todo", { fg = c.bg, bg = c.yellow, bold = true })

-- Diagnostics
set(0, "DiagnosticError", { fg = c.red })
set(0, "DiagnosticWarn", { fg = c.amber })
set(0, "DiagnosticInfo", { fg = c.fg_alt })
set(0, "DiagnosticHint", { fg = c.yellow })

set(0, "DiagnosticVirtualTextError", { fg = c.red, bg = c.bg_alt })
set(0, "DiagnosticVirtualTextWarn", { fg = c.amber, bg = c.bg_alt })
set(0, "DiagnosticVirtualTextInfo", { fg = c.fg_alt, bg = c.bg_alt })
set(0, "DiagnosticVirtualTextHint", { fg = c.yellow, bg = c.bg_alt })

set(0, "DiagnosticUnderlineError", { undercurl = true, sp = c.red })
set(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = c.amber })
set(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = c.fg_alt })
set(0, "DiagnosticUnderlineHint", { undercurl = true, sp = c.yellow })

-- Diff / Git
set(0, "DiffAdd", { bg = "#1a160d" })
set(0, "DiffChange", { bg = "#1a140c" })
set(0, "DiffDelete", { bg = "#200d08" })
set(0, "DiffText", { bg = "#2a1a0d" })

set(0, "GitSignsAdd", { fg = c.yellow })
set(0, "GitSignsChange", { fg = c.amber })
set(0, "GitSignsDelete", { fg = c.red })

-- Telescope
set(0, "TelescopeNormal", { fg = c.fg, bg = c.bg_alt })
set(0, "TelescopeBorder", { fg = c.muted, bg = c.bg_alt })
set(0, "TelescopePromptNormal", { fg = c.fg, bg = c.bg_alt2 })
set(0, "TelescopePromptBorder", { fg = c.muted, bg = c.bg_alt2 })
set(0, "TelescopePromptTitle", { fg = c.bg, bg = c.amber, bold = true })
set(0, "TelescopePreviewTitle", { fg = c.bg, bg = c.yellow, bold = true })
set(0, "TelescopeResultsTitle", { fg = c.bg, bg = c.orange, bold = true })
set(0, "TelescopeSelection", { bg = c.muted })
set(0, "TelescopeMatching", { fg = c.amber, bold = true })

-- WhichKey
set(0, "WhichKey", { fg = c.amber, bold = true })
set(0, "WhichKeyDesc", { fg = c.fg })
set(0, "WhichKeyGroup", { fg = c.yellow })
set(0, "WhichKeySeparator", { fg = c.muted })

-- CMP
set(0, "CmpItemAbbr", { fg = c.fg })
set(0, "CmpItemAbbrMatch", { fg = c.amber, bold = true })
set(0, "CmpItemAbbrMatchFuzzy", { fg = c.yellow, bold = true })
set(0, "CmpItemMenu", { fg = c.fg_alt })
set(0, "CmpItemKind", { fg = c.orange })

-- Treesitter common captures
set(0, "@comment", { fg = c.muted, italic = true })
set(0, "@string", { fg = c.string })
set(0, "@number", { fg = c.number })
set(0, "@boolean", { fg = c.number, bold = true })
set(0, "@function", { fg = c.amber })
set(0, "@function.call", { fg = c.amber })
set(0, "@keyword", { fg = c.orange, bold = true })
set(0, "@keyword.return", { fg = c.orange, bold = true })
set(0, "@type", { fg = c.yellow })
set(0, "@type.builtin", { fg = c.yellow, bold = true })
set(0, "@property", { fg = c.fg })
set(0, "@variable", { fg = c.fg })
set(0, "@variable.builtin", { fg = c.red })
set(0, "@operator", { fg = c.fg_alt })
set(0, "@punctuation.delimiter", { fg = c.fg_alt })
set(0, "@punctuation.bracket", { fg = c.fg_alt })

-- Markdown
set(0, "@markup.heading", { fg = c.amber, bold = true })
set(0, "@markup.link", { fg = c.yellow, underline = true })
set(0, "@markup.raw", { fg = c.string })
