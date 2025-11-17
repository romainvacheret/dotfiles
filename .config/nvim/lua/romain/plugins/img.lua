return {
    '3rd/diagram.nvim',
    dependencies = {
        { '3rd/image.nvim',
            build = false, 
            opts = { processor = "magick_cli", }
        }
    },
    config = function ()
        require("diagram").setup({
          integrations = {
            require("diagram.integrations.markdown"),
          },
          renderer_options = {
            mermaid = {
              theme = "forest",
            },
            plantuml = {
              charset = "utf-8",
            },
            d2 = {
              theme_id = 1,
            }
          },
        })
    end
}

