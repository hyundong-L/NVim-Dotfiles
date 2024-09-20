local opt = vim.opt

-- tab / indent
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4	-- tab 키를 눌렀을 때 삽입되는 공백
opt.expandtab = true -- tab 키를 눌렀을 때 공백을 치환하도록
opt.smartindent = true -- 자동 들여쓰기
opt.wrap = false -- 문장이 길다면 자동으로 다음 줄로 띄우는 기능 - false

-- search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- visual
opt.number = true
opt.termguicolors = true
opt.signcolumn = "yes"

--etc
opt.encoding = "UTF-8"
opt.scrolloff = 10
