name = "PredictBossAnnouncement"
description = "predict boss arrived and say to everyone is closest or not."
author = "Once"
version = "1.0.0"
forumthread = ""
icon_atlas = "modicon.xml"
icon = "modicon.tex"
dst_compatible = true
client_only_mod = false
all_clients_require_mod = true
api_version = 10
configuration_options = {
    {
        name = "radius",
        hover = "查找半径",
        options = {
            {
                description = "35",
                hover = "冰眼结晶器",
                data = 35
            },
            {
                description = "45",
                hover = "cpu咆哮半径",
                data = 45
            }
        },
        default = 35
    }
}
