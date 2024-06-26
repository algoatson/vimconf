inputs: final: prev:
let
  withSrc = pkg: src: pkg.overrideAttrs (_: { inherit src; });
  plugin = pname: src: prev.vimUtils.buildVimPlugin {
    inherit pname src;
    version = "master";
  };
in
with inputs; {
  #
  # sg = sg-nvim-src.packages.${prev.system}.default.overrideAttrs (oldAttrs: {
  #   buildInputs = oldAttrs.buildInputs ++ (if prev.stdenv.isDarwin then [ prev.darwin.apple_sdk.frameworks.Security ] else []);
  # });

  #codeium-lsp = with prev;
  #  stdenv.mkDerivation {
  #    pname = "codeium-lsp";
  #    version = "v1.8.9";


  #    src =
  #    if prev.stdenv.isDarwin then
  #    fetchurl {
  #      url = "https://github.com/Exafunction/codeium/releases/download/language-server-v1.8.9/language_server_macos_arm";
  #      sha256 = "sha256-9rEd/87gjNMbgOh2luP68Kd6+20zuA3O83Ma42rmd5Y=";
  #    }
  #    else
  #    fetchurl {
  #      url = "https://github.com/Exafunction/codeium/releases/download/language-server-v1.8.9/language_server_linux_x64";
  #      sha256 = "sha256-YzQV5w/p0X+KHUU6sL3Djc2En/3pex5Iht7Er7U4UHY=";
  #    };

   #   nativeBuildInputs = [
   #     stdenv.cc.cc
   #   ] ++ (if !prev.stdenv.isDarwin then [autoPatchelfHook] else []);
#
#      installPhase = ''
#        mkdir -p $out/bin
#        install -m755 $src $out/bin/codeium-lsp
#      '';
#      phases = ["installPhase" "fixupPhase"];
#    };

  terraform-ls = with prev;
    (buildGoModule rec {
      pname = "terraform-ls";
      version = "0.27.0";

      src = fetchFromGitHub {
        owner = "hashicorp";
        repo = pname;
        rev = "v${version}";
        sha256 = "sha256-TWxYCHdzeJtdyPajA3XxqwpDufXnLod6LWa28OHjyms=";
      };

      vendorHash = "sha256-e/m/8h0gF+kux+pCUqZ7Pw0XlyJ5dL0Zyqb0nUlgfpc=";
      ldflags = [ "-s" "-w" "-X main.version=v${version}" "-X main.prerelease=" ];

      # There's a mixture of tests that use networking and several that fail on aarch64
      doCheck = false;

      doInstallCheck = true;
      installCheckPhase = ''
        runHook preInstallCheck
        $out/bin/terraform-ls --help
        $out/bin/terraform-ls version | grep "v${version}"
        runHook postInstallCheck
      '';

      meta = with lib; {
        description = "Terraform Language Server (official)";
        homepage = "https://github.com/hashicorp/terraform-ls";
        changelog = "https://github.com/hashicorp/terraform-ls/blob/v${version}/CHANGELOG.md";
        license = licenses.mpl20;
        maintainers = with maintainers; [ mbaillie jk ];
      };
    });

  nil = inputs.nil.packages.${prev.system}.nil;

  cornelis-vim = inputs.cornelis.packages.${prev.system}.cornelis-vim;

  telescope-nvim = (withSrc prev.vimPlugins.telescope-nvim inputs.telescope-src);
  cmp-buffer = (withSrc prev.vimPlugins.cmp-buffer inputs.cmp-buffer);
  nvim-cmp = (withSrc prev.vimPlugins.nvim-cmp inputs.nvim-cmp);

  cmp-nvim-lsp = withSrc prev.vimPlugins.cmp-nvim-lsp inputs.cmp-nvim-lsp;

  # Packaging plugins with Nix
  blamer-nvim = plugin "blamer-nvim" blamer-nvim-src;
  colorizer = plugin "colorizer" colorizer-src;
  comment-nvim = plugin "comment-nvim" comment-nvim-src;
  conceal = plugin "conceal" conceal-src;
  dracula = plugin "dracula" dracula-nvim;
  gruvbox-nvim = plugin "gruvbox-nvim" gruvbox-nvim-src;
  tokyonight-nvim = plugin "tokyonight-nvim" tokyonight-nvim-src;
  kanagawa-nvim = plugin "kanagawa-nvim" kanagawa-nvim-src;
  fidget = plugin "fidget" fidget-src;
  neogen = plugin "neogen" neogen-src;
  parinfer-rust-nvim = plugin "parinfer-rust" prev.parinfer-rust;
  rust-tools = plugin "rust-tools" rust-tools-src;
  telescope-ui-select = plugin "telescope-ui-select" telescope-ui-select-src;
  which-key = plugin "which-key" which-key-src;
  guess-indent = plugin "guess-indent" guess-indent-src;
  leap = plugin "leap" leap-src;
  wilder-nvim = plugin "wilder-nvim" wilder-nvim-src;
  plenary-nvim = plugin "plenary-nvim" plenary-nvim-src;
  nvim-autopairs = plugin "nvim-autopairs" nvim-autopairs-src;
  vim-illuminate = plugin "vim-illuminate" vim-illuminate-src;
  nvim-ufo = plugin "nvim-ufo" nvim-ufo-src;
  nvim-async = plugin "nvim-async" nvim-async-src;
  conjure = plugin "conjure" conjure-src;
  lsp-config = plugin "lsp-config" lsp-config-src;
  # lsp_lines = plugin "lsp_lines" lsp_lines-src;
  markid = plugin "markid" markid-src;

  copilot-lua = plugin "copilot-lua" copilot-lua-src;
  copilot-cmp = plugin "copilot-cmp" copilot-cmp-src;
  copilot-vim = plugin "copilot-vim" copilot-vim-src;

  codeium-nvim = plugin "codeium-nvim" codeium-nvim-src;

  neural = plugin "neural" neural-src;

  nui-nvim = plugin "nui-nvim" nui-nvim-src;

  significant-nvim = plugin "significant-nvim" significant-nvim-src;

  # chatgpt-nvim = plugin "chatgpt-nvim" chatgpt-nvim-src;

  myRSetup = ( prev.rWrapper.override{ packages = with prev.rPackages; [ /* vscDebugger */ ggplot2 dplyr xts languageserver ]; });

  nvim-dap = plugin "nvim-dap" nvim-dap-src;

  code-lldb = lldb-nix-fix.legacyPackages.${prev.system}.vscode-extensions.vadimcn.vscode-lldb;

  nvim-dap-virtual-text = plugin "nvim-dap-virtual-text" nvim-dap-virtual-text-src;

  nvim-dap-ui = plugin "nvim-dap-ui" nvim-dap-ui-src;

  telescope-dap-nvim = plugin "telescope-dap-nvim" telescope-dap-nvim-src;

  cmp-dap = plugin "cmp-dap" cmp-dap-src;

  node-type-nvim = plugin "node-type-nvim" node-type-nvim-src;

  floating-input = plugin "floating-input" floating-input-src;

  ts-node-action = plugin "ts-node-action" ts-node-action-src;

  nvim-trailblazer = plugin "nvim-trailblazer" nvim-trailblazer-src;

  quick-scope = plugin "quick-scope" quick-scope-src;

  telescope-dapzzzz = plugin "telescope-dapzzzz" telescope-dapzzzz-src;

  nvim-treesitter = plugin "nvim-treesitter" nvim-treesitter-src;

  # sg-nvim = plugin "sg-nvim" sg-nvim-src;

  nvim-matchup = plugin "nvim-matchup" nvim-matchup-src;

  coq-lsp-nvim = plugin "coq-lsp-nvim" coq-lsp-nvim-src;
  typst-vim = plugin "typst-vim" typst-vim-src;

  vim-circom-syntax = plugin "vim-circom-syntax" vim-circom-syntax-src;

  vscoq-nvim = plugin "vscoq-nvim" vscoq-nvim-src;

  magma-nvim = plugin "magma-nvim" magma-nvim-src;

  rustaceanvim = plugin "rustaceanvim" rustaceanvim-src;

  ferris-nvim = plugin "ferris-nvim" ferris-nvim-src;

  gitlinker-nvim = plugin "gitlinker-nvim" gitlinker-nvim-src;

  spacecamp-vim = plugin "spacecamp-vim" spacecamp-vim-src;
  # airline-vim = plugin "airline-vim" airline-vim-src;
  nerdtree-vim = plugin "nerdtree-vim" nerdtree-vim-src;
  tagbar-vim = plugin "tagbar-vim" tagbar-src;
  colors150-vim = plugin "colors150-vim" colors150-src;
  vim-markdown = plugin "vim-markdown" vim-markdown-src;
  presence-nvim = plugin "presence-nvim" presence-nvim-src;
  morkula-vim = plugin "morkula-vim" morkula-vim-src;
  godbolt-nvim = plugin "godbolt-nvim" godbolt-nvim-src;
  rose-pine-nvim = plugin "rose-pine-nvim" rose-pine-nvim-src;
  leetcode-nvim = plugin "leetcode-nvim" leetcode-nvim-src;
  obsidian-nvim = plugin "obsidian-nvim" obsidian-nvim-src;
  nvim-tree = plugin "nvim-tree" nvim-tree-src;
  nvim-nio = plugin "nvim-nio" nvim-nio-src;
  startup-nvim = plugin "startup-nvim" startup-nvim-src;
  asciiart-nvim = plugin "asciiart-nvim" asciiart-nvim-src;
  nvim-gdb = plugin "nvim-gdb" nvim-gdb-src;
  glow-nvim = plugin "glow-nvim" glow-nvim-src;
  auto-session-nvim = plugin "auto-session-nvim" auto-session-nvim-src;
  focus-nvim = plugin "focus-nvim" focus-nvim-src;
  competitest-nvim = plugin "competitest-nvim" competitest-nvim-src;
  cphelper-nvim = plugin "cphelper-nvim" cphelper-nvim-src;
  navigator-nvim = plugin "navigator-nvim" navigator-nvim-src;
  guihua-nvim = plugin "guihua-nvim" guihua-nvim-src;
  notify-nvim = plugin "notify-nvim" notify-nvim-src;
  project-nvim = plugin "project-nvim" project-nvim-src;
  dirbuf-nvim = plugin "dirbuf-nvim" dirbuf-nvim-src;
  surround-nvim = plugin "surround-nvim" surround-nvim-src;
  fugitive-vim = plugin "fugitive-vim" fugitive-vim-src;
  vim-lichess = plugin "vim-lichess" vim-lichess-src;
  emoji-nvim = plugin "emoji-nvim" emoji-nvim-src;
  cmp-emoji = plugin "cmp-emoji" cmp-emoji-src;
  cmp-path = plugin "cmp-path" cmp-path-src;
  cmp-cmdline = plugin "cmp-cmdline" cmp-cmdline-src;
  cmp-tabnine = plugin "cmp-tabnine" cmp-tabnine-src;
# statusline-action-hints = plugin "statusline-action-hints" statusline-action-hints-src;

}
