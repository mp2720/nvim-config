local M = {}

local function find_tab(config_name)
    local check_tab = function()
        return vim.t.dap_wrapper_config_name == config_name
    end

    vim.cmd [[1tabnext]]

    if check_tab() then
        return 1
    end

    while vim.api.nvim_tabpage_get_number(0) ~= 1 do
        if check_tab() then
            return vim.api.nvim_tabpage_get_number(0)
        end

        vim.cmd [[+tabnext]]
    end

    return nil
end

function M.do_dap_action(config_name, filepath, dap_action)
    local n = find_tab(config_name)
    if n == nil then
        vim.cmd "tabnew"
        n = vim.api.nvim_tabpage_get_number(0)
        vim.t.dap_wrapper_config_name = config_name
    end

    vim.cmd(string.format("%dtabnext", n))
    vim.cmd(string.format("edit %s", filepath))

    vim.t.dap_wrapper_config_name = config_name
    dap_action()
end

return M
