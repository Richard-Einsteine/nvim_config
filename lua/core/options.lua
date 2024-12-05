local opt = vim.opt -- simple namespace

-- line numbers
opt.number = true
opt.relativenumber = true

-- tab & indentation
opt.tabstop = 3
opt.shiftwidth = 3
opt.expandtab = true
opt.autoindent = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- time delay for auto save
vim.opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- line wraping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- Minimum lines to keep above/below the cursor
opt.scrolloff = 10
opt.sidescrolloff = 25

-- highlight the line the cursor is on
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = 'yes' --shows notification icons(eg. git changes, line errors, etc) in the gutter

-- Dont show the status mode, this info is already in the statusline
opt.showmode = false

-- Highlights the matched text when you compose/type the search+replace regex
opt.inccommand = 'split'

-- configure backspace behaviour
opt.backspace = "indent,eol,start" -- backspace can delete: autoindets, last char of a line or start of insert position

-- clipboard: use the sys clipboard when copying/yanking
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
