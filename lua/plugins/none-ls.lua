-- None LS helps simplify creating, sharing and setting up LSP sources
return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Formatting
				null_ls.builtins.formatting.stylua, -- Lua
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black, -- Python
				null_ls.builtins.formatting.isort, -- Sort imports in Python
				-- Diagnostics
				null_ls.builtins.diagnostics.write_good, -- Checks the text for spelling and grammatical errors
				null_ls.builtins.diagnostics.pylint.with({
					diagnostics_postprocess = function(diagnostic)
						diagnostic.code = diagnostic.message_id
					end,
				}), -- Python linter
				null_ls.builtins.diagnostics.revive, -- Linter for golang
				null_ls.builtins.diagnostics.codespell, -- Checks misspelled words in source code
				null_ls.builtins.diagnostics.todo_comments, -- Highlights TODO
				null_ls.builtins.diagnostics.trail_space, -- Highlights trailing space
				require("none-ls.diagnostics.eslint_d"), -- eslint
			},
		})
	end,
}
