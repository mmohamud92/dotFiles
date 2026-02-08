return {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    main = "smear_cursor",
    opts = {
        stiffness = 0.8,           -- Higher = faster animation (0.6-0.9 recommended)
        trailing_stiffness = 0.5,  -- Trail animation speed
        distance_stop_animating = 0.1, -- Don't animate for tiny movements
        hide_target_hack = false,  -- Set to true if cursor jumps are too jarring
    },
}
