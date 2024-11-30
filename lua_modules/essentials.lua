vim.g.rustfmt_autosave = true
vim.g.diagnostics_visible = true
vim.g.inlay_hints_visible = true
-- perl bad
vim.g.loaded_perl_provider = 0
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.nofoldenable = true
vim.g.noshowmode = true
vim.g.completeopt = "menu,menuone,noselect"
vim.g.noswapfile = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.showcmd = true
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.wrap = true
vim.o.autoindent = true
vim.o.copyindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.title = true
vim.o.undofile = true
vim.o.autoread = true
vim.o.hidden = true
vim.o.list = true
vim.o.background = "dark"
vim.o.backspace = "indent,eol,start"
vim.o.undolevels = 1000000
vim.o.undoreload = 1000000
vim.o.foldmethod = "indent"
vim.o.foldnestmax = 10
vim.o.scrolloff = 3
vim.o.sidescrolloff = 5
vim.o.listchars = "tab:→→,trail:●,nbsp:○"
vim.o.formatoptions = "tcqj"
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.fileencodings = "utf-8"
vim.o.bomb = true
vim.o.binary = true
vim.o.matchpairs = "(:),{:},[:],<:>"
vim.o.expandtab = true
vim.o.wildmode = "list:longest,list:full"
-- for nvim-ufo
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

require("oil").setup({
  default_file_explorer = true,

  columns = {
    "icon",
    "permissions",
    "size",
    "mtime"
  },

  -- Buffer-local options to use for oil buffers
  buf_options = {
    buflisted = false,
    bufhidden = "hide",
  },
  -- Window-local options to use for oil buffers
  win_options = {
    wrap = false,
    signcolumn = "no",
    cursorcolumn = false,
    foldcolumn = "0",
    spell = false,
    list = false,
    conceallevel = 3,
    concealcursor = "nvic",
  },
  -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
  delete_to_trash = false,
  -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
  skip_confirm_for_simple_edits = false,
  -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
  -- (:help prompt_save_on_select_new_entry)
  prompt_save_on_select_new_entry = true,
  -- Oil will automatically delete hidden buffers after this delay
  -- You can set the delay to false to disable cleanup entirely
  -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
  cleanup_delay_ms = 2000,
  lsp_file_methods = {
    -- Enable or disable LSP file operations
    enabled = true,
    -- Time to wait for LSP file operations to complete before skipping
    timeout_ms = 1000,
    -- Set to true to autosave buffers that are updated with LSP willRenameFiles
    -- Set to "unmodified" to only save unmodified buffers
    autosave_changes = false,
  },
  -- Constrain the cursor to the editable parts of the oil buffer
  -- Set to `false` to disable, or "name" to keep it on the file names
  constrain_cursor = "editable",
  -- Set to true to watch the filesystem for changes and reload oil
  watch_for_changes = false,
  -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
  -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
  -- Additionally, if it is a string that matches "actions.<name>",
  -- it will use the mapping at require("oil.actions").<name>
  -- Set to `false` to remove a keymap
  -- See :help oil-actions for a list of all available actions
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
    ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
    ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = "actions.close",
    ["<C-l>"] = "actions.refresh",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["`"] = "actions.cd",
    ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory", mode = "n" },
    ["gs"] = "actions.change_sort",
    ["gx"] = "actions.open_external",
    ["g."] = "actions.toggle_hidden",
    ["g\\"] = "actions.toggle_trash",
  },
  -- Set to false to disable all of the above keymaps
  use_default_keymaps = true,
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = false,
    -- This function defines what is considered a "hidden" file
    is_hidden_file = function(name, bufnr)
      local m = name:match("^%.")
      return m ~= nil
    end,
    -- This function defines what will never be shown, even when `show_hidden` is set
    is_always_hidden = function(name, bufnr)
      return false
    end,
    -- Sort file names with numbers in a more intuitive order for humans.
    -- Can be "fast", true, or false. "fast" will turn it off for large directories.
    natural_order = "fast",
    -- Sort file and directory names case insensitive
    case_insensitive = false,
    sort = {
      -- sort order can be "asc" or "desc"
      -- see :help oil-columns to see which columns are sortable
      { "type", "asc" },
      { "name", "asc" },
    },
    -- Customize the highlight group for the file name
    highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
      return nil
    end,
  },
  -- Extra arguments to pass to SCP when moving/copying files over SSH
  extra_scp_args = {},
  -- EXPERIMENTAL support for performing file operations with git
  git = {
    -- Return true to automatically git add/mv/rm files
    add = function(path)
      return false
    end,
    mv = function(src_path, dest_path)
      return false
    end,
    rm = function(path)
      return false
    end,
  },
  -- Configuration for the floating window in oil.open_float
  float = {
    -- Padding around the floating window
    padding = 2,
    max_width = 0,
    max_height = 0,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
    -- optionally override the oil buffers window title with custom function: fun(winid: integer): string
    get_win_title = nil,
    -- preview_split: Split direction: "auto", "left", "right", "above", "below".
    preview_split = "auto",
    -- This is the config that will be passed to nvim_open_win.
    -- Change values here to customize the layout
    override = function(conf)
      return conf
    end,
  },
  -- Configuration for the file preview window
  preview_win = {
    -- Whether the preview window is automatically updated when the cursor is moved
    update_on_cursor_moved = true,
    -- How to open the preview window "load"|"scratch"|"fast_scratch"
    preview_method = "fast_scratch",
    -- A function that returns true to disable preview on a file e.g. to avoid lag
    disable_preview = function(filename)
      return false
    end,
    -- Window-local options to use for preview window buffers
    win_options = {},
  },
  -- Configuration for the floating action confirmation window
  confirmation = {
    -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_width and max_width can be a single value or a list of mixed integer/float types.
    -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
    max_width = 0.9,
    -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
    min_width = { 40, 0.4 },
    -- optionally define an integer/float for the exact width of the preview window
    width = nil,
    -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_height and max_height can be a single value or a list of mixed integer/float types.
    -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
    max_height = 0.9,
    -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
    min_height = { 5, 0.1 },
    -- optionally define an integer/float for the exact height of the preview window
    height = nil,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
  },
  -- Configuration for the floating progress window
  progress = {
    max_width = 0.9,
    min_width = { 40, 0.4 },
    width = nil,
    max_height = { 10, 0.9 },
    min_height = { 5, 0.1 },
    height = nil,
    border = "rounded",
    minimized_border = "none",
    win_options = {
      winblend = 0,
    },
  },
  -- Configuration for the floating SSH window
  ssh = {
    border = "rounded",
  },
  -- Configuration for the floating keymaps help window
  keymaps_help = {
    border = "rounded",
  },
})

