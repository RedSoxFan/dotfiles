from udevedu.utils import invoke


def check(action, device):
    return device.get('DEVTYPE') == 'drm_minor'

def update():
    with open("/sys/class/drm/card0-HDMI-A-2/status", "r") as f:
        status = f.read().strip()
        if status == "connected":
            dis = "xrandr --output HDMI2 --mode 1920x1080 --pos 1980x0"
            aud = "pactl set-default-sink Laptop"
        else:
            dis = "xrandr --output HDMI2 --off"
            aud = "pactl set-default-sink Laptop"
        invoke(*dis.split(" "))
        invoke(*aud.split(" "))
        invoke("fbsetbg", "-F",  "/home/brian/.wallpaper")

def init():
    update()

def react(action, device):
    update()

