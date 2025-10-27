return {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    keys = {
        -- 🔍 Abrir o Spectre globalmente (em todo o projeto)
        {
            "<leader>S",
            function()
                require("spectre").toggle()
            end,
            desc = "Open Spectre (project)",
        },

        -- 🔍 Substituir a palavra sob o cursor em todo o projeto
        {
            "<leader>sw",
            function()
                require("spectre").open_visual({ select_word = true })
            end,
            desc = "Replace word under cursor (project)",
            mode = { "n" },
        },

        -- 🔍 Substituir em todo o arquivo atual
        {
            "<leader>sp",
            function()
                require("spectre").open_file_search({ path = vim.fn.expand("%:p") })
            end,
            desc = "Replace in current file",
        },

        -- 🔍 Substituir apenas no texto selecionado
        {
            "<leader>ss",
            function()
                require("spectre").open_visual()
            end,
            desc = "Replace in selection (visual mode)",
            mode = { "v" },
        },
    },
}
