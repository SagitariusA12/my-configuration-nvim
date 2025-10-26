return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("cyberdream").setup({
			transparent = true,
			italic_comments = true,
			saturation = 1,
			hide_fillchars = false,
			terminal_colors = true,
			cache = true,
			borderless_telescope = false,
		})

		-- Aplica o colorscheme
		vim.cmd.colorscheme("cyberdream")

		-- Sobrescreve highlights **depois que o colorscheme carregar**
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "cyberdream",
			callback = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "#000000", fg = "#FFFFFF" })
				vim.api.nvim_set_hl(0, "String", { fg = "#AAEFFF", italic = false })
				vim.api.nvim_set_hl(0, "Identifier", { fg = "#71ffbd", italic = false })
			end,
		})
	end,
}
