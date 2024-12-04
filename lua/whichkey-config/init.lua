local wk = require('which-key')

local mappings = {
    {
        '<leader>Q',
        '<cmd>qa!<CR>',
        desc = 'Force Quit',
        nowait = true,
        remap = false
    }
}

wk.add(mappings)
