from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401
config = config  # type: ConfigAPI # noqa: F821
c = c  # type: ConfigContainer # noqa: F821

import subprocess

# Settings
# webengine based on chromium
c.backend = 'webengine'
config.set('content.headers.user_agent', "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0")

c.tabs.max_width = 250

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

config.source('justwal.py')
