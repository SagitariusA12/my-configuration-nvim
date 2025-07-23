return {
	"nvim-pack/nvim-spectre",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = true,
	keys = {
		-- 🔍 Abre o Spectre global (em todo o projeto)
		{
			"<leader>S",
			function()
				require("spectre").toggle()
			end,
			desc = "Abrir Spectre (projeto)",
		},

		-- 🔍 Substituir palavra sob o cursor em todo o projeto
		{
			"<leader>sw",
			function()
				require("spectre").open_visual({ select_word = true })
			end,
			desc = "Substituir palavra sob o cursor (projeto)",
		},

		-- 🔍 Substituir palavra apenas no arquivo atual
		{
			"<leader>sp",
			function()
				require("spectre").open_file_search()
			end,
			desc = "Substituir no arquivo atual",
		},
	},
}
