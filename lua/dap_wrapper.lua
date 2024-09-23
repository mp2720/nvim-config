local M = {}

local dap = require 'dap'

local function find_tab()
    local check_tab = function()
        return vim.t.dap_wrapper_tab_marker
    end

    vim.cmd [[1tabnext]]

    if check_tab() then
        return 1
    end

    vim.cmd [[tabnext]]

    while vim.api.nvim_tabpage_get_number(0) ~= 1 do
        if check_tab() then
            return vim.api.nvim_tabpage_get_number(0)
        end

        vim.cmd [[tabnext]]
    end

    return nil
end

function M.start(filepath)
    dap.close()

    M.prev_tab = vim.api.nvim_tabpage_get_number(0)

    local n = find_tab()
    if n == nil then
        vim.cmd "tabnew"
        n = vim.api.nvim_tabpage_get_number(0)
        vim.t.dap_wrapper_tab_marker = true
    end

    vim.cmd(string.format("%dtabnext", n))
    vim.cmd(string.format("edit %s", filepath))

    dap.continue()
end

function M.stop()
    if M.prev_tab ~= nil then
        vim.cmd(string.format("%dtabnext", M.prev_tab))
    end

    dap.close()
end

return M
