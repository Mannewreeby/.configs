require('time-tracker').setup({
    data_file = vim.fn.stdpath('data') .. '/time-tracker.json',
    tracking_events = {
        'BufEnter',
        'BufLeave',
        'CursorHold',
        'CursorHoldI',
        'CursorMoved',
        'CursorMovedI',
        'InsertEnter',
        'InsertLeave',
        'TextChanged',
        'TextChangedI',
    },
    tracking_timeout_seconds = 60 * 3,
})
