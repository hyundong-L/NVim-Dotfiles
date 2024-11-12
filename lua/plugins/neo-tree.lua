return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true, -- 숨김 파일도 표시
					hide_dotfiles = false, -- 점(.)으로 시작하는 파일 숨기지 않음
					hide_gitignored = false, -- Git에서 무시된 파일 숨기지 않음
				},
			},
		})
	end,
}