local wk = require("which-key")
wk.setup()

wk.register({
  ["<leader>"] = {
    ai = { "<cmd>AnsiEsc<cr>", "Replace ansi escape codes with colors" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Jump to Declaration" },
    d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Jump to Definition" },
    i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Jump to Implementation" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Get function signature" },
    u = { "<cmd>UndotreeToggle<CR>", "Trigger UndoTree" },
    yg = { "<cmd> GitLink<CR>", "Link to git url" },
    yb = { "<cmd> GitLink blame<CR>", "Link to git blame" },
    k = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Get type definition" },
    rn = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename function/variable" },
    ca = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Perform code action" },
    r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Get function/variable refs" },
    e = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Get lsp errors" },
    dn = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "next diag" },
    dp = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "prev diag" },
    mb = { ":VimtexCompile<CR>", "build latex buffer" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format buffer" },
    bb = { "<cmd>Telescope buffers<cr>", "Get buffer list" },
    fb = { "<cmd>Telescope file_browser<cr>", "Get buffer list" },
    gg = { "<cmd>Telescope live_grep<cr>", "Fzf fuzzy search" },
    gp = { "<cmd>Telescope projects<cr>", "Show recent projects" },
    ph = { "<cmd>Telescope find_files<cr>", "Find project files" },
    tt = { "<cmd>Telescope<cr>", "Open telescope" },
    tk = { "<cmd>Telescope keymaps<cr>", "Telescope keymaps" },
    ee = { "<cmd>InsertEmoji<cr>", "Telescope Emojis" },
    os = { "<cmd>ObsidianQuickSwitch<cr>", "Obsidian Quick Switch" },
    ['<leader>'] = { "<cmd>Telescope find_files<cr>", "search files" },
    n = { "<cmd>lua require(\"sg.telescope\").fuzzy_search_results()<CR>", "sourcegraph search" },
    ws = { "<cmd>sp<cr>", "Split window horizontally" },
    wv = { "<cmd>vs<cr>", "Split window vertically" },
    bd = { "<cmd>q<cr>", "Delete buffer" },
    bn = { "<cmd>bnext<cr>", "Next buffer" },
    bp = { "<cmd>bprev<cr>", "Previous buffer" },
    bN = { "<cmd>tabedit<cr>", "New buffer/tab" },
    bD = { "<cmd>Bclose!<cr>", "Delete buffer aggressively" },
    wd = { "<cmd>q<cr>", "Delete window" },
    wl = { "<cmd>wincmd l<cr>", "Move window right" },
    wj = { "<cmd>wincmd j<cr>", "Move window down" },
    wk = { "<cmd>wincmd k<cr>", "Move window up" },
    wh = { "<cmd>wincmd h<cr>", "Move window left" },
    we = { "<cmd>wincmd w<cr>", "Focus main window" },
    wf = { "<cmd>NvimTreeFocus<cr>", "Focus Nvim Tree" },
    gs = { "<cmd>lua require('neogit').open()<CR>", "Open neogit (magit clone)" },
    gb = { "<cmd>BlamerToggle<CR>", "Toggle git blame" },
    gc = { "<cmd>Neogen<CR>", "generate comments boilerplate" },
    gd = { "<cmd>GodboltCompiler telescope<CR>", "Godbolt Compiler" },
    l = { "<cmd>Telescope resume<CR>", "last telescope query" },
    gf = { "<cmd>lua require('telescope.builtin').live_grep {default_text='function|fn|func|def'}<CR>", "grep for functions only" },
    hs = { "<cmd>Gitsigns preview_hunk<CR>", "preview hunk" },
    hn = { "<cmd>Gitsigns next_hunk<CR>", "next hunk" },
    hp = { "<cmd>Gitsigns prev_hunk<CR>", "prev hunk" },
    rl = { "<cmd> lua require('ferris.methods.view_memory_layout')()<CR>", "View memory layout" },
    rhi = { "<cmd> lua require('ferris.methods.view_hir')()<CR>", "View MIR" },
    rmi = { "<cmd> lua require('ferris.methods.view_mir')()<CR>", "View MIR" },
    rb = { "<cmd> lua require('ferris.methods.rebuild_macros')()<CR>", "Rebuild macros" },
    rm = { "<cmd>lua vim.cmd.RustLsp('expandMacro')<CR>", "Expand macro" },
    rh = { "<cmd>lua toggle_inlay_hints()<CR>", "toggle inlay type hints" },
    rpm = { "cmd lua vimd.cmd.RustLsp('parentModule')<CR>", "go to parent module" },
    rJ = { "cmd lua vim.cmd.RustLsp('joinLines')<CR>", "join lines rust" },

    -- crates.nvim
    ct = { "<cmd>lua require('crates').toggle()<CR>", "enable or disable UI elements" },
    cr = { "<cmd>lua require('crates').reload()<CR>", "reload data (clears cache)" },
    cS = { "<cmd>lua require('crates').show_popup()<CR>", "show/hide popup with crate details, all versions, all features or details about one feature." },
    cv = { "<cmd>lua require('crates').show_versions_popup()<CR>", "same as crates.show_popup() but always show versions" },
    cf = { "<cmd>lua require('crates').show_features_popup()<CR>", "same as crates.show_popup() but always show features or features details." },
    cd = { "<cmd>lua require('crates').show_dependencies_popup()<CR>", "same as crates.show_popup() but always show dependencies." },
    cu = { "<cmd>lua require('crates').update_crate()<CR>", "update a crate" },
    cUg = { "<cmd>lua require('crates').upgrade_crates()<CR>", "update the crates on the lines visually selected." },
    cUa = { "<cmd>lua require('crates').update_all_crates()<CR>", "update all crates" },
    cx = { "<cmd>lua require('crates').expand_plain_crate_to_inline_table()<CR>", "expand a plain crate declaration into an inline table." },
    cX = { "<cmd>lua require('crates').extract_crate_into_table()<CR>", "extract an crate declaration from a dependency section into a table." },
    cH = { "<cmd>lua require('crates').open_homepage()<CR>", "open the homepage of the crate on the current line." },
    cR = { "<cmd>lua require('crates').open_repository()<CR>", "open the repository page of the crate on the current line." },
    cD = { "<cmd>lua require('crates').open_documentation()<CR>", "open the documentation page of the crate on the current line." },
    cC = { "<cmd>lua require('crates').open_crates_io()<CR>", "open the crates.io page of the crate on the current line." },
    cL = { "<cmd>lua require('crates').open_lib_rs()<CR>", "open the lib.rs page of the crate on the current line." },
    cI = { "<cmd>lua setup_layout()<CR>", "setup C window layout" },
    cW = { "<cmd>lua undo_layout()<CR>", "undo C window layout" },
    bw = { "<cmd>enew<CR>", "open a new buffer" },
    tx = { "<cmd>terminal<CR>", "open a terminal" },
    gx = { "<cmd>Godbolt<CR>", "compile and show assembly" },
    gi = { "<cmd>GuessIndent<CR>", "guess indent again" },

    -- adga specific things
    ad = { "<cmd>CornelisGoToDefinition<CR>", "Goto agda defn" },
    ar = { "<cmd>CornelisLoad<CR>", "Reload Agda buffer" },
    aR = { "<cmd>CornelisRefine<CR>", "Refine type" },
    agn = { "<cmd>CornelisNextGoal<CR>", "Goto next goal" },
    agp = { "<cmd>CornelisPrevGoal<CR>", "Goto prev goal" },
    as = { "<cmd>CornelisSolve<CR>", "Goto prev goal" },
    at = { "<cmd>CornelisAuto<CR>", "Auto whatever that means" },
    aK = { "<cmd>CornelisTypeContext<CR>", "Type context" },
    amc = { "<cmd>CornelisMakeCase<CR>", "Make case" },

    -- hex editors
    xh = { "<cmd>HexToggle<CR>", "Hex Editor Toggle" },

    -- trouble keybinds
    xx = { "<cmd>TroubleToggle<CR>", "Toggle trouble diagnostics" },
    xw = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Toggle trouble workspace diagnostics" },
    xd = { "<cmd>TroubleToggle document_diagnostics<CR>", "Toggle trouble document diagnostics" },
    xq = { "<cmd>TroubleToggle quickfix<CR>", "Toggle trouble quickfix list" },
    xl = { "<cmd>TroubleToggle loclist<CR>", "Toggle trouble local list" },
    xr = { "<cmd>TroubleToggle lsp_references<CR>", "Toggle trouble lsp references" },
    xn = { "cmd lua require(\"trouble\").next({skip_groups = true, jump = true})<CR>", "Jump next diagnostic" },
    xp = { "cmd lua require(\"trouble\").previous({skip_groups = true, jump = true})<CR>", "Jump next diagnostic" },

    -- dap shit
    pc = { "<Cmd>lua require'dap'.continue()<CR>", "Dap Continue" },
    po = { "<Cmd>lua require'dap'.step_over()<CR>", "Dap Step over" },
    pi = { "<Cmd>lua require'dap'.step_into()<CR>", "Dap Step into" },
    pO = { "<Cmd>lua require'dap'.step_out()<CR>", "Dap Step out" },
    pb = { "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", "Dap Toggle breakpoint" },
    pr = { "<Cmd>lua require'dap'.repl.open()<CR>", "Dap Open repl" },
    pl = { "<Cmd>lua require'dap'.run_last()<CR>", "Dap Run last" },
    pu = { "<Cmd>lua require'dapui'.toggle()<CR>", "Dap UI Toggle" },
    pC = { "<Cmd>lua require'telescope'.extensions.dap.commands{}<CR>", "Dap commands" },
    pa = { "<Cmd>lua require'telescope'.extensions.dap.configurations{}<CR>", "Dap configurations" },
    pL = { "<Cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<CR>", "Dap list breakpoints" },
    pv = { "<Cmd>lua require'telescope'.extensions.dap.variables{}<CR>", "Dap list variables" },
    pf = { "<Cmd>lua require'telescope'.extensions.dap.frames{}<CR>", "Dap list frames" },
    pe = { "<Cmd>lua require('dapui').eval(vim.fn.input('Expression to evaluate: '))<CR>", "Dap eval expression" },
    ps = { "<Cmd>lua require('dap.ext.vscode').load_launchjs(nil, { [\"lldb\"] = {\"rust\", \"c\"} })<CR>", "Dap load configs" },

    na = { "<Cmd>lua require(\"ts-node-action\").node_action{}<CR>", "Trigger Node Action" },
    -- trailblazer
    tm = { "<Cmd>lua require(\"trailblazer\").new_trail_mark()<CR>", "Trailblazer: new trail mark" },
    tb = { "<Cmd>lua require(\"trailblazer\").track_back()<CR>", "Trailblazer: track back (deletes mark)" },
    tn = { "<Cmd>lua require(\"trailblazer\").peek_move_next_down()<CR>", "Trailblazer: next down" },
    tp = { "<Cmd>lua require(\"trailblazer\").peek_move_previous_up()<CR>", "Trailblazer: previous up" },
    tj = { "<Cmd>lua require(\"trailblazer\").move_to_nearest()<CR>", "Trailblazer: jump to nearest" },
    tl = { "<Cmd>lua require(\"trailblazer\").toggle_trail_mark_list()<CR>", "Trailblazer: list" },
    tD = { "<Cmd>lua require(\"trailblazer\").delete_all_trail_marks()<CR>", "Trailblazer: nuke all trail marks" },
    tq = { "<Cmd>lua require(\"trailblazer\").paste_at_last_trail_mark()<CR>", "Trailblazer: paste at last trail mark" },
    tQ = { "<Cmd>lua require(\"trailblazer\").paste_at_all_trail_marks()<CR>", "Trailblazer: paste at all trail marks" },
    ts = { "<Cmd>lua require(\"trailblazer\").switch_to_next_trail_mark_stack()<CR>", "Trailblazer: next mark stack" },
    tS = { "<Cmd>lua require(\"trailblazer\").switch_to_previous_trail_mark_stack()<CR>", "Trailblazer: previous mark stack" },
    to = { "<Cmd>lua require(\"trailblazer\").set_trail_mark_stack_sort_mode()<CR>", "Trailblazer: sort mode" },
    ti = { "<Cmd>lua require(\"trailblazer\").set_trail_mark_select_mode()<CR>", "Trailblazer: select mode" },
    tz = { "<Cmd>TrailBlazerSaveSession<CR>", "Trailblazer: save" },
    tZ = { "<Cmd>TrailBlazerLoadSession<CR>", "Trailblazer: load" },
  }
})

