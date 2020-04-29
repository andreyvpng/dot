import json
import os

c = c  # type: ConfigContainer # noqa: F821

home = os.getenv('HOME')
colors_relative = '.config/just-colors/cache/colors.json'
colors_absolute = os.path.join(home, colors_relative)

def get_color(name_of_color):
    return "#" + colors[name_of_color]

if os.path.isfile(colors_absolute):
    with open(colors_absolute) as colorfile:
        colors = json.load(colorfile)

    # Background color of the completion widget category headers.
    # Type: QssColor
    c.colors.completion.category.bg = get_color("base00")

    # Bottom border color of the completion widget category headers.
    # Type: QssColor
    c.colors.completion.category.border.bottom = get_color("base01")

    # Top border color of the completion widget category headers.
    # Type: QssColor
    c.colors.completion.category.border.top = get_color("base01")

    # Foreground color of completion widget category headers.
    # Type: QtColor
    c.colors.completion.category.fg = get_color("base0B")

    # Background color of the completion widget for even rows.
    # Type: QssColor
    c.colors.completion.even.bg = get_color("base00")

    # Background color of the completion widget for odd rows.
    # Type: QssColor
    c.colors.completion.odd.bg = get_color("base00")

    # Text color of the completion widget.
    # Type: QtColor
    c.colors.completion.fg = get_color("base05")

    # Background color of the selected completion item.
    # Type: QssColor
    c.colors.completion.item.selected.bg = get_color("base0B")

    # Bottom border color of the selected completion item.
    # Type: QssColor
    c.colors.completion.item.selected.border.bottom = get_color("base01")

    # Top border color of the completion widget category headers.
    # Type: QssColor
    c.colors.completion.item.selected.border.top = get_color("base01")

    # Foreground color of the selected completion item.
    # Type: QtColor
    c.colors.completion.item.selected.fg = get_color("base01")

    # Foreground color of the matched text in the completion.
    # Type: QssColor
    c.colors.completion.match.fg = get_color("base0B")

    # Color of the scrollbar in completion view
    # Type: QssColor
    c.colors.completion.scrollbar.bg = get_color("base00")

    # Color of the scrollbar handle in completion view.
    # Type: QssColor
    c.colors.completion.scrollbar.fg = get_color("base01")

    # Background color for the download bar.
    # Type: QssColor
    c.colors.downloads.bar.bg = get_color("base00")

    # Background color for downloads with errors.
    # Type: QtColor
    c.colors.downloads.error.bg = get_color("base08")

    # Foreground color for downloads with errors.
    # Type: QtColor
    c.colors.downloads.error.fg = get_color("base00")

    # Color gradient stop for download backgrounds.
    # Type: QtColor
    c.colors.downloads.stop.bg = get_color("base0B")

    # Color gradient interpolation system for download backgrounds.
    # Type: ColorSystem
    # Valid values:
    #   - rgb: Interpolate in the RGB color system.
    #   - hsv: Interpolate in the HSV color system.
    #   - hsl: Interpolate in the HSL color system.
    #   - none: Don't show a gradient.
    c.colors.downloads.system.bg = 'rgb'

    # Background color for hints. Note that you can use a `rgba(...)` value
    # for transparency.
    # Type: QssColor
    c.colors.hints.bg = get_color("base00")

    # Font color for hints.
    # Type: QssColor
    c.colors.hints.fg = get_color("base0D")

    # TODO
    #c.colors.hints.border= bg
    #1px solid #E3BE23

    c.hints.border = '1px solid ' + get_color("base00")

    # Font color for the matched part of hints.
    # Type: QssColor
    c.colors.hints.match.fg = get_color("base07")

    # Background color of the keyhint widget.
    # Type: QssColor
    c.colors.keyhint.bg = get_color("base00")

    # Text color for the keyhint widget.
    # Type: QssColor
    c.colors.keyhint.fg = get_color("base0D")

    # Highlight color for keys to complete the current keychain.
    # Type: QssColor
    c.colors.keyhint.suffix.fg = get_color("base0B")

    # Background color of an error message.
    # Type: QssColor
    c.colors.messages.error.bg = get_color("base08")

    # Border color of an error message.
    # Type: QssColor
    c.colors.messages.error.border = get_color("base08")

    # Foreground color of an error message.
    # Type: QssColor
    c.colors.messages.error.fg = get_color("base00")

    # Background color of an info message.
    # Type: QssColor
    c.colors.messages.info.bg = get_color("base00")

    # Border color of an info message.
    # Type: QssColor
    c.colors.messages.info.border = get_color("base00")

    # Foreground color an info message.
    # Type: QssColor
    c.colors.messages.info.fg = get_color("base06")

    # Background color of a warning message.
    # Type: QssColor
    c.colors.messages.warning.bg = get_color("base09")

    # Border color of a warning message.
    # Type: QssColor
    c.colors.messages.warning.border = get_color("base09")

    # Foreground color a warning message.
    # Type: QssColor
    c.colors.messages.warning.fg = get_color("base00")

    # Background color for prompts.
    # Type: QssColor
    c.colors.prompts.bg = get_color("base00")

    # Border used around UI elements in prompts.
    # Type: String
    c.colors.prompts.border = '1px solid ' + get_color("base00")

    # Foreground color for prompts.
    # Type: QssColor
    c.colors.prompts.fg = get_color("base06")

    # Background color for the selected item in filename prompts.
    # Type: QssColor
    c.colors.prompts.selected.bg = get_color("base0D")

    # Background color of the statusbar in caret mode.
    # Type: QssColor
    # TODO
    c.colors.statusbar.caret.bg = get_color("base01")

    # Foreground color of the statusbar in caret mode.
    # Type: QssColor
    c.colors.statusbar.caret.fg = get_color("base05")

    # Background color of the statusbar in caret mode with a selection.
    # Type: QssColor
    c.colors.statusbar.caret.selection.bg = get_color("base01")

    # Foreground color of the statusbar in caret mode with a selection.
    # Type: QssColor
    c.colors.statusbar.caret.selection.fg = get_color("base05")

    # Background color of the statusbar in command mode.
    # Type: QssColor
    c.colors.statusbar.command.bg = get_color("base00")

    # Foreground color of the statusbar in command mode.
    # Type: QssColor
    c.colors.statusbar.command.fg = get_color("base05")

    # Background color of the statusbar in private browsing + command mode.
    # Type: QssColor
    c.colors.statusbar.command.private.bg = get_color("base00")

    # Foreground color of the statusbar in private browsing + command mode.
    # Type: QssColor
    c.colors.statusbar.command.private.fg = get_color("base05")

    # Background color of the statusbar in insert mode.
    # Type: QssColor
    c.colors.statusbar.insert.bg = get_color("base0B")

    # Foreground color of the statusbar in insert mode.
    # Type: QssColor
    c.colors.statusbar.insert.fg = get_color("base00")

    # Background color of the statusbar.
    # Type: QssColor
    c.colors.statusbar.normal.bg = get_color("base00")

    # Foreground color of the statusbar.
    # Type: QssColor
    c.colors.statusbar.normal.fg = get_color("base06")

    # Background color of the statusbar in passthrough mode.
    # Type: QssColor
    c.colors.statusbar.passthrough.bg = get_color("base00")

    # Foreground color of the statusbar in passthrough mode.
    # Type: QssColor
    c.colors.statusbar.passthrough.fg = get_color("base06")

    # Background color of the statusbar in private browsing mode.
    # Type: QssColor
    c.colors.statusbar.private.bg = get_color("base00")

    # Foreground color of the statusbar in private browsing mode.
    # Type: QssColor
    c.colors.statusbar.private.fg = get_color("base06")

    # Background color of the progress bar.
    # Type: QssColor
    c.colors.statusbar.progress.bg = get_color("base06")

    # Foreground color of the URL in the statusbar on error.
    # Type: QssColor
    c.colors.statusbar.url.error.fg = get_color("base08")

    # Default foreground color of the URL in the statusbar.
    # Type: QssColor
    c.colors.statusbar.url.fg = get_color("base00")

    # Foreground color of the URL in the statusbar for hovered links.
    # Type: QssColor
    c.colors.statusbar.url.hover.fg = get_color("base05")

    # Foreground color of the URL in the statusbar on successful load
    # (http).
    # Type: QssColor
    c.colors.statusbar.url.success.http.fg = get_color("base05")

    # Foreground color of the URL in the statusbar on successful load
    # (https).
    # Type: QssColor
    c.colors.statusbar.url.success.https.fg = get_color("base05")

    # Foreground color of the URL in the statusbar when there's a warning.
    # Type: QssColor
    c.colors.statusbar.url.warn.fg = get_color("base08")

    # Background color of the tab bar.
    # Type: QtColor
    c.colors.tabs.bar.bg = get_color("base00")

    # Background color of unselected even tabs.
    # Type: QtColor
    c.colors.tabs.even.bg = get_color("base00")

    # Foreground color of unselected even tabs.
    # Type: QtColor
    c.colors.tabs.even.fg = get_color("base06")

    # Color for the tab indicator on errors.
    # Type: QtColor
    c.colors.tabs.indicator.error = get_color("base08")

    # Color gradient start for the tab indicator.
    # Type: QtColor
    c.colors.tabs.indicator.start = get_color("base00")

    # Color gradient end for the tab indicator.
    # Type: QtColor
    c.colors.tabs.indicator.stop = get_color("base00")

    # Color gradient interpolation system for the tab indicator.
    # Type: ColorSystem
    # Valid values:
    #   - rgb: Interpolate in the RGB color system.
    #   - hsv: Interpolate in the HSV color system.
    #   - hsl: Interpolate in the HSL color system.
    #   - none: Don't show a gradient.
    c.colors.tabs.indicator.system = 'none'

    # Background color of unselected odd tabs.
    # Type: QtColor
    c.colors.tabs.odd.bg = get_color("base00")

    # Foreground color of unselected odd tabs.
    # Type: QtColor
    c.colors.tabs.odd.fg = get_color("base06")

    # Background color of selected even tabs.
    # Type: QtColor
    c.colors.tabs.selected.even.bg = get_color("base0D")

    # Foreground color of selected even tabs.
    # Type: QtColor
    c.colors.tabs.selected.even.fg = get_color("base00")

    # Background color of selected odd tabs.
    # Type: QtColor
    c.colors.tabs.selected.odd.bg = get_color("base0D")

    # Foreground color of selected odd tabs.
    # Type: QtColor
    c.colors.tabs.selected.odd.fg = get_color("base00")
