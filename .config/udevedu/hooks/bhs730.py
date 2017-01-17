from udevedu.utils import invoke
import os

def check(action, device):
    return device.get('NAME') == '00:14:BE:88:3A:CD'

def update():
    os.system('pacmd set-card-profile "bluez_card.00_14_BE_88_3A_CD" a2dp_sink')

def init():
    pass

def react(action, device):
    update()

