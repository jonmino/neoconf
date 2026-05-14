-- Import Plugins with little to no configuration here
---@module 'lazy'
---@type LazySpec
return {
    -- NOTE: Plugins can be added via a link or github org/name. To run setup automatically, use `opts = {}`
    { 'NMAC427/guess-indent.nvim', opts = {} }, -- Detect tabstop and shiftwidth automatically
    -- Highlight todo, notes, etc in comments
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        ---@module 'todo-comments'
        ---@type TodoOptions
        ---@diagnostic disable-next-line: missing-fields
        opts = { signs = true },
    },
}
