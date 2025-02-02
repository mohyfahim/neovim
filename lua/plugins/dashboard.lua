local version = vim.version()
local header = {
    "                               ",
    "             %%%               ",
    "             %%%               ",
    "             %%%               ",
    "             %%%               ",
    "      +%%%*  %%%  +%%%+        ",
    "       @%%%%%%%%%%%%%@         ",
    "          .%%%%%%%.            ",
    "   %%%+               =%%@     ",
    "   %%%%%%           %%%%%@     ",
    "      %%%%+       =%%%%        ",
    "      %%%%%#     #%%%%%        ",
    "  +%%%%%%%%%     %%%%%%%%%+    ",
    " %%%%%@   %%%%   %%%%   @%%%%% ",
    " .%%      %%%@   @%%%      %%. ",
    "          .%*   +%.            ",
    "                               ",
}

local center = {
    {
        desc = "Find File                     ",
        keymap = "",
        key = "f",
        icon = "  ",
        action = "Telescope find_files",
    },
    {
        desc = "Recents",
        keymap = "",
        key = "r",
        icon = "  ",
        action = "Telescope oldfiles",
    },

    {
        desc = "Browse Files",
        keymap = "",
        key = "b",
        icon = "  ",
        action = "Telescope file_browser",
    },

    {
        desc = "New File",
        keymap = "",
        key = "n",
        icon = "  ",
        action = "enew",
    },

    {
        desc = "Show plugins",
        keymap = "",
        key = "L",
        icon = "  ",
        action = "Lazy",
    },

    {
        desc = "Update Plugins",
        keymap = "",
        key = "u",
        icon = "  ",
        action = "Lazy update",
    },

    {
        desc = "Manage Extensions",
        keymap = "",
        key = "e",
        icon = "  ",
        action = "Mason",
    },

    {
        desc = "Config",
        keymap = "",
        key = "c",
        icon = "  ",
        action = "Telescope find_files cwd=~/.config/nvim",
    },
    {
        desc = "Exit",
        keymap = "",
        key = "q",
        icon = "  ",
        action = "exit",
    },
}
vim.api.nvim_create_autocmd("Filetype", {
    pattern = "dashboard",
    group = vim.api.nvim_create_augroup("Dashboard_au", { clear = true }),
    callback = function()
        vim.cmd([[
            setlocal buftype=nofile
            setlocal nonumber norelativenumber nocursorline noruler fillchars=eob:\
            nnoremap <buffer> <F2> :h news.txt<CR>
        ]])
    end,
})

return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#f38ba8', bg = 'NONE' }) -- from catppuccin palette
        local function footer()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "", "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end

        require("dashboard").setup({
            theme = "doom",
            config = {
                header = header,
                center = center,
                footer = footer,
            },
        })
    end,
    dependencies = {
        { 'nvim-tree/nvim-web-devicons' },
    }
}
