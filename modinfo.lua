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
        name = "language",
        hover = "default zh-s",
        options = { {
            description = "Chinese (Simplified)",
            hover = "zh",
            data = true
        }, {
            description = "English",
            hover = "en",
            data = false
        } },
        default = true
    },
    {
        name = "radius",
        hover = "10",
        options = {
            {
                description = "10",
                hover = "10",
                data = 10
            },
            {
                description = "15",
                hover = "15",
                data = 15
            },
            {
                description = "20",
                hover = "20",
                data = 20
            }
        },
        default = 10
    }
}
