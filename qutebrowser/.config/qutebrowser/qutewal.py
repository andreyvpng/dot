import json
import os

c = c  # type: ConfigContainer # noqa: F821

home = os.getenv('HOME')
colors_relative = '.cache/wal/colors.json'
colors_absolute = os.path.join(home, colors_relative)

if os.path.isfile(colors_absolute):
    with open(colors_absolute) as colorfile:
        colors = json.load(colorfile)

    bg = colors['colors']['color0']
    fg = colors['colors']['color7']

    sel = colors['colors']['color2']
    urgent =colors['colors']['color1']

    # Background color of the completion widget category headers.
    # Type: QssColor
    c.colors.completion.category.bg = bg

    # Bottom border color of the completion widget category headers.
    # Type: QssColor
    c.colors.completion.category.border.bottom = bg

    # Top border color of the completion widget category headers.
    # Type: QssColor
    c.colors.completion.category.border.top = bg

    # Foreground color of completion widget category headers.
    # Type: QtColor
    c.colors.completion.category.fg = bg

    # Background color of the completion widget for even rows.
    # Type: QssColor
    c.colors.completion.even.bg = bg

    # Background color of the completion widget for odd rows.
    # Type: QssColor
    c.colors.completion.odd.bg = bg

    # Text color of the completion widget.
    # Type: QtColor
    c.colors.completion.fg = fg

    # Background color of the selected completion item.
    # Type: QssColor
    c.colors.completion.item.selected.bg = sel

    # Bottom border color of the selected completion item.
    # Type: QssColor
    c.colors.completion.item.selected.border.bottom = bg

    # Top border color of the completion widget category headers.
    # Type: QssColor
    c.colors.completion.item.selected.border.top = bg

    # Foreground color of the selected completion item.
    # Type: QtColor
    c.colors.completion.item.selected.fg = bg

    # Foreground color of the matched text in the completion.
    # Type: QssColor
    c.colors.completion.match.fg = sel

    # Color of the scrollbar in completion view
    # Type: QssColor
    c.colors.completion.scrollbar.bg = bg

    # Color of the scrollbar handle in completion view.
    # Type: QssColor
    c.colors.completion.scrollbar.fg = fg

    # Background color for the download bar.
    # Type: QssColor
    c.colors.downloads.bar.bg = bg

    # Background color for downloads with errors.
    # Type: QtColor
    c.colors.downloads.error.bg = urgent

    # Foreground color for downloads with errors.
    # Type: QtColor
    c.colors.downloads.error.fg = bg

    # Color gradient stop for download backgrounds.
    # Type: QtColor
    # TODO
    c.colors.downloads.stop.bg = colors['colors']['color6']

    # Color gradient interpolation system for download backgrounds.
    # Type: ColorSystem
    # Valid values:
    #   - rgb: Interpolate in the RGB color system.
    #   - hsv: Interpolate in the HSV color system.
    #   - hsl: Interpolate in the HSL color system.
    #   - none: Don't show a gradient.
    c.colors.downloads.system.bg = 'none'

    # Background color for hints. Note that you can use a `rgba(...)` value
    # for transparency.
    # Type: QssColor
    c.colors.hints.bg = bg

    # Font color for hints.
    # Type: QssColor
    c.colors.hints.fg = sel

    # TODO
    #c.colors.hints.border= bg
    #1px solid #E3BE23

    c.hints.border = '1px solid ' + bg

    # Font color for the matched part of hints.
    # Type: QssColor
    # TODO
    c.colors.hints.match.fg = colors['colors']['color4']

    # Background color of the keyhint widget.
    # Type: QssColor
    c.colors.keyhint.bg = bg

    # Text color for the keyhint widget.
    # Type: QssColor
    c.colors.keyhint.fg = fg

    # Highlight color for keys to complete the current keychain.
    # Type: QssColor
    c.colors.keyhint.suffix.fg = sel

    # Background color of an error message.
    # Type: QssColor
    c.colors.messages.error.bg = urgent

    # Border color of an error message.
    # Type: QssColor
    c.colors.messages.error.border = urgent

    # Foreground color of an error message.
    # Type: QssColor
    c.colors.messages.error.fg = bg

    # Background color of an info message.
    # Type: QssColor
    c.colors.messages.info.bg = bg

    # Border color of an info message.
    # Type: QssColor
    c.colors.messages.info.border = bg

    # Foreground color an info message.
    # Type: QssColor
    c.colors.messages.info.fg = fg

    # Background color of a warning message.
    # Type: QssColor
    c.colors.messages.warning.bg = urgent

    # Border color of a warning message.
    # Type: QssColor
    c.colors.messages.warning.border = urgent

    # Foreground color a warning message.
    # Type: QssColor
    c.colors.messages.warning.fg = bg

    # Background color for prompts.
    # Type: QssColor
    c.colors.prompts.bg = bg

    # # Border used around UI elements in prompts.
    # # Type: String
    c.colors.prompts.border = '1px solid ' + bg

    # Foreground color for prompts.
    # Type: QssColor
    c.colors.prompts.fg = fg

    # Background color for the selected item in filename prompts.
    # Type: QssColor
    # TODO
    c.colors.prompts.selected.bg = colors['colors']['color5']

    # Background color of the statusbar in caret mode.
    # Type: QssColor
    # TODO
    c.colors.statusbar.caret.bg = colors['colors']['color6']

    # Foreground color of the statusbar in caret mode.
    # Type: QssColor
    c.colors.statusbar.caret.fg = colors['special']['cursor']

    # Background color of the statusbar in caret mode with a selection.
    # Type: QssColor
    c.colors.statusbar.caret.selection.bg = colors['colors']['color6']

    # Foreground color of the statusbar in caret mode with a selection.
    # Type: QssColor
    c.colors.statusbar.caret.selection.fg = fg

    # Background color of the statusbar in command mode.
    # Type: QssColor
    c.colors.statusbar.command.bg = bg

    # Foreground color of the statusbar in command mode.
    # Type: QssColor
    c.colors.statusbar.command.fg = fg

    # Background color of the statusbar in private browsing + command mode.
    # Type: QssColor
    c.colors.statusbar.command.private.bg = bg

    # Foreground color of the statusbar in private browsing + command mode.
    # Type: QssColor
    c.colors.statusbar.command.private.fg = fg

    # Background color of the statusbar in insert mode.
    # Type: QssColor
    c.colors.statusbar.insert.bg = sel

    # Foreground color of the statusbar in insert mode.
    # Type: QssColor
    c.colors.statusbar.insert.fg = bg

    # Background color of the statusbar.
    # Type: QssColor
    c.colors.statusbar.normal.bg = bg

    # Foreground color of the statusbar.
    # Type: QssColor
    c.colors.statusbar.normal.fg = fg

    # Background color of the statusbar in passthrough mode.
    # Type: QssColor
    c.colors.statusbar.passthrough.bg = bg

    # Foreground color of the statusbar in passthrough mode.
    # Type: QssColor
    c.colors.statusbar.passthrough.fg = fg

    # Background color of the statusbar in private browsing mode.
    # Type: QssColor
    c.colors.statusbar.private.bg = bg

    # Foreground color of the statusbar in private browsing mode.
    # Type: QssColor
    c.colors.statusbar.private.fg = fg

    # Background color of the progress bar.
    # Type: QssColor
    c.colors.statusbar.progress.bg = fg

    # Foreground color of the URL in the statusbar on error.
    # Type: QssColor
    c.colors.statusbar.url.error.fg = urgent

    # Default foreground color of the URL in the statusbar.
    # Type: QssColor
    c.colors.statusbar.url.fg = bg

    # Foreground color of the URL in the statusbar for hovered links.
    # Type: QssColor
    c.colors.statusbar.url.hover.fg = colors['colors']['color4']

    # Foreground color of the URL in the statusbar on successful load
    # (http).
    # Type: QssColor
    c.colors.statusbar.url.success.http.fg = fg

    # Foreground color of the URL in the statusbar on successful load
    # (https).
    # Type: QssColor
    c.colors.statusbar.url.success.https.fg = colors['colors']['color2']

    # Foreground color of the URL in the statusbar when there's a warning.
    # Type: QssColor
    c.colors.statusbar.url.warn.fg = urgent

    # Background color of the tab bar.
    # Type: QtColor
    c.colors.tabs.bar.bg = bg

    # Background color of unselected even tabs.
    # Type: QtColor
    c.colors.tabs.even.bg = bg

    # Foreground color of unselected even tabs.
    # Type: QtColor
    c.colors.tabs.even.fg = fg

    # Color for the tab indicator on errors.
    # Type: QtColor
    c.colors.tabs.indicator.error = urgent

    # Color gradient start for the tab indicator.
    # Type: QtColor
    # c.colors.tabs.indicator.start = urgent

    # Color gradient end for the tab indicator.
    # Type: QtColor
    # c.colors.tabs.indicator.stop = urgent

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
    c.colors.tabs.odd.bg = bg

    # Foreground color of unselected odd tabs.
    # Type: QtColor
    c.colors.tabs.odd.fg = fg

    # Background color of selected even tabs.
    # Type: QtColor
    c.colors.tabs.selected.even.bg = sel

    # Foreground color of selected even tabs.
    # Type: QtColor
    c.colors.tabs.selected.even.fg = bg

    # Background color of selected odd tabs.
    # Type: QtColor
    c.colors.tabs.selected.odd.bg = sel

    # Foreground color of selected odd tabs.
    # Type: QtColor
    c.colors.tabs.selected.odd.fg = bg
