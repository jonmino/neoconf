-- Setup the Colorscheme for Neovim
return {
    'catppuccin/nvim',
    name = 'catpuccin',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
        require('catppuccin').setup {
            transparent_background = true,
            integrations = {
                cmp = true,
                gitsigns = true,
                fidget = true,
                indent_blankline = {
                    enabled = true,
                    scope_color = 'sapphire',
                    colored_indent_levels = false,
                },
                mason = true,
                mini = {
                    enabled = true,
                },
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { 'italic' },
                        hints = { 'italic' },
                        warnings = { 'italic' },
                        information = { 'italic' },
                        ok = { 'italic' },
                    },
                    underlines = {
                        errors = { 'underline' },
                        hints = { 'underline' },
                        warnings = { 'underline' },
                        information = { 'underline' },
                        ok = { 'underline' },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
                neotree = true,
                rainbow_delimiters = true,
                telescope = {
                    enabled = true,
                },
                treesitter = true,
                treesitter_context = true,
                which_key = true,
            },
        }
        -- Load the colorscheme here.
        -- Like many other themes, this one has different styles, and you could load
        -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
        vim.cmd.colorscheme 'catppuccin-mocha'

        -- You can configure highlights by doing something like:
        vim.cmd.hi 'Comment gui=none'
    end,
}
