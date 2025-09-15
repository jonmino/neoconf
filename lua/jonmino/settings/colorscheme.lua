-- Setup the Colorscheme for Neovim
return {
    'catppuccin/nvim',
    name = 'catpuccin',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
        require('catppuccin').setup {
            flavour = 'mocha',
            transparent_background = true,
            float = {
                transparent = false,
                solid = false,
            },
            dim_inactive = {
                enabled = true, -- dims the background color of inactive window
                shade = 'dark',
                percentage = 0.15, -- percentage of the shade to apply to the inactive window
            },
            styles = {
                comments = { 'italic' },
                conditionals = { 'italic' },
                keywords = { 'bold' },
                loops = {},
                functions = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },
            integrations = {
                blink_cmp = true,
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
        vim.cmd.colorscheme 'catppuccin'
    end,
}
