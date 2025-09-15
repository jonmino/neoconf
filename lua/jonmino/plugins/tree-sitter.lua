---@param buf integer
---@param language string
---@return boolean
local function attach(buf, language)
    -- check if parser exists before starting highlighter
    if not vim.treesitter.language.add(language) then
        return false
    end

    -- replicate `fold = { enable = true }`
    -- vim.wo.foldmethod = 'expr'
    -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

    -- replicate `highlight = { enable = true }`
    vim.treesitter.start(buf, language)

    -- replicate `indent = { enable = true }`
    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    return true
end
local default_languages = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' }
return {
    { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        branch = 'main',
        -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
        config = function()
            require('nvim-treesitter').install(default_languages)

            vim.api.nvim_create_autocmd('FileType', {
                callback = function(args)
                    local buf, filetype = args.buf, args.match
                    local language = vim.treesitter.language.get_lang(filetype)
                    if not language then
                        return
                    end
                    if attach(buf, language) then
                        return
                    end
                    -- attempt to start highlighter after installing missing language
                    require('nvim-treesitter').install(language):await(function()
                        attach(buf, language)
                    end)
                end,
            })
        end,
    },
    -- Show Context above
    { 'nvim-treesitter/nvim-treesitter-context', dependencies = { 'nvim-treesitter/nvim-treesitter' } },
    -- Rainbow Brackets etc
    { 'HiPhish/rainbow-delimiters.nvim', dependencies = { 'nvim-treesitter/nvim-treesitter' } },
    -- Add more textobjects like functions
    { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'main', dependencies = { 'nvim-treesitter/nvim-treesitter' } },
    -- There is more treesitter addons which could be added here
}
