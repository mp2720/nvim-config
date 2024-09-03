local function get_wins()
    if vim.t.winnums == nil then
        vim.t.winnums = { wins = {} }
    end

    return vim.t.winnums.wins
end

local M = {
    cfg = {
        enabled = false,
    }
}

local function update_wins(wins)
    vim.t.winnums = { wins = wins }
end

local function refresh_wins(wins)
    for winnum, win in pairs(wins) do
        if win ~= vim.NIL and win ~= nil and not vim.api.nvim_win_is_valid(win.id) then
            wins[winnum] = nil
        end
    end
    vim.cmd [[call lightline#update()]]
end

function M.get_winnum(win_id)
    local wins = get_wins()

    if win_id == 0 then
        win_id = vim.api.nvim_get_current_win()
    end
    for winnum, win in pairs(wins) do
        if win ~= vim.NIL and win ~= nil and win.id == win_id then
            return winnum
        end
    end

    return nil
end

function M.get_winid(winnum)
    local wins = get_wins()
    if wins[winnum] == nil then
        return nil
    end

    return wins[winnum].id
end

local function on_new_win()
    local cur_winid = vim.api.nvim_get_current_win()

    -- Skip floating windows.
    if vim.api.nvim_win_get_config(cur_winid).relative ~= "" then return end

    -- Skip if win id is already presented in tab.
    if M.get_winnum(cur_winid) ~= nil then return end

    local wins = get_wins()

    refresh_wins(wins)

    local num = 1
    while wins[num] ~= nil and wins[num] ~= vim.NIL do
        num = num + 1
    end

    wins[num] = {
        id = cur_winid,
        label_win_id = -1,
        label_buf_id = vim.fn.bufadd("")
    }

    update_wins(wins)
end

-- Go to `win_num`. If `win_num` is 0 nothing happens
function M.goto_win(win_num)
    if win_num == 0 then
        return
    end

    local wins = get_wins()

    refresh_wins(wins)
    if wins[win_num] == nil or wins[win_num] == vim.NIL then
        vim.api.nvim_err_writeln(string.format("Winnums: window %d not found", win_num))
        return
    end
    vim.api.nvim_set_current_win(wins[win_num].id)
end

-- Execute `cmd_or_func` for window `winnum` (or for all windows if 0).
function M.wincmd(winnum, cmd_or_func)
    if winnum == 0 then
        for wn, _ in pairs(get_wins()) do
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

-- Set number `winnum` for window with id `winid`.
function M.setwinnum(winid, winnum)
    local wins = get_wins()

    local win2 = wins[winnum]
    local winnum2 = M.get_winnum(winid)
    wins[winnum] = wins[winnum2]
    wins[winnum2] = win2
    refresh_wins(wins)

    update_wins(wins)
end

function M.setup(cfg)
    M.cfg = cfg
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
        vim.keymap.set({ 'n' }, "<C-w>N", function() M.setwinnum(0, vim.v.count) end)

        vim.api.nvim_create_user_command("WNDebug", function()
            vim.print(M)
            vim.print(get_wins())
        end, {})
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
