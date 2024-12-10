-- -- @return string path
-- function Yatline.string.get:linked_path()
-- 	local h = cx.active.current.hovered
-- 	if not h then
-- 		return ""
-- 	end
--
-- 	local linked = ""
-- 	if h.link_to ~= nil then
-- 		linked = tostring(h.link_to)
-- 	end
-- 	return ya.readable_path(linked)
-- end

require("zoxide"):setup({ update_db = true })
require("full-border"):setup()
require("git"):setup()

local tokyo_night_theme = require("yatline-tokyo-night"):setup("storm")
require("yatline"):setup({
  theme = tokyo_night_theme,
  section_separator = { open = "", close = "" },
  part_separator = { open = "", close = "" },
  inverse_separator = { open = "", close = "" },

  style_a = {
    fg = "black",
    bg_mode = {
      normal = "#a89984",
      select = "#d79921",
      un_set = "#d65d0e",
    },
  },
  style_b = { bg = "#665c54", fg = "#ebdbb2" },
  style_c = { bg = "#3c3836", fg = "#a89984" },

  permissions_t_fg = "green",
  permissions_r_fg = "yellow",
  permissions_w_fg = "red",
  permissions_x_fg = "cyan",
  permissions_s_fg = "darkgray",

  tab_width = 20,
  tab_use_inverse = false,

  selected = { icon = "󰻭", fg = "yellow" },
  copied = { icon = "", fg = "green" },
  cut = { icon = "", fg = "red" },

  total = { icon = "󰮍", fg = "yellow" },
  succ = { icon = "", fg = "green" },
  fail = { icon = "", fg = "red" },
  found = { icon = "󰮕", fg = "blue" },
  processed = { icon = "󰐍", fg = "green" },

  show_background = false,

  display_header_line = true,
  display_status_line = true,

  header_line = {
    left = {
      section_a = {},
      section_b = {},
      section_c = {},
    },
    right = {
      section_a = {},
      section_b = {},
      section_c = {},
    },
  },
  status_line = {
    left = {
      section_a = {
        { type = "string", custom = false, name = "tab_mode" },
      },
      section_b = {
        { type = "string", custom = false, name = "hovered_size" },
      },
      section_c = {
        { type = "string", custom = false, name = "hovered_name" },
        { type = "string", custom = false, name = "hovered_mime" },
      },
    },
    right = {
      section_a = {
        { type = "coloreds", custom = false, name = "count" },
      },
      section_b = {
        { type = "string", custom = false, name = "cursor_position" },
        { type = "string", custom = false, name = "cursor_percentage" },
      },
      section_c = {
        { type = "coloreds", custom = false, name = "task_states" },
        { type = "coloreds", custom = false, name = "permissions" },
      },
    },
  },
})
require("starship"):setup({ config_file = "/home/daru/.config/starship.toml" })
