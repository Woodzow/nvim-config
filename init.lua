--关于bufferline的黑条一直显示的问题
--是由于lazy，也就是插件在option之后才加载，从而会被bufferline插件在默认设置为showtabline = 2始终显示
--从而可以直接将这一个配置写在这个文件末尾（加载插件之后）--vim.opt.showtabline = 1(两个及以上显示)
--或者在bufferline配置中加入always_show_bufferline = false,
--也可以写一个自动命令，让打开dashboard的时候才不现实
require("core.options")
require("core.keymaps")
require("core.lazy")
require("core.basic")
