return require('packer').startup(function(use)
	
	use { 'cohama/lexima.vim' }
	use { 'nvim-lualine/lualine.nvim' }
	use { 'nvim-tree/nvim-web-devicons' }
	
	--Tag bar
	use { 'romgrk/barbar.nvim' }

	--Trouble shooting
	use { 'folke/trouble.nvim' }

	--Telescope
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.5' }
	use { 'nvim-telescope/telescope-file-browser.nvim' }
	use { 'nvim-lua/plenary.nvim' }
	local async = require "plenary.async"

	-- Flutter Build
	use { 'akinsho/flutter-tools.nvim' }

	-- XcodeBuilder
	use { "wojciech-kulik/xcodebuild.nvim" }

	--Theme
	use { 'JoosepAlviste/palenightfall.nvim' }

	require('plugin.lualine-config')
	require('plugin.barbar-config')
	require('plugin.trouble-config')
	require('plugin.telescope-config')
	require('plugin.flutter-config')
	require('plugin.xcodebuild-config')
end)
