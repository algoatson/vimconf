{
  description = "My Personal Vim config";

  # Input source for our derivation
  inputs = {
    rustaceanvim-src = {
      url = "github:mrcjkb/rustaceanvim";
      flake = false;
    };
     gitlinker-nvim-src = {
      url = "github:linrongbin16/gitlinker.nvim";
      flake = false;
    };

    ferris-nvim-src = {
      url = "github:vxpm/ferris.nvim";
      flake = false;
    };

    magma-nvim-src = {
      url = "github:dccsillag/magma-nvim";
      flake = false;
    };
    vscoq = {
      url = "github:coq-community/vscoq";
      flake = true;
    };
    vscoq-nvim-src = {
      url = "github:tomtomjhj/vscoq.nvim";
      flake = false;
    };

    typst-vim-src = {
      url = "github:kaarmu/typst.vim";
      flake = false;
    };
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    cornelis.url = "github:isovector/cornelis";

    vim-circom-syntax-src = {
      url = "github:iden3/vim-circom-syntax";
      flake = false;
    };

    coq-lsp-nvim-src = {
      url = "github:tomtomjhj/coq-lsp.nvim";
      flake = false;
    };

    lldb-nix-fix = {
      url = "github:mstone/nixpkgs?rev=fa70e7499b08524a4a02e7ce9e39847b9d3c95df";
    };

    vim-illuminate-src = {
      url = "github:RRethy/vim-illuminate";
      flake = false;
    };

    terraform-ls-src = {
      url = "github:hashicorp/terraform-ls";
      flake = false;
    };

    conjure-src = {
      url = "github:Olical/conjure";
      flake = false;
    };

    nil = {
      url = "github:oxalica/nil";
    };

    nix2vim = {
      url = "github:gytis-ivaskevicius/nix2vim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plenary-nvim-src = {
      url = "github:nvim-lua/plenary.nvim";
      flake = false;
    };

    telescope-src = {
      url = "github:nvim-telescope/telescope.nvim";
      flake = false;
    };

    lsp-config-src = {
      url = "github:neovim/nvim-lspconfig";
      flake = false;
    };

    wilder-nvim-src = {
      url = "github:gelguy/wilder.nvim";
      flake = false;
    };
    dracula-nvim = {
      url = "github:Mofiqul/dracula.nvim";
      flake = false;
    };
    gruvbox-nvim-src = {
      url = "github:ellisonleao/gruvbox.nvim";
      flake = false;
    };
    tokyonight-nvim-src = {
      url = "github:folke/tokyonight.nvim";
      flake = false;
    };
    kanagawa-nvim-src = {
      url = "github:rebelot/kanagawa.nvim";
      flake = false;
    };
    nvim-cmp = {
      url = "github:hrsh7th/nvim-cmp";
      flake = false;
    };
    cmp-nvim-lsp = {
      url = "github:hrsh7th/cmp-nvim-lsp";
      flake = false;
    };
    cmp-buffer = {
      url = "github:hrsh7th/cmp-buffer";
      flake = false;
    };
    comment-nvim-src = {
      url = "github:numToStr/Comment.nvim";
      flake = false;
    };
    blamer-nvim-src = {
      url = "github:APZelos/blamer.nvim";
      flake = false;
    };
    telescope-ui-select-src = {
      url = "github:nvim-telescope/telescope-ui-select.nvim";
      flake = false;
    };
    rust-tools-src = {
      url = "github:simrat39/rust-tools.nvim";
      flake = false;
    };
    fidget-src = {
      url = "github:j-hui/fidget.nvim/legacy";
      flake = false;
    };
    neogen-src = {
      url = "github:danymat/neogen";
      flake = false;
    };
    which-key-src = {
      url = "github:folke/which-key.nvim?ref=bd4411a2ed4dd8bb69c125e339d837028a6eea71";
      flake = false;
    };
    conceal-src = {
      url = "github:ticki/rust-cute-vim";
      flake = false;
    };
    colorizer-src = {
      url = "github:powerman/vim-plugin-AnsiEsc";
      flake = false;
    };
    guess-indent-src = {
      url = "github:NMAC427/guess-indent.nvim";
      flake = false;
    };
    leap-src = {
      url = "github:ggandor/leap.nvim";
      flake = false;
    };
    nvim-autopairs-src = {
      url = "github:windwp/nvim-autopairs";
      flake = false;
    };

    nvim-ufo-src = {
      url = "github:kevinhwang91/nvim-ufo";
      flake = false;
    };

    nvim-async-src = {
      url = "github:kevinhwang91/promise-async";
      flake = false;
    };

    # lsp_lines-src = {
    #   url = "git+https://git.sr.ht/~whynothugo/lsp_lines.nvim";
    #   flake = false;
    # };

    markid-src = {
      url = "github:David-Kunz/markid";
      flake = false;
    };

    copilot-lua-src = {
      url = "github:zbirenbaum/copilot.lua";
      flake = false;
    };

    copilot-cmp-src = {
      url = "github:zbirenbaum/copilot-cmp";
      flake = false;
    };

    # copilot-vim-src = {
    #   url = "github:github/copilot.vim";
    #   flake = false;
    # };
    #
    codeium-nvim = {
      url = "github:DieracDelta/codeium.nvim/jr/actually_works";
      flake = true;
    };

    neural-src = {
      url = "github:dense-analysis/neural";
      flake = false;
    };

    nui-nvim-src = {
      url = "github:muniftanjim/nui.nvim";
      flake = false;
    };

    significant-nvim-src = {
      url = "github:elpiloto/significant.nvim";
      flake = false;
    };

    # chatgpt-nvim-src = {
    #   url = "github:jackMort/ChatGPT.nvim";
    #   flake = false;
    # };

    coq-lsp = {
      type = "git";
      url = "https://github.com/ejgallego/coq-lsp/";
      ref = "main";
      submodules = true;
    };

    nvim-dap-src = {
      url = "github:mfussenegger/nvim-dap";
      flake = false;
    };

    nvim-dap-ui-src = {
      url = "github:rcarriga/nvim-dap-ui";
      flake = false;
    };

    nvim-dap-virtual-text-src = {
      url = "github:theHamsta/nvim-dap-virtual-text";
      flake = false;
    };

    telescope-dap-nvim-src = {
      url = "github:nvim-telescope/telescope-dap.nvim";
      flake = false;
    };

    cmp-dap-src = {
      url = "github:rcarriga/cmp-dap";
      flake = false;
    };

    # coq-lsp = {
    #   url = "github:r-muhairi/coq-lsp?ref=48bfb06558816861ca049b771b93f761e5e27fba&submodules=1";
    #   flake = true;
    # };
    node-type-nvim-src = {
      url = "github:roobert/node-type.nvim";
      flake = false;
    };

    # statusline-action-hints-src = {
    #   url = "github:roobert/statusline-action-hints.nvim";
    #   flake = false;
    # };
    neovim = {
      url = "github:neovim/neovim?dir=contrib&rev=e32af31ee89c6a251e8d551a044c7876b9514579";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    floating-input-src = {
      url = "github:liangxianzhe/floating-input.nvim";
      flake = false;
    };

    ts-node-action-src = {
      url = "github:CKolkey/ts-node-action";
      flake = false;
    };

    nvim-trailblazer-src = {
      url = "github:LeonHeidelbach/trailblazer.nvim";
      flake = false;
    };

    nvim-treesitter-src = {
      url = "github:nvim-treesitter/nvim-treesitter";
      flake = false;
    };

    nvim-matchup-src = {
      url = "github:andymass/vim-matchup";
      flake = false;
    };

    quick-scope-src = {
      url = "github:unblevable/quick-scope";
      flake = false;
    };

    telescope-dapzzzz-src = {
      url = "github:HUAHUAI23/telescope-dapzzzz";
      flake = false;
    };

    # sg-nvim-src = {
    #   url = "github:sourcegraph/sg.nvim";
    #   # inputs.pre-commit-nix.follows = "nixpkgs";
    # };

    nvim-github-linker-src = {
      url = "github:vincent178/nvim-github-linker";
      flake = false;
    };

    spacecamp-vim-src = {
      url = "github:jaredgorski/spacecamp";
      flake = false;
    };

    # airline-vim-src = {
    #   url = "github:vim-airline/vim-airline";
    #   flake = false;
    # };

    nerdtree-vim-src = {
      url = "github:preservim/nerdtree";
      flake = false;
    };

    tagbar-src = {
      url = "github:preservim/tagbar";
      flake = false;
    };

    colors150-src = {
      url = "github:luckydev/150colors";
      flake = false;
    };

    vim-markdown-src = {
      url = "github:preservim/vim-markdown";
      flake = false;
    };

    presence-nvim-src = {
      url = "github:andweeb/presence.nvim";
      flake = false;
    };

    morkula-vim-src = {
      url = "github:markjay4k/morkula_theme";
      flake = false;
    };
    godbolt-nvim-src = {
      url = "github:p00f/godbolt.nvim";
      flake = false;
    };

    rose-pine-nvim-src = {
      url = "github:rose-pine/neovim";
      flake = false;
    };

    leetcode-nvim-src = {
      url = "github:kawre/leetcode.nvim";
      flake = false;
    };

    obsidian-nvim-src = {
      url = "github:epwalsh/obsidian.nvim";
      flake = false;
    };

    nvim-tree-src = {
      url = "github:nvim-tree/nvim-tree.lua";
      flake = false;
    };

    nvim-nio-src = {
        url = "github:nvim-neotest/nvim-nio";
        flake = false;
    };

    startup-nvim-src = {
        url = "github:algoatson/startup.nvim";
        flake = false;
    };

    asciiart-nvim-src = {
        url = "github:doctorfree/asciiart.nvim";
        flake = false;
    };

    nvim-gdb-src = {
      url = "github:sakhnik/nvim-gdb";
      flake = false;
    };

    glow-nvim-src = {
      url = "github:ellisonleao/glow.nvim";
      flake = false;
    };

    auto-session-nvim-src = {
      url = "github:rmagatti/auto-session";
      flake = false;
    };

    focus-nvim-src = {
      url = "github:nvim-focus/focus.nvim";
      flake = false;
    };

    competitest-nvim-src = {
      url = "github:xeluxee/competitest.nvim";
      flake = false;
    };

    cphelper-nvim-src = {
      url = "github:p00f/cphelper.nvim";
      flake = false;
    };

    navigator-nvim-src = {
      url = "github:ray-x/navigator.lua";
      flake = false;
    };

    guihua-nvim-src = {
      url = "github:ray-x/guihua.lua";
      flake = false;
    };

    notify-nvim-src = {
      url = "github:rcarriga/nvim-notify";
      flake = false;
    };

    project-nvim-src = {
      url = "github:ahmedkhalf/project.nvim";
      flake = false;
    };

    dirbuf-nvim-src = {
      url = "github:elihunter173/dirbuf.nvim";
      flake = false;
    };

    surround-nvim-src = {
      url = "github:kylechui/nvim-surround";
      flake = false;
    };

    fugitive-vim-src = {
      url = "github:tpope/vim-fugitive";
      flake = false;
    };

    vim-lichess-src = {
      url = "github:luk400/vim-lichess";
      flake = false;
    };

    emoji-nvim-src = {
      url = "github:Allaman/emoji.nvim";
      flake = false;
    };

    cmp-emoji-src = {
      url = "github:hrsh7th/cmp-emoji";
      flake = false;
    };

    cmp-path-src = {
      url = "github:hrsh7th/cmp-path";
      flake = false;
    };

    cmp-cmdline-src = {
      url = "github:hrsh7th/cmp-cmdline";
      flake = false;
    };

    cmp-tabnine-src = {
      url = "github:algoatson/cmp-tabnine";
      flake = false;
    };
  };

  outputs = inputs@{ self, flake-utils, nixpkgs, nix2vim, coq-lsp, neovim, /* sg-nvim-src, */ codeium-nvim, vscoq, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        unappliedPkgs = (neovimArgs: import nixpkgs {
          inherit system;
          overlays = [
            (import ./plugins.nix inputs)
            nix2vim.overlay
            (prev: final:
              {
                inherit neovimArgs;
                codeium-nvim = codeium-nvim.packages.${system}.vimPlugins.codeium-nvim;
                codeium-lsp = codeium-nvim.packages.${system}.codeium-lsp;
                coq-lsp = coq-lsp.packages.${system}.default;
                nvim-master = neovim.packages.${system}.neovim;
                # vscoqlsp = vscoq.packages.${system}.vscoq-language-server;
                vscoqlsp = vscoq.packages.${system}.vscoq-language-server-coq-8-18;
                # sg = sg-nvim-src.packages.${prev.system}.default.overrideAttrs (oldAttrs: {
                #     buildInputs = oldAttrs.buildInputs ++ (if prev.stdenv.isDarwin then [ prev.darwin.apple_sdk.frameworks.Security ] else []);
                #     });
              }
            )
          ];
        });
        neovimConfig = (neovimArgs:
          let pkgs = (unappliedPkgs neovimArgs);
          in
            pkgs.neovimBuilder {
            #  # Build with NodeJS
              withNodeJs = true;
              withPython3 = true;
              package = pkgs.nvim-master;
                  # --suffix PATH : ${pkgs.lib.makeBinPath [ pkgs.sg ]} --suffix LUA_CPATH : ';${pkgs.sg}/lib/libsg_nvim.dylib;${pkgs.sg}/lib/libsg_nvim.so;'
              extraMakeWrapperArgs = ''
                  --suffix PATH : ${pkgs.lib.makeBinPath [ pkgs.coq-lsp pkgs.vscoqlsp ]}
              '';
              imports = [
                ./modules/essentials.nix
                ./modules/lsp.nix
                ./modules/aesthetics.nix
                ./modules/telescope.nix
                ./modules/misc.nix
                ./modules/treesitter.nix
                ./modules/git.nix
                ./modules/jupyter.nix
                ./modules/wilder.nix
                #
                #
                ./modules/agda.nix
                ./modules/autopairs.nix
                ./modules/trailblazer.nix
                ./modules/github.nix
                ./modules/coq.nix

                ./modules/sg.nix

                # ./modules/leap.nix
                # TODO uncomment when
                # https://github.com/Olical/conjure/issues/401
                # this will be quite useful
                # ./modules/repl.nix
              ];
            }
        );
      in
      {
        # The package built by `nix build .`
        defaultPackage = neovimConfig {
          makeOffline = false;
        };
        # The app run by `nix run .`
        apps.defaultApp = {
          type = "app";
          program = "${neovimConfig}/bin/nvim";
        };

        packages.neovimFull = neovimConfig { makeOffline = false; };
        packages.neovimOffline = neovimConfig { makeOffline = true; };
      });
}
