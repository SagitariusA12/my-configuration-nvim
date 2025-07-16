return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"nvim-lua/plenary.nvim",
	},
	event = { "BufReadPre", "BufNewFile" }, -- Carrega apenas em buffers com arquivos
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- Formatação para Lua
				null_ls.builtins.formatting.prettier.with({
					filetypes = { -- Tipos de arquivo para prettier
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"html",
						"css",
						"json",
						"yaml",
						"markdown",
					},
				}),
				require("none-ls.diagnostics.eslint_d").with({
					filetypes = { -- Tipos de arquivo para eslint_d
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
					},
				}),
			},
			-- Formatação automática ao salvar
			on_attach = function(client, bufnr)
				if client:supports_method("textDocument/formatting") then
					local group = vim.api.nvim_create_augroup("NullLsFormatting", { clear = true })
					vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = group,
						buffer = bufnr,
						callback = function()
							-- Apenas formatar buffers com nome e tipo válido
							if vim.fn.bufname(bufnr) ~= "" and vim.bo[bufnr].buftype == "" then
								vim.lsp.buf.format({ bufnr = bufnr, async = false })
							end
						end,
					})
				end
			end,
		})

		-- Mapeamento para formatação manual
		vim.keymap.set("n", "<leader>gf", function()
			if vim.fn.bufname() ~= "" and vim.bo.buftype == "" then
				vim.lsp.buf.format({ async = false })
			else
				print("Erro: Nenhum arquivo válido para formatação")
			end
		end, { desc = "Formatar arquivo" })

		-- Mapeamento para correções do eslint_d
		vim.keymap.set("n", "<leader>ca", function()
			if vim.fn.bufname() ~= "" and vim.bo.buftype == "" then
				vim.lsp.buf.code_action()
			else
				print("Erro: Nenhum arquivo válido para correções")
			end
		end, { desc = "Aplicar correções de código (eslint_d)" })
	end,
}
