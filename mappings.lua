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
    -- ["<Leader>a"] = { "<cmd>AerialToggle!<CR>", "aerial toggle" },
    ["<Leader>a"] = { "<cmd>SymbolsOutline<CR>", "toggle symbols outline" },
    
    ["<Leader>s"] = { "<cmd>Copilot panel<CR>", "copilot panel open" },

    -- find and replace
    ["<Leader>d"] = { '<cmd>lua require("spectre").open()<CR>', "Open Spectre"},
    ["<Leader>nv"] = { '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', "Search current word"},
    ["<Leader>nc"] = { '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', "Search on current file"},
  },
  
  v = {
    -- find and replace
    ["<Leader>nv"] = { '<esc><cmd>lua require("spectre").open_visual()<CR>', "Search current word"},
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>fg"] = { "<cmd> Telescope grep_string <CR>", "find implementation" },
    ["<leader>fr"] = { "<cmd> Telescope lsp_references <CR>", "find references" },
    ["<leader>fd"] = { "<cmd> Telescope lsp_definitions <CR>", "find definitions" },
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = { "<cmd> GoTagAdd json <CR>", "add json struct tags"},
    ["<leader>gsy"] = { "<cmd> GoTagAdd yaml <CR>", "add yaml struct tags"},
    ["<leader>gse"] = { "<cmd> GoIfErr <CR>", "add err return"},
    ["<leader>gst"] = { "<cmd> GoTestsAll <CR>", "add test for all funcs"},
  }
}

return M
