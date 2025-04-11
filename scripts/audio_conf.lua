-- 读取当前系统平台
local platform = mp.get_property_native("platform")

-- 配置不同平台的音频输出驱动
local ao_config = {
    windows = "wasapi",
    linux = "pipewire",
    darwin = "coreaudio"
}

local target_ao = ao_config[platform]

if target_ao then
    -- 设置音频输出驱动
    mp.set_property("ao", target_ao)
    mp.msg.info("Set audio output driver to ["..target_ao.."] for platform: "..platform)

else
    mp.msg.warn("No audio driver configured for platform: "..platform)
end