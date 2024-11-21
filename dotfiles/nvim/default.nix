{ pkgs, config, ...}:
{
        programs ={
                gh.enable = true;
                neovim = {
                        enable = true;
                        defaultEditor = true;
                        viAlias = true;
                        vimAlias = true;
                        vimdiffAlias = true;
                        withNodeJs = true;
                        extraPackages = with pkgs; [
                                #system tools
                                xclip
                                wl-clipboard
                                fd
                                #lsp tools
                                lua-language-server
                                gopls
                                nodePackages.bash-language-server
                                luajitPackages.lua-lsp
                                rust-analyzer
                                pyright
                                nodePackages.neovim
                                black
                                stylua
                                prettierd
                                # nix
                                nil
                                statix
                        ];
			plugins = ( with pkgs.vimPlugins; [
				oil-nvim
				nvim-lspconfig
				mason-nvim
				mason-lspconfig-nvim
				mason-tool-installer-nvim
				fidget-nvim
				neodev-nvim
				nvim-cmp
				nvim-lint
				rose-pine
				{
					plugin = indent-blankline-nvim;
					type = "lua";
					config = ''require('ibl').setup()'';
				}
				which-key-nvim
                                vim-sleuth
                                nvim-colorizer-lua
                                harpoon2
                                alpha-nvim
                                nvim-web-devicons
                                lualine-nvim
                                {
                                        plugin = lualine-nvim;
                                        type = "lua";
                                        config = ''
                                require("lualine").setup({icon_enabled=true,theme='dracula'})
                                        '';
                                }
                                telescope-nvim
                                plenary-nvim
                                bufferline-nvim
                                telescope-ui-select-nvim
			]);
                        extraLuaConfig = ''
                                ${builtins.readFile ./lua/options.lua}
                                ${builtins.readFile ./lua/autocmd.lua}
                                ${builtins.readFile ./lua/keybinds.lua}
                                ${builtins.readFile ./lua/lucifer/oil.lua}
				${builtins.readFile ./lua/lucifer/rose-pine.lua}
                                ${builtins.readFile ./lua/lucifer/whichkey.lua}
                                ${builtins.readFile ./lua/lucifer/harpoon.lua}
                                ${builtins.readFile ./lua/lucifer/homescreen.lua}
                                ${builtins.readFile ./lua/lucifer/telescope.lua}
                                ${builtins.readFile ./lua/lucifer/bufferline.lua}
                                --require(lualine).setup({icon_enabled=true,theme='dracula'})
                        '';
                };
        };
}
