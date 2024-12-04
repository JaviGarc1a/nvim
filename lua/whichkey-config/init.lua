local wk = require('which-key')

local mappings = {
    {
        '<leader>Q',
        '<cmd>qa!<CR>',
        desc = 'Force Quit'
    },
    {
        '<leader>q',
        ':cclose<CR>:lclose<CR>',
        desc = 'Close quickfix window'
    }
}

wk.add(mappings, { mode = 'n', silent = true })
