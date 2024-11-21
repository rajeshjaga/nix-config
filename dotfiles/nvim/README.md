# rajeshjaga/nvim

My Neovim config

![ss-home](./asset/SS-Home.png)

### LSP&  Autocomplete

This lsp configuration should support most of the languages (rust, c, js, ts, css, html, python, tailwindcss, lua, go, bash, sh)

If any language lsp is missing, try installing the respective lsp using mason cmd
- `:MasonInstall bash-language-server` : for bash lsp

If unsure of what to install, try going through mason's list of lsp, dap, linter, formatter
- `:Mason` should open a popup with all the plugins list

Langauages with lsp support should have already have autosuggestion/auto-complete.

### Colorscheme

I like catppuccin-mocha with transaparency, should look exactly like above screenshot (note: acrylic background was made with windows terminal)

To change the colorscheme try changing the `lua/lucifer/colorscheme.lua` file


### Miscellaneous

- Added `which-key.nvim` to display hints on the key chords/binds.
- To access the project files we are using `neotree`(use Ctrl-n).
- tabstop, shiftwidth, softabstop is taken care by `vim-sleuth`
- try `:VimBeGood` to practice the key binds
- there is indentline to show the scriptblock
- harpoon to access files blazingly fast
- to comment/uncomment  highlight and then `gc`
- to manually format current buffer try `leader + f`
- auto closing tags(html,jsx,tsx)
- use leader + c to enable color preview in the buffer
- use jj to exit the insert mode
- use tt to exit a terminal insert mode
- install nodejs, then `npm i -g neovim tree-sitter-cli` to install treesitter, add lsp support.
- install python, then `pip install neovim`, on linux `sudo pacman -S python-neovim` for python support
- install gcc/zig, ripgrep, tar/unzip, wget/curl, luarocks on windows or linux