-- wk.setup({
  -- triggers = {
  --   { "<leader>", mode = { "n", "v" } },
  -- },
-- })
--wk.add({
--  { "K", "<cmd>lua show_documentation()<cr>", desc = "Get Type Information.", mode = "n" },
--  { "j", "gj", desc = "Wrapped down", mode = "n" },
--  { "k", "gk", desc = "Wrapped up", mode = "n" },
--  { "<leader>ai", "AnsiEsc", desc = "Replace ansi escape codes with colors", mode = "n" },
--  { "<leader>D", "<cmd>lua vim.lsp.buf.declarations()<cr>", desc = "Jump to declaration", mode = "n" },
--})


vim.api.nvim_set_keymap('n', 'j', 'gj', {}) -- wrapped down
vim.api.nvim_set_keymap('n', 'k', 'gk', {}) -- wrapped up

vim.api.nvim_set_keymap('n', '<leader>ws', '<cmd>sp<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>wv', '<cmd>vs<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>bd', '<cmd>q<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>bn', '<cmd>bnext<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>bp', '<cmd>bprev<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>bN', '<cmd>tabedit<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>bD', '<cmd>Bclose!<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>wd', '<cmd>q<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>wl', '<cmd>wincmd l<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>wj', '<cmd>wincmd j<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>wk', '<cmd>wincmd k<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>wh', '<cmd>wincmd h<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>cc', '<cmd>ColorizerToggle<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>Telescope<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>tb', '<cmd>Tagbar<cr>', { desc = "" })
vim.api.nvim_set_keymap('n', '<leader>os', '<cmd>ObsidianQuickSwitch<cr>', { desc = "Launch obsidian quick switch" })
vim.api.nvim_set_keymap('n', '<leader>gd', '<cmd>GodboltCompiler telescope<cr>', { desc = "Open godbolt compiler" })
vim.api.nvim_set_keymap('n', "<leader>-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
vim.api.nvim_set_keymap('n', "<leader>d-", "<cmd>DiffviewOpen<cr>", { desc = "Open diff view" })
vim.api.nvim_set_keymap('n', "<leader>tr", "<cmd>Trouble<cr>", { desc = "Open trouble menu" })
vim.api.nvim_set_keymap('n', 'k', 'gk', {}) -- show docs. TODO move to lsp file

-- Flag to check if clipboard has been set
local clipboard_set = false

-- Autocmd to set clipboard to use the system clipboard on first file open
vim.api.nvim_create_autocmd("BufRead", {
  callback = function()
    if not clipboard_set then
      vim.opt.clipboard:append("unnamedplus")
      clipboard_set = true
    end
  end
})

vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}

