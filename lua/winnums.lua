local M = { cfg = { enabled = true } }
local wins = {}

local function refresh_wins()
    for winnum, win in pairs(wins) do
        if not vim.api.nvim_win_is_valid(win.id) then
            wins[winnum] = nil
        end
    end
    vim.cmd [[call lightline#update()]]
end

function M.get_winnum(win_id)
    if win_id == 0 then
        win_id = vim.api.nvim_get_current_win()
    end
    for winnum, win in pairs(wins) do
        if win.id == win_id then
            return winnum
        end
    end
    return -1
end

local function on_new_win()
    local cur_winid = vim.api.nvim_get_current_win()

    -- Skip floating windows.
    if vim.api.nvim_win_get_config(cur_winid).relative ~= "" then return end

    -- Skip if win id is already presented in tab.
    if M.get_winnum(cur_winid) >= 0 then return end

    refresh_wins()

    local num = 1
    while wins[num] ~= nil do
        num = num + 1
    end

    wins[num] = {
        id = cur_winid,
        label_win_id = -1,
        label_buf_id = vim.fn.bufadd("")
    }
end

function M.goto_win(win_num)
    refresh_wins()
    if wins[win_num] == nil then return end
    vim.api.nvim_set_current_win(wins[win_num].id)
end

function M.wincmd(winnum, cmd_or_func)
    if winnum == 0 then
        for wn, _ in pairs(wins) do
            M.wincmd(wn, cmd_or_func)
        end
        return
    end
    local curwinid = vim.api.nvim_get_current_win()
    M.goto_win(winnum)
    if type(cmd_or_func) == "string" then
        vim.cmd(cmd_or_func)
    elseif type(cmd_or_func) == "function" then
        cmd_or_func(winnum)
    else
        error("cmd_or_func expected to be string or function")
    end
    vim.api.nvim_set_current_win(curwinid)
end

function M.setwinnum(winid, winnum)
    if winnum == 0 then return end
    local win2 = wins[winnum]
    local winnum2 = M.get_winnum(winid)
    wins[winnum] = wins[winnum2]
    wins[winnum2] = win2
    refresh_wins()
end

local initialized = false

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if not M.cfg.enabled then return end

        if initialized then return end
        initialized = true

        -- Handle the first window.
        on_new_win()

        vim.api.nvim_create_autocmd("WinNew", { callback = on_new_win })

        -- Keymaps for switching between windows 1-9 and 10 (0) in normal, insert and terminal mode.
        for i = 1, 9 do
            vim.keymap.set(
                { 'n', 'i', 't' },
                string.format("<M-%d>", i),
                function() M.goto_win(i) end
            )
        end
        vim.keymap.set({ 'n', 'i', 't' }, "<M-0>", function() M.goto_win(10) end)

        -- Keymap for switching between all windows in normal mode.
        vim.keymap.set({ 'n' }, "<C-w>g", function() M.goto_win(vim.v.count) end)

        -- Keymap for setting window number.
        vim.keymap.set({ 'n' }, "<C-w>m", function() M.setwinnum(0, vim.v.count) end)

        vim.api.nvim_create_user_command("WNDebug", function() vim.print(M) end, {})
        vim.api.nvim_create_user_command("WNGoto",
            function(opts) M.goto_win(tonumber(opts.fargs[1])) end,
            { nargs = 1 }
        )
        vim.api.nvim_create_user_command("WNCmd",
            function(opts) M.wincmd(tonumber(opts.fargs[1]), opts.fargs[2]) end,
            { nargs = '+' }
        )
    end
})

return M
