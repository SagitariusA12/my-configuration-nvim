return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects", -- Adicione esta dependência
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"python",
				"javascript",
				"html",
				"css",
				"json",
				"bash",
				"markdown",
			},
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
			textobjects = {
				move = {
					enable = true,
					set_jumps = true,
					goto_next_end = {
						["]d"] = { query = "@punctuation.special", desc = "Next punctuation" },
					},
				},
			},
		})
		-- Mapeamento para pular delimitadores no modo insert
		vim.keymap.set(
			"i",
			"<C-d>",
			'<Cmd>lua require("nvim-treesitter.textobjects").move.goto_next_end("@punctuation.special")<CR><Space>',
			{ noremap = true, silent = true }
		)
	end,
}
