{ pkgs, dsl, ... }:
with dsl; {
  plugins = with pkgs; [
    # dracula
    gruvbox-nvim
    vimPlugins.lualine-nvim
    vimPlugins.tabline-nvim
    vimPlugins.nvim-web-devicons
    node-type-nvim
    vim-circom-syntax
    tokyonight-nvim
    spacecamp-vim
    # airline-vim
    nerdtree-vim
    tagbar-vim
    colors150-vim
    # statusline-action-hints

    # jump to character on line
    # quick-scope
  ];

  # autocmd ColorScheme * highlight QuickScopePrimary guifg='#ff0000' guibg='#0000ff' ctermfg='196'
  # autocmd ColorScheme * highlight QuickScopeSecondary guifg='#880000' guibg='#000088' gui=underline ctermfg='196'
  # set smartindent
  vimscript = ''
    set background=dark
    colorscheme tokyonight-night
    filetype plugin indent on
    syntax on

    noremap <F4> :NERDTreeToggle <cr>
    noremap <F1> :mksession! .vim.session <cr>
    noremap <F2> :source .vim.session <cr>
    noremap <F3> :! rm .vim.session <cr>
    noremap <F8> :TagbarToggle <cr>
    set listchars=tab:>-
    set fo+=t
    set t_Co=256
    set nocursorline
    set title
    set bs=2
    set noautoindent
    set ruler
    set shortmess=aoOTI
    set nocompatible
    set showmode
    set splitbelow
    set showcmd
    set showmatch
    set tabstop=2
    set shiftwidth=2
    set expandtab
    set cinoptions=(0,m1,:1
    set formatoptions=tcqro2
    set laststatus=2
    set softtabstop=2
    set sidescroll=5
    set scrolloff=4
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase
    set foldmethod=marker
    set ttyfast
    set history=10000
    set hidden
    set number
    set complete=.,w,b,u,t
    set completeopt=longest,menuone,preview
    set noswapfile
    set foldlevelstart=0
    set wildmenu
    set wildmode=list:longest,full
    set wrap
    set statusline=%{getcwd()}\/\%f%=%-14.(%l,%c%V%)\ %P
    set autoread
    set conceallevel=2
    set concealcursor=vin
    let g:tagbar_ctags_bin='/nix/store/m59b6lwf5hhg17y3jnm3sj1dg389rmsi-universal-ctags-6.0.0/bin/ctags'
    let g:airline#extensions#tabline#enabled = 1

  '';
     # autocmd ColorScheme * highlight Comment guifg='#ff0000'

  setup.tabline.show_index = false;

  setup.node-type = {};

  lua = ''
    require("tokyonight").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      light_style = "day", -- The theme is used when the background is set to light
      transparent = false, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },
      sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead.
      dim_inactive = false, -- dims inactive windows
      lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

      --- You can override specific color groups to use other groups or a hex color
      --- function will be called with a ColorScheme table
      ---@param colors ColorScheme
      on_colors = function(colors) end,

      --- You can override specific highlights to use other groups or a hex color
      --- function will be called with a Highlights and ColorScheme table
      ---@param highlights Highlights
      ---@param colors ColorScheme
      on_highlights = function(highlights, colors) end,

    })
  '';
  # setup.statusline-action-hints = {
  #     definition_identifier = "gd";
  #     template = "%s ref:%s";
  # };
/*
  lua = ''

 require("gruvbox").setup({
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "",  -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {
        SignColumn = { link = "Normal" },
        GruvboxGreenSign = { bg = "" },
        GruvboxOrangeSign = { bg = "" },
        GruvboxPurpleSign = { bg = "" },
        GruvboxYellowSign = { bg = "" },
        GruvboxRedSign = { bg = "" },
        GruvboxBlueSign = { bg = "" },
        GruvboxAquaSign = { bg = "" },
        TelescopeSelection = { link = "Visual" },
        ["@variable"] = { link = "GruvboxBlue" },
        TermCursor = { bg = "#fabd2f", fg = "#282828" },
        Visual = {bg = "#d79921", fg = "#282828"},
        Linenr = {fg = "#7c6f64", bg = ""},
        debugPC = {fg = "", bg = "#3d4220"},
        DapBreakpoint = {fg = "", bg = "#472322"},
        DapBreakpointSymbol = {bg = ""}
      },
      dim_inactive = false,
      transparent_mode = false,
    })

  '';*/
  setup.lualine = {
    options = {
      component_separators = {
        left = "";
        right = "";
      };
      section_separators = {
        left = "";
        right = "";
      };
      globalstatus = true;
    };
    sections = {
      lualine_a = [ "mode" ];
      lualine_b = [ "branch" "diff" "diagnostics" ];
      lualine_c = [ "filename" ];
      # lualine_x = [/* (rawLua "require(\"statusline-action-hints\").statusline") */ (rawLua "require(\"node-type\").statusline") "encoding" "fileformat" ];
      lualine_z = [ "location" ];
    };
    tabline = { };
    extensions = { };
  };
}
