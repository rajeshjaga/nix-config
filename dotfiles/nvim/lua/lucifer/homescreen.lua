local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  [[                                                      ]],
  [[   ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ]],
  [[   ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ]],
  [[  ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ]],
  [[  ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ]],
  [[  ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ]],
  [[  ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ]],
  [[  ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ]],
  [[     ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ]],
  [[           ░    ░  ░    ░ ░        ░   ░         ░    ]],
  [[                                  ░                   ]],
}

dashboard.section.buttons.val = {
  dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
  dashboard.button( "f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
  dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
  dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
  dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

local function footer ()
  return "Things work out, but I don't"
end

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.val="Type"
dashboard.section.header.opts.val="Include"
dashboard.section.buttons.opts.val="Keyword"

alpha.setup(dashboard.opts)

vim.cmd([[autocmd FileType alpha setlocal nofoldenable ]])
