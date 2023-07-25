local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
	"                                                      ",
	"                                                      ",
	"                                                      ",
	"                                                      ",
	"                                                      ",
	"                                                      ",
	"                                                      ",
	"                                                      ",
	"                                                      ",
	"                                                      ",
	"                                                      ",
	"                                                      ",
	"                                                      ",
	"                                                      ",
	"   ██████╗  ███╗   ██╗ ██╗   ██╗ ███╗   ███╗  █████╗  ",
	"  ██╔═══██╗ ████╗  ██║ ██║   ██║ ████╗ ████║ ██╔══██╗ ",
	"  ██║   ██║ ██╔██╗ ██║ ██║   ██║ ██╔████╔██║ ███████║ ",
	"  ██║   ██║ ██║╚██╗██║ ██║   ██║ ██║╚██╔╝██║ ██╔══██║ ",
	"  ╚██████╔╝ ██║ ╚████║ ╚██████╔╝ ██║ ╚═╝ ██║ ██║  ██║ ",
	"    ╚═════╝  ╚═╝  ╚══╝  ╚═════╝  ╚═╝     ╚═╝ ╚═╝  ╚═╝ ",
	"                                                      ",
}

dashboard.section.buttons.val = {
	dashboard.button("f", "  > Find file", ':lua require("fzf-lua").files()<CR>'),
	dashboard.button("r", "  > Recent", ':lua require("fzf-lua").oldfiles()<CR>'),
	dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}

alpha.setup(dashboard.opts)

vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
