---------------------------
--  "wtf" awesome theme  --
-- Edited by tunnelshade --
---------------------------

-- {{{ Main
theme = {}

theme.theme_dir = os.getenv("HOME") .. "/.config/awesome/themes/wtf"
theme.icon_dir = theme.theme_dir .. "/icons"
theme.layouts_dir = theme.icon_dir .. "/layouts"

theme.wallpaper = theme.theme_dir .. "/wall.jpg"
-- }}}

-- {{{ Styles
theme.font      = "Terminus 9"

theme.skyblue = "#0099CC"
-- {{{ Colors
theme.fg_normal = "#FFFFFF"
theme.bg_normal = "#242424"
theme.fg_focus = "#FFFFFF"
theme.bg_focus = "#0099CC"
theme.fg_urgent = "#CC9393"
theme.bg_urgent = "#2A1F1E"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.border_width  = 1
theme.border_normal = "#000000"
theme.border_focus  = "#000000"
theme.border_marked = "#000000"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#3F3F3F"
theme.titlebar_bg_normal = "#3F3F3F"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = 15
theme.menu_width  = 100
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = "/usr/share/awesome/themes/zenburn/taglist/squarefz.png"
theme.taglist_squares_unsel = "/usr/share/awesome/themes/zenburn/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.arch_icon           = theme.icon_dir .. "/arch-icon.png"
theme.awesome_icon        = theme.icon_dir .. "/awesome-icon.png"
theme.menu_submenu_icon   = "/usr/share/awesome/themes/default/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = theme.layouts_dir .. "/tile.png"
theme.layout_tileleft   = theme.layouts_dir .. "/tileleft.png"
theme.layout_tilebottom = theme.layouts_dir .. "/tilebottom.png"
theme.layout_tiletop    = theme.layouts_dir .. "/tiletop.png"
theme.layout_fairv      = theme.layouts_dir .. "/fairv.png"
theme.layout_fairh      = theme.layouts_dir .. "/fairh.png"
theme.layout_spiral     = theme.layouts_dir .. "/spiral.png"
theme.layout_dwindle    = theme.layouts_dir .. "/dwindle.png"
theme.layout_max        = theme.layouts_dir .. "/max.png"
theme.layout_fullscreen = theme.layouts_dir .. "/fullscreen.png"
theme.layout_magnifier  = theme.layouts_dir .. "/magnifier.png"
theme.layout_floating   = theme.layouts_dir .. "/floating.png"
-- }}}

theme.widget_clock      = theme.icon_dir .. "/clock.png"
theme.widget_cpu        = theme.icon_dir .. "/cpu.png"
theme.widget_temp        = theme.icon_dir .. "/temp.png"
theme.widget_batt        = theme.icon_dir .. "/bat.png"
theme.widget_mem        = theme.icon_dir .. "/mem.png"
theme.widget_uptime     = theme.icon_dir .. "/fs.png"
-- {{{ Titlebar
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/zenburn/titlebar/close_focus.png"
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/zenburn/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme
