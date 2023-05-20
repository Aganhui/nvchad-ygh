---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    
    -- hop
    ["\\f"] = { "<cmd>HopPattern<CR>", "hop pattern" },
    ["\\j"] = { "<cmd>HopLineAC<CR>", "hop line after" },
    ["\\k"] = { "<cmd>HopLineBC<CR>", "hop line before" },
    ["\\w"] = { "<cmd>HopWordAC<CR>", "hop word after" },
    ["\\b"] = { "<cmd>HopWordBC<CR>", "hop word before" },
    ["\\l"] = { "<cmd>HopAnywhereCurrentLine<CR>", "hop char this line" },
    
    -- aerial
    ["<Leader>a"] = { "<cmd>AerialToggle!<CR>", "aerial toggle" },
    ["<Leader>s"] = { "<cmd>Copilot panel<CR>", "copilot panel open" },

    ["<Leader>d"] = { '<cmd>lua require("spectre").open()<CR>', "Open Spectre"},
    ["<Leader>nv"] = { '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', "Search current word"},
    ["<Leader>nc"] = { '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', "Search on current file"},
  },
  v = {
    ["<Leader>nv"] = { '<esc><cmd>lua require("spectre").open_visual()<CR>', "Search current word"},
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>fg"] = { "<cmd> Telescope grep_string <CR>", "find implementation" },
    -- ["<leader>fg"] = { "<cmd> Telescope lsp_references <CR>", "find implementation" },
  }
}

return M
