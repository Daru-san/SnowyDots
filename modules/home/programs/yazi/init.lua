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
require("git"):setup()
require("starship"):setup({ config_file = "/home/daru/.config/starship.toml" })
require("recycle-bin"):setup()
require("fr"):setup({})
