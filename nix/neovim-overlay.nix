# This overlay, when applied to nixpkgs, adds the final neovim derivation to nixpkgs.
{inputs}: final: prev:
with final.pkgs.lib; let
  pkgs = final;

  # Use this to create a plugin from a flake input
  mkNvimPlugin = src: pname:
    pkgs.vimUtils.buildVimPlugin {
      inherit pname src;
      version = src.lastModifiedDate;
    };

  # Make sure we use the pinned nixpkgs instance for wrapNeovimUnstable,
  # otherwise it could have an incompatible signature when applying this overlay.
  pkgs-wrapNeovim = inputs.nixpkgs.legacyPackages.${pkgs.system};

  # This is the helper function that builds the Neovim derivation.
  mkNeovim = pkgs.callPackage ./mkNeovim.nix { inherit pkgs-wrapNeovim; };

  all-plugins =
    let
      start = x: {plugin = x; optional = false;};
      opt = x: {plugin = x; optional = true;};
      luaconfig = x: {config = "lua <<EOF\n" + x + "\nEOF\n";};
      treesitter =
      (pkgs.vimPlugins.nvim-treesitter.withPlugins
       (p: with p; [
        bash
        c
        go
        lua
        nix
        norg
        python
        typescript
       ]));
       neoclip = inputs.neoclip.packages.${pkgs.system}.default;
       vim-kitty = mkNvimPlugin inputs.vim-kitty "vim-kitty";
     in
     with pkgs.vimPlugins; [

     (start lze) # lazy-load plugins https://github.com/BirdeeHub/lze
     (start treesitter)

     # adds around 50ms to startup time
     (start catppuccin-nvim)
     lualine-nvim # Status line | https://github.com/nvim-lualine/lualine.nvim/

     (start nvim-luadev) # nvim lua repl  https://github.com/bfredl/nvim-luadev

     (opt fzf-lua) # https://github.com/ibhagwan/fzf-lua

     (start mini-nvim) # https://github.com/echasnovski/mini.nvim
     (start snacks-nvim) # https://github.com/folke/snacks.nvim
     (start which-key-nvim)

     (start noice-nvim)
     # ((opt noice-nvim) // # https://github.com/folke/noice.nvim
     #  (luaconfig /* lua */ ''
     #      require('lze').load({
     #        "noice-nvim",
     #        keys = {':', '/', '?'},
     #        after = function () require'plugins.noice' end
     #        -- after = function() vim.notify('noice11') end
     #      })
     #  ''))

      gitsigns-nvim # https://github.com/lewis6991/gitsigns.nvim/
      statuscol-nvim # Status column | https://github.com/luukvbaal/statuscol.nvim/

      # https://github.com/nmac427/guess-indent.nvim/
      ((opt guess-indent-nvim) //
       (luaconfig /* lua */ ''
         require('lze').load({
           "guess-indent.nvim",
           event = 'DeferredUIEnter',
           after = function() require('guess-indent').setup() end
         })
       ''))

      leap-nvim vim-repeat # https://github.com/ggandor/leap.nvim

      # https://github.com/nvim-neorg/neorg
      ((start neorg) // # load on start, and setup after ui ready
       (luaconfig /* lua */ ''
         require('lze').load({
           "neorg",
           event = 'DeferredUIEnter',
           after = function() require('user.neorg') end
         })
       ''))

      neoclip # https://github.com/matveyt/neoclip

      vim-kitty # https://github.com/fladson/vim-kitty
  ];

  extraPackages = with pkgs; [
    # language servers, etc.
    lua-language-server
    nil # nix LSP
    gopls # go lsp
    basedpyright # python lsp
  ];
in {
  # This is the neovim derivation
  # returned by the overlay
  nvim-shovel = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
  };

  # This can be symlinked in the devShell's shellHook
  nvim-luarc-json = final.mk-luarc-json {
    plugins = all-plugins;
  };

  # You can add as many derivations as you like.
  # Use `ignoreConfigRegexes` to filter out config
  # files you would not like to include.
  #
  # For example:
  #
  # nvim-pkg-no-telescope = mkNeovim {
  #   plugins = [];
  #   ignoreConfigRegexes = [
  #     "^plugin/telescope.lua"
  #     "^ftplugin/.*.lua"
  #   ];
  #   inherit extraPackages;
  # };
}
