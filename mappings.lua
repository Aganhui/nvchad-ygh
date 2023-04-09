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
  },
}

return M
