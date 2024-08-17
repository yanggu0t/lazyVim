return {
  "lewis6991/gitsigns.nvim",
  event = "LazyFile",
  opts = {
    current_line_blame = true, -- 開啟當前行 git 上一個 editor
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 100,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = function(name, blame_info, opts)
      if not blame_info.author then
        return {}
      end
      local timestamp = blame_info.author_time
      local now = os.time()
      local time_diff = now - timestamp

      local time_str
      if time_diff < 60 then
        time_str = string.format("%d seconds ago", time_diff)
      elseif time_diff < 3600 then
        time_str = string.format("%d minutes ago", math.floor(time_diff / 60))
      elseif time_diff < 86400 then
        time_str = string.format("%d hours ago", math.floor(time_diff / 3600))
      elseif time_diff < 2592000 then
        time_str = string.format("%d days ago", math.floor(time_diff / 86400))
      elseif time_diff < 31536000 then
        time_str = string.format("%d months ago", math.floor(time_diff / 2592000))
      else
        time_str = string.format("%d years ago", math.floor(time_diff / 31536000))
      end

      local text = string.format("%s, %s • %s", blame_info.author, time_str, blame_info.summary)
      return { { text, "GitSignsCurrentLineBlame" } }
    end,
  },
}
