-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  "rebelot/kanagawa.nvim",
  --priority = 1000,  -- Charger en premier (avant les autres plugins)
  config = function()
    require("kanagawa").setup({
		colors = {                   -- add/modify theme and palette colors
		    palette = {},
		    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
		},
		overrides = function(colors) -- add/modify highlights
		    return {}
		end,
		theme = "wave",              -- Load "wave" theme
		background = {               -- map the value of 'background' option to a theme
		    dark = "wave",           -- try "dragon" !
		    light = "lotus"
		},
	})
    vim.cmd.colorscheme("kanagawa")
  end,
}