-- Function to clean trailing spaces on save
local function clean_extra_spaces()
    local save_cursor = vim.fn.getpos(".")
    local old_query = vim.fn.getreg("/")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos('.', save_cursor)
    vim.fn.setreg('/', old_query)
end

-- Autocommand to call clean_extra_spaces function before saving
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = clean_extra_spaces,
})

-- Preserve cursor location after opening a file
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        local line = vim.fn.line
        if line("'\"") >= 1 and line("'\"") <= line("$") then
            vim.cmd([[normal! g`"]])
        end
    end,
})

require('bufferline').setup()

local actions = require("diffview.actions")

require("diffview").setup({
    diff_binaries = false,    -- Show diffs for binaries
    enhanced_diff_hl = false, -- See |diffview-config-enhanced_diff_hl|
    git_cmd = { "git" },      -- The git executable followed by default args.
    hg_cmd = { "hg" },        -- The hg executable followed by default args.
    use_icons = true,         -- Requires nvim-web-devicons
    show_help_hints = true,   -- Show hints for how to open the help panel
    watch_index = true,       -- Update views and index buffers when the git index changes.
    icons = {                 -- Only applies when use_icons is true.
      folder_closed = "",
      folder_open = "",
    },
    signs = {
      fold_closed = "",
      fold_open = "",
      done = "✓",
    },
    view = {
      -- Configure the layout and behavior of different types of views.
      -- Available layouts:
      --  'diff1_plain'
      --    |'diff2_horizontal'
      --    |'diff2_vertical'
      --    |'diff3_horizontal'
      --    |'diff3_vertical'
      --    |'diff3_mixed'
      --    |'diff4_mixed'
      -- For more info, see |diffview-config-view.x.layout|.
      default = {
        -- Config for changed files, and staged files in diff views.
        layout = "diff2_horizontal",
        disable_diagnostics = false,  -- Temporarily disable diagnostics for diff buffers while in the view.
        winbar_info = false,          -- See |diffview-config-view.x.winbar_info|
      },
      merge_tool = {
        -- Config for conflicted files in diff views during a merge or rebase.
        layout = "diff3_horizontal",
        disable_diagnostics = true,   -- Temporarily disable diagnostics for diff buffers while in the view.
        winbar_info = true,           -- See |diffview-config-view.x.winbar_info|
      },
      file_history = {
        -- Config for changed files in file history views.
        layout = "diff2_horizontal",
        disable_diagnostics = false,  -- Temporarily disable diagnostics for diff buffers while in the view.
        winbar_info = false,          -- See |diffview-config-view.x.winbar_info|
      },
    },
    file_panel = {
      listing_style = "tree",             -- One of 'list' or 'tree'
      tree_options = {                    -- Only applies when listing_style is 'tree'
        flatten_dirs = true,              -- Flatten dirs that only contain one single dir
        folder_statuses = "only_folded",  -- One of 'never', 'only_folded' or 'always'.
      },
      win_config = {                      -- See |diffview-config-win_config|
        position = "left",
        width = 35,
        win_opts = {},
      },
    },
    file_history_panel = {
      log_options = {   -- See |diffview-config-log_options|
        git = {
          single_file = {
            diff_merges = "combined",
          },
          multi_file = {
            diff_merges = "first-parent",
          },
        },
        hg = {
          single_file = {},
          multi_file = {},
        },
      },
      win_config = {    -- See |diffview-config-win_config|
        position = "bottom",
        height = 16,
        win_opts = {},
      },
    },
    commit_log_panel = {
      win_config = {},  -- See |diffview-config-win_config|
    },
    default_args = {    -- Default args prepended to the arg-list for the listed commands
      DiffviewOpen = {},
      DiffviewFileHistory = {},
    },
    hooks = {},         -- See |diffview-config-hooks|
    keymaps = {
      disable_defaults = false, -- Disable the default keymaps
      view = {
        -- The `view` bindings are active in the diff buffers, only when the current
        -- tabpage is a Diffview.
        { "n", "<tab>",       actions.select_next_entry,              { desc = "Open the diff for the next file" } },
        { "n", "<s-tab>",     actions.select_prev_entry,              { desc = "Open the diff for the previous file" } },
        { "n", "[F",          actions.select_first_entry,             { desc = "Open the diff for the first file" } },
        { "n", "]F",          actions.select_last_entry,              { desc = "Open the diff for the last file" } },
        { "n", "gf",          actions.goto_file_edit,                 { desc = "Open the file in the previous tabpage" } },
        { "n", "<C-w><C-f>",  actions.goto_file_split,                { desc = "Open the file in a new split" } },
        { "n", "<C-w>gf",     actions.goto_file_tab,                  { desc = "Open the file in a new tabpage" } },
        { "n", "<leader>e",   actions.focus_files,                    { desc = "Bring focus to the file panel" } },
        { "n", "<leader>b",   actions.toggle_files,                   { desc = "Toggle the file panel." } },
        { "n", "g<C-x>",      actions.cycle_layout,                   { desc = "Cycle through available layouts." } },
        { "n", "[x",          actions.prev_conflict,                  { desc = "In the merge-tool: jump to the previous conflict" } },
        { "n", "]x",          actions.next_conflict,                  { desc = "In the merge-tool: jump to the next conflict" } },
        { "n", "<leader>co",  actions.conflict_choose("ours"),        { desc = "Choose the OURS version of a conflict" } },
        { "n", "<leader>ct",  actions.conflict_choose("theirs"),      { desc = "Choose the THEIRS version of a conflict" } },
        { "n", "<leader>cb",  actions.conflict_choose("base"),        { desc = "Choose the BASE version of a conflict" } },
        { "n", "<leader>ca",  actions.conflict_choose("all"),         { desc = "Choose all the versions of a conflict" } },
        { "n", "dx",          actions.conflict_choose("none"),        { desc = "Delete the conflict region" } },
        { "n", "<leader>cO",  actions.conflict_choose_all("ours"),    { desc = "Choose the OURS version of a conflict for the whole file" } },
        { "n", "<leader>cT",  actions.conflict_choose_all("theirs"),  { desc = "Choose the THEIRS version of a conflict for the whole file" } },
        { "n", "<leader>cB",  actions.conflict_choose_all("base"),    { desc = "Choose the BASE version of a conflict for the whole file" } },
        { "n", "<leader>cA",  actions.conflict_choose_all("all"),     { desc = "Choose all the versions of a conflict for the whole file" } },
        { "n", "dX",          actions.conflict_choose_all("none"),    { desc = "Delete the conflict region for the whole file" } },
      },
      diff1 = {
        -- Mappings in single window diff layouts
        { "n", "g?", actions.help({ "view", "diff1" }), { desc = "Open the help panel" } },
      },
      diff2 = {
        -- Mappings in 2-way diff layouts
        { "n", "g?", actions.help({ "view", "diff2" }), { desc = "Open the help panel" } },
      },
      diff3 = {
        -- Mappings in 3-way diff layouts
        { { "n", "x" }, "2do",  actions.diffget("ours"),            { desc = "Obtain the diff hunk from the OURS version of the file" } },
        { { "n", "x" }, "3do",  actions.diffget("theirs"),          { desc = "Obtain the diff hunk from the THEIRS version of the file" } },
        { "n",          "g?",   actions.help({ "view", "diff3" }),  { desc = "Open the help panel" } },
      },
      diff4 = {
        -- Mappings in 4-way diff layouts
        { { "n", "x" }, "1do",  actions.diffget("base"),            { desc = "Obtain the diff hunk from the BASE version of the file" } },
        { { "n", "x" }, "2do",  actions.diffget("ours"),            { desc = "Obtain the diff hunk from the OURS version of the file" } },
        { { "n", "x" }, "3do",  actions.diffget("theirs"),          { desc = "Obtain the diff hunk from the THEIRS version of the file" } },
        { "n",          "g?",   actions.help({ "view", "diff4" }),  { desc = "Open the help panel" } },
      },
      file_panel = {
        { "n", "j",              actions.next_entry,                     { desc = "Bring the cursor to the next file entry" } },
        { "n", "<down>",         actions.next_entry,                     { desc = "Bring the cursor to the next file entry" } },
        { "n", "k",              actions.prev_entry,                     { desc = "Bring the cursor to the previous file entry" } },
        { "n", "<up>",           actions.prev_entry,                     { desc = "Bring the cursor to the previous file entry" } },
        { "n", "<cr>",           actions.select_entry,                   { desc = "Open the diff for the selected entry" } },
        { "n", "o",              actions.select_entry,                   { desc = "Open the diff for the selected entry" } },
        { "n", "l",              actions.select_entry,                   { desc = "Open the diff for the selected entry" } },
        { "n", "<2-LeftMouse>",  actions.select_entry,                   { desc = "Open the diff for the selected entry" } },
        { "n", "-",              actions.toggle_stage_entry,             { desc = "Stage / unstage the selected entry" } },
        { "n", "s",              actions.toggle_stage_entry,             { desc = "Stage / unstage the selected entry" } },
        { "n", "S",              actions.stage_all,                      { desc = "Stage all entries" } },
        { "n", "U",              actions.unstage_all,                    { desc = "Unstage all entries" } },
        { "n", "X",              actions.restore_entry,                  { desc = "Restore entry to the state on the left side" } },
        { "n", "L",              actions.open_commit_log,                { desc = "Open the commit log panel" } },
        { "n", "zo",             actions.open_fold,                      { desc = "Expand fold" } },
        { "n", "h",              actions.close_fold,                     { desc = "Collapse fold" } },
        { "n", "zc",             actions.close_fold,                     { desc = "Collapse fold" } },
        { "n", "za",             actions.toggle_fold,                    { desc = "Toggle fold" } },
        { "n", "zR",             actions.open_all_folds,                 { desc = "Expand all folds" } },
        { "n", "zM",             actions.close_all_folds,                { desc = "Collapse all folds" } },
        { "n", "<c-b>",          actions.scroll_view(-0.25),             { desc = "Scroll the view up" } },
        { "n", "<c-f>",          actions.scroll_view(0.25),              { desc = "Scroll the view down" } },
        { "n", "<tab>",          actions.select_next_entry,              { desc = "Open the diff for the next file" } },
        { "n", "<s-tab>",        actions.select_prev_entry,              { desc = "Open the diff for the previous file" } },
        { "n", "[F",             actions.select_first_entry,             { desc = "Open the diff for the first file" } },
        { "n", "]F",             actions.select_last_entry,              { desc = "Open the diff for the last file" } },
        { "n", "gf",             actions.goto_file_edit,                 { desc = "Open the file in the previous tabpage" } },
        { "n", "<C-w><C-f>",     actions.goto_file_split,                { desc = "Open the file in a new split" } },
        { "n", "<C-w>gf",        actions.goto_file_tab,                  { desc = "Open the file in a new tabpage" } },
        { "n", "i",              actions.listing_style,                  { desc = "Toggle between 'list' and 'tree' views" } },
        { "n", "f",              actions.toggle_flatten_dirs,            { desc = "Flatten empty subdirectories in tree listing style" } },
        { "n", "R",              actions.refresh_files,                  { desc = "Update stats and entries in the file list" } },
        { "n", "<leader>e",      actions.focus_files,                    { desc = "Bring focus to the file panel" } },
        { "n", "<leader>b",      actions.toggle_files,                   { desc = "Toggle the file panel" } },
        { "n", "g<C-x>",         actions.cycle_layout,                   { desc = "Cycle available layouts" } },
        { "n", "[x",             actions.prev_conflict,                  { desc = "Go to the previous conflict" } },
        { "n", "]x",             actions.next_conflict,                  { desc = "Go to the next conflict" } },
        { "n", "g?",             actions.help("file_panel"),             { desc = "Open the help panel" } },
        { "n", "<leader>cO",     actions.conflict_choose_all("ours"),    { desc = "Choose the OURS version of a conflict for the whole file" } },
        { "n", "<leader>cT",     actions.conflict_choose_all("theirs"),  { desc = "Choose the THEIRS version of a conflict for the whole file" } },
        { "n", "<leader>cB",     actions.conflict_choose_all("base"),    { desc = "Choose the BASE version of a conflict for the whole file" } },
        { "n", "<leader>cA",     actions.conflict_choose_all("all"),     { desc = "Choose all the versions of a conflict for the whole file" } },
        { "n", "dX",             actions.conflict_choose_all("none"),    { desc = "Delete the conflict region for the whole file" } },
      },
      file_history_panel = {
        { "n", "g!",            actions.options,                     { desc = "Open the option panel" } },
        { "n", "<C-A-d>",       actions.open_in_diffview,            { desc = "Open the entry under the cursor in a diffview" } },
        { "n", "y",             actions.copy_hash,                   { desc = "Copy the commit hash of the entry under the cursor" } },
        { "n", "L",             actions.open_commit_log,             { desc = "Show commit details" } },
        { "n", "X",             actions.restore_entry,               { desc = "Restore file to the state from the selected entry" } },
        { "n", "zo",            actions.open_fold,                   { desc = "Expand fold" } },
        { "n", "zc",            actions.close_fold,                  { desc = "Collapse fold" } },
        { "n", "h",             actions.close_fold,                  { desc = "Collapse fold" } },
        { "n", "za",            actions.toggle_fold,                 { desc = "Toggle fold" } },
        { "n", "zR",            actions.open_all_folds,              { desc = "Expand all folds" } },
        { "n", "zM",            actions.close_all_folds,             { desc = "Collapse all folds" } },
        { "n", "j",             actions.next_entry,                  { desc = "Bring the cursor to the next file entry" } },
        { "n", "<down>",        actions.next_entry,                  { desc = "Bring the cursor to the next file entry" } },
        { "n", "k",             actions.prev_entry,                  { desc = "Bring the cursor to the previous file entry" } },
        { "n", "<up>",          actions.prev_entry,                  { desc = "Bring the cursor to the previous file entry" } },
        { "n", "<cr>",          actions.select_entry,                { desc = "Open the diff for the selected entry" } },
        { "n", "o",             actions.select_entry,                { desc = "Open the diff for the selected entry" } },
        { "n", "l",             actions.select_entry,                { desc = "Open the diff for the selected entry" } },
        { "n", "<2-LeftMouse>", actions.select_entry,                { desc = "Open the diff for the selected entry" } },
        { "n", "<c-b>",         actions.scroll_view(-0.25),          { desc = "Scroll the view up" } },
        { "n", "<c-f>",         actions.scroll_view(0.25),           { desc = "Scroll the view down" } },
        { "n", "<tab>",         actions.select_next_entry,           { desc = "Open the diff for the next file" } },
        { "n", "<s-tab>",       actions.select_prev_entry,           { desc = "Open the diff for the previous file" } },
        { "n", "[F",            actions.select_first_entry,          { desc = "Open the diff for the first file" } },
        { "n", "]F",            actions.select_last_entry,           { desc = "Open the diff for the last file" } },
        { "n", "gf",            actions.goto_file_edit,              { desc = "Open the file in the previous tabpage" } },
        { "n", "<C-w><C-f>",    actions.goto_file_split,             { desc = "Open the file in a new split" } },
        { "n", "<C-w>gf",       actions.goto_file_tab,               { desc = "Open the file in a new tabpage" } },
        { "n", "<leader>e",     actions.focus_files,                 { desc = "Bring focus to the file panel" } },
        { "n", "<leader>b",     actions.toggle_files,                { desc = "Toggle the file panel" } },
        { "n", "g<C-x>",        actions.cycle_layout,                { desc = "Cycle available layouts" } },
        { "n", "g?",            actions.help("file_history_panel"),  { desc = "Open the help panel" } },
      },
      option_panel = {
        { "n", "<tab>", actions.select_entry,          { desc = "Change the current option" } },
        { "n", "q",     actions.close,                 { desc = "Close the panel" } },
        { "n", "g?",    actions.help("option_panel"),  { desc = "Open the help panel" } },
      },
      help_panel = {
        { "n", "q",     actions.close,  { desc = "Close help menu" } },
        { "n", "<esc>", actions.close,  { desc = "Close help menu" } },
      },
    },
})

require("nvim-lightbulb").setup({
  autocmd = { enabled = true }
})
