group "default" {
    targets = ["papercut_image"]
}

target "papercut_image" {
    name = "papercut_ng_mf-${replace(versions.ver, ".","_")}"
    matrix = {
        versions = [
        // Vulnerable images
        { 
            major_ver = "19.x"
            ver = "19.2.7.62195"
        }, {
            major_ver = "20.x"
            ver = "20.1.4.57927"
        }, {
            major_ver = "21.x"
            ver = "21.2.10.62186"
        }, {
            major_ver = "22.x"
            ver = "22.0.1.62695"
        },

        // Non-Vulnerable images
        {
            major_ver = "20.x"
            ver = "20.1.8.66704"
        }, {
            major_ver = "21.x"
            ver = "21.2.12.66701"
        }, {
            major_ver = "22.x"
            ver = "22.0.12.66453"
        }
          ]
    }

    dockerfile = "Dockerfile"
    tags = ["ghcr.io/isaac-gc/papercut_ng_mf:${versions.ver}"]
    args = {
        PAPERCUT_MAJOR_VER = versions.major_ver
        PAPERCUT_VERSION = versions.ver
    }
}

