local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	"████     ███                       ███         ███                  ",
	"██ ███   ███                        ███       ███   ██              ",
	"███ ███  ███    ███        ███       ███     ███       ████ ███ ███ ",
	"███  ███ ███  ██   ███   ███  ███     ███   ███    ███  ███  ██  ███",
	"███   ██ ███ █████████  ███    ███     ███ ███     ███  ███  ██  ███",
	"███    ██ ██ ██          ███  ███       █████      ███  ███  ██  ███",
	"███      ███   █████       ███           ███       ███ ████  ██  ███",
	"                                                                    ",
}

dashboard.section.buttons.val = {
	dashboard.button("e", "📄 Nuevo archivo", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "🔍 Buscar archivo", ":Telescope find_files<CR>"),
	dashboard.button("r", "📂 Recientes", ":Telescope oldfiles<CR>"),
	dashboard.button("s", "🔑 Configuración", ":e ~/.config/nvim/<CR>"),
	dashboard.button("q", "🚪 Salir", ":qa<CR>"),
}

dashboard.section.footer.val = {}

alpha.setup(dashboard.config)
