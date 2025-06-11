local gpus = wezterm.gui.enumerate_gpus()

local config = {}

for _, gpu in ipairs(gpus) do
    if gpu.backend == "Vulkan" and gpu.device_type == "IntegratedGpu" then
        config.front_end = "WebGpu"
        config.webgpu_preferred_adapter = gpu
    end
end

config.window_background_opacity = 0.6
config.hide_tab_bar_if_only_one_tab = true
config.font_locator = "FontConfig"

return config
