return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require "dap"

            vim.keymap.set({ 'n', 'i' }, '<C-b>', dap.toggle_breakpoint)
            vim.keymap.set({ 'n', 'i' }, '<F1>', dap.continue)
            vim.keymap.set({ 'n', 'i' }, '<F2>', dap.step_over)
            vim.keymap.set({ 'n', 'i' }, '<F3>', dap.step_into)
            vim.keymap.set({ 'n', 'i' }, '<F4>', dap.repl.open)

            --     local dap = require "dap"
            --
            --     local debug_tab = 10
            --     local last_nondebug_tab = -1
            --
            --     local function goto_debug_tab()
            --         -- local cur = vim.api.nvim_tabpage_get_number(0)
            --         --
            --         -- if cur ~= debug_tab then
            --         --     last_nondebug_tab = cur
            --         -- end
            --         --
            --         -- vim.cmd(string.format("%dtabnext", debug_tab))
            --     end
            --
            --     vim.keymap.set({ 'n', 'i', 't' }, '<F2>', function()
            --         goto_debug_tab()
            --         dap.toggle_breakpoint()
            --     end)
            --     vim.keymap.set({ 'n', 'i', 't' }, '<F3>', function()
            --         goto_debug_tab()
            --         dap.continue()
            --     end)
            --     vim.keymap.set({ 'n', 'i', 't' }, '<F4>', function()
            --         goto_debug_tab()
            --         dap.step_over()
            --     end)
            --     vim.keymap.set({ 'n', 'i', 't' }, '<F5>', function()
            --         goto_debug_tab()
            --         dap.step_into()
            --     end)
            --     vim.keymap.set({ 'n', 'i', 't' }, '<F6>', function()
            --         goto_debug_tab()
            --         dap.repl.open()
            --     end)
            --
            --     vim.keymap.set({ 'n', 'i', 't' }, '<F1>', function()
            --         if last_nondebug_tab > 0 then
            --             vim.cmd(string.format("%dtabnext", last_nondebug_tab))
            --         end
            --     end)
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup({
            })
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end
    }
}
