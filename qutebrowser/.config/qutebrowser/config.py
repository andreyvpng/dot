from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401
config = config  # type: ConfigAPI # noqa: F821
c = c  # type: ConfigContainer # noqa: F821

import subprocess

def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props

xresources = read_xresources('*')

base00 = xresources['*i3wm_00']
base01 = xresources['*i3wm_01']
base02 = xresources['*i3wm_02']
base03 = xresources['*i3wm_03']
base04 = xresources['*i3wm_04']
base05 = xresources['*i3wm_05']
base06 = xresources['*i3wm_06']
base07 = xresources['*i3wm_07']
base08 = xresources['*i3wm_08']
base09 = xresources['*i3wm_09']
base0A = xresources['*i3wm_0A']
base0B = xresources['*i3wm_0B']
base0C = xresources['*i3wm_0C']
base0D = xresources['*i3wm_0D']
base0E = xresources['*i3wm_0E']
base0F = xresources['*i3wm_0F']

# set qutebrowser colors
c.colors.completion.fg = base05
c.colors.completion.odd.bg = base00
c.colors.completion.even.bg = base00
c.colors.completion.category.fg = base0A
c.colors.completion.category.bg = base00
c.colors.completion.category.border.top = base00
c.colors.completion.category.border.bottom = base00
c.colors.completion.item.selected.fg = base01
c.colors.completion.item.selected.bg = base0A
c.colors.completion.item.selected.border.top = base0A
c.colors.completion.item.selected.border.bottom = base0A
c.colors.completion.item.selected.match.fg = base08
c.colors.completion.match.fg = base0B
c.colors.completion.scrollbar.fg = base05
c.colors.completion.scrollbar.bg = base00

c.colors.contextmenu.menu.bg = base00
c.colors.contextmenu.menu.fg =  base05
c.colors.contextmenu.selected.bg = base0A
c.colors.contextmenu.selected.fg = base01

c.colors.downloads.bar.bg = base00
c.colors.downloads.start.fg = base00
c.colors.downloads.start.bg = base0D
c.colors.downloads.stop.fg = base00
c.colors.downloads.stop.bg = base0C
c.colors.downloads.error.fg = base08

# Font color for hints.
c.colors.hints.fg = base00
c.colors.hints.bg = base0D
c.colors.hints.match.fg = base0D

c.colors.keyhint.fg = base05
c.colors.keyhint.suffix.fg = base0D
c.colors.keyhint.bg = base00

c.colors.messages.error.fg = base00
c.colors.messages.error.bg = base08
c.colors.messages.error.border = base08
c.colors.messages.warning.fg = base00
c.colors.messages.warning.bg = base0E
c.colors.messages.warning.border = base0E
c.colors.messages.info.fg = base05
c.colors.messages.info.bg = base00
c.colors.messages.info.border = base00

c.colors.prompts.fg = base05
c.colors.prompts.border = base00
c.colors.prompts.bg = base00
c.colors.prompts.selected.bg = base0A

c.colors.statusbar.normal.fg = base0B
c.colors.statusbar.normal.bg = base00
c.colors.statusbar.insert.fg = base00
c.colors.statusbar.insert.bg = base0D
c.colors.statusbar.passthrough.fg = base00
c.colors.statusbar.passthrough.bg = base0C
c.colors.statusbar.private.fg = base00
c.colors.statusbar.private.bg = base03
c.colors.statusbar.command.fg = base05
c.colors.statusbar.command.bg = base00
c.colors.statusbar.command.private.fg = base05
c.colors.statusbar.command.private.bg = base00
c.colors.statusbar.caret.fg = base00
c.colors.statusbar.caret.bg = base0E
c.colors.statusbar.caret.selection.fg = base00
c.colors.statusbar.caret.selection.bg = base0D
c.colors.statusbar.progress.bg = base0D
c.colors.statusbar.url.fg = base05
c.colors.statusbar.url.error.fg = base08
c.colors.statusbar.url.hover.fg = base05
c.colors.statusbar.url.success.http.fg = base0C
c.colors.statusbar.url.success.https.fg = base0B
c.colors.statusbar.url.warn.fg = base0E

c.colors.tabs.bar.bg = base00
c.colors.tabs.indicator.start = base0D
c.colors.tabs.indicator.stop = base0C
c.colors.tabs.indicator.error = base08
c.colors.tabs.odd.fg = base05
c.colors.tabs.odd.bg = base00
c.colors.tabs.even.fg = base05
c.colors.tabs.even.bg = base00
c.colors.tabs.pinned.even.bg = base0C
c.colors.tabs.pinned.even.fg = base07
c.colors.tabs.pinned.odd.bg = base0B
c.colors.tabs.pinned.odd.fg = base07
c.colors.tabs.pinned.selected.even.bg = base05
c.colors.tabs.pinned.selected.even.fg = base00
c.colors.tabs.pinned.selected.odd.bg = base05
c.colors.tabs.pinned.selected.odd.fg = base0E
c.colors.tabs.selected.odd.fg = base00
c.colors.tabs.selected.odd.bg = base0D
c.colors.tabs.selected.even.fg = base00
c.colors.tabs.selected.even.bg = base0D

# Background color for webpages if unset (or empty to use the theme's
# color).
c.colors.webpage.bg = base00

c.content.geolocation = False
c.url.start_pages = ['qute://bookmarks']
c.session.lazy_restore = True

# Settings
# webengine based on chromium
c.backend = 'webengine'
config.set('content.headers.user_agent', "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0")
# confirm when write :q
c.confirm_quit = ['always']

# use 0..9 to switch tab
for i in range(1, 10):
    config.bind(str(i), 'buffer ' + str(i), mode='normal')
config.bind('0', 'buffer 10', mode='normal')

# TOR
def bind_chained(key, *commands):
    config.bind(key, ' ;; '.join(commands))

bind_chained('te', 'set content.proxy socks://localhost:9050/', 'message-info "tor enable"');
bind_chained('td', 'set content.proxy system', 'message-info "tor disable"');

config.bind('<Ctrl-E>', 'open-editor', mode='insert')
