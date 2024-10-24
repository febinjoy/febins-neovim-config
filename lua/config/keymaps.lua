-- Generic

-- Space bar as leader key
vim.g.mapleader = " "

-- Install Mason dependencies used
vim.keymap.set(
  "n",
  "<leader>imd",
  ":MasonInstall stylua prettier pylint black isort pylint codespell eslint_d shellcheck write-good revive<cr>"
)

-- Buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>") -- Next buffer
vim.keymap.set("n", "<leader>p", ":bp<cr>") -- Previous buffer
vim.keymap.set("n", "<leader>x", ":bd<cr>") -- Close current buffer

-- nvim-comment
vim.keymap.set({ "n", "v" }, "<leader>/", ":CommentToggle<cr>") -- Comment/Uncomment line

-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+yg_]])
vim.keymap.set({ "n", "v" }, "<leader>yy", [["+yy]])

-- paste from clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]])

-- Plugins

-- Telescope
vim.keymap.set("n", "<C-p>", ":Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fp", ":Telescope git_files<cr>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader><leader>", ":Telescope oldfiles<cr>")

-- File Tree
vim.keymap.set("n", "<C-e>", ":Neotree filesystem reveal left<cr>")    -- Open File tree
vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<cr>") -- Show all open buffers as a floating window

-- Git
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})              -- Preview the difference with git in a floating window
vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {}) -- Toggle display of git blame on each line

-- LSP Config Key Maps
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})                         -- Hover information lika a tooltip
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, {})          -- Show declarations
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})           -- Show definition
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})           -- Show references
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {}) -- Code Actions window
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})               -- Format current document

-- Debugging
vim.keymap.set("n", "<F5>", function()
  require("dap").continue()
end)
vim.keymap.set("n", "<F10>", function()
  require("dap").step_over()
end)
vim.keymap.set("n", "<F11>", function()
  require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
  require("dap").step_out()
end)
vim.keymap.set("n", "<Leader>b", function()
  require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<Leader>B", function()
  require("dap").set_breakpoint()
end)
vim.keymap.set("n", "<Leader>lp", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<Leader>dr", function()
  require("dap").repl.open()
end)
vim.keymap.set("n", "<Leader>dl", function()
  require("dap").run_last()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
  require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
  require("dap.ui.widgets").preview()
end)
vim.keymap.set("n", "<Leader>df", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end)

vim.keymap.set("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })
vim.keymap.set("i", "<c-;>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, silent = true })
vim.keymap.set("i", "<c-,>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true })
vim.keymap.set("i", "<c-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true })
