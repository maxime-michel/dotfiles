c.tabs.background = True
c.editor.command = ["mvim", "-f", "{}"]

# content
c.url.default_page = "about:blank"
c.url.start_pages = ["https://mail.protonmail.com/login"]
c.content.cookies.store = False
c.content.canvas_reading = False
c.content.geolocation = False
c.content.notifications = False
c.content.media_capture = False

# looks
c.qt.highdpi = True
c.tabs.title.format = "{current_title}"
c.completion.height = "30%"
c.completion.web_history.max_items = 1000

# downloads
c.downloads.location.directory = "~/Desktop/"
c.downloads.remove_finished = 10000
c.downloads.location.prompt = False
c.prompt.filebrowser = False

# search
c.url.searchengines["DEFAULT"] = "https://www.startpage.com/do/dsearch?query={}&cat=web&pl=opensearch&language=english"
c.url.searchengines["j"] = 'https://jira.magnolia-cms.com/secure/QuickSearch.jspa?searchString={}'

# bindings
config.bind('t', 'set-cmd-text -s :open -t')
config.bind('O', 'set-cmd-text :open {url:pretty}')
config.bind('gT', 'tab-prev')
config.bind('gt', 'tab-next')
config.bind('x', 'tab-close')
config.unbind('q')
config.unbind('b')
config.unbind('B')
config.unbind('gb')
config.unbind('d')
config.unbind('T')
config.unbind('m')
config.unbind('M')

# sane tab colors
c.colors.tabs.selected.odd.fg = 'black'
c.colors.tabs.selected.odd.bg = 'white'
c.colors.tabs.selected.even.fg = 'black'
c.colors.tabs.selected.even.bg = 'white'
c.colors.tabs.even.bg = 'grey'

# fonts
c.fonts.tabs = '14pt monospace'
c.fonts.completion.entry = c.fonts.tabs
c.fonts.debug_console = c.fonts.tabs
c.fonts.downloads = c.fonts.tabs
c.fonts.keyhint = c.fonts.tabs
c.fonts.messages.error = c.fonts.tabs
c.fonts.messages.info = c.fonts.tabs
c.fonts.messages.warning = c.fonts.tabs
c.fonts.statusbar = c.fonts.tabs
c.fonts.hints = 'bold 14pt monospace'
c.fonts.completion.category = c.fonts.hints
c.fonts.prompts = '14pt sans-serif'
