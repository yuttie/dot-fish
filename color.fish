# Extracted from /usr/share/fish/functions/__fish_config_interactive.fish
# See also https://fishshell.com/docs/current/index.html#variables-color

# Regular syntax highlighting colors
# XXX - not quite the same as default colors in web config. Sync these up.
set -U fish_color_normal normal
set -U fish_color_command brblue --bold
set -U fish_color_param white
set -U fish_color_redirection brcyan
set -U fish_color_comment brblack
set -U fish_color_error brred
set -U fish_color_escape bryellow
set -U fish_color_operator brgreen
set -U fish_color_end brmagenta
set -U fish_color_quote brblue
set -U fish_color_autosuggestion brblack
set -U fish_color_user brgreen

set -U fish_color_host normal
set -U fish_color_valid_path --underline

set -U fish_color_cwd green
set -U fish_color_cwd_root red

# Background color for matching quotes and parenthesis
set -U fish_color_match --background=brblue

# Background color for search matches
set -U fish_color_search_match --background=brblack

# Background color for selections
set -U fish_color_selection white --bold --background=brblack

set -U fish_color_cancel --reverse

# Pager colors
set -U fish_pager_color_prefix cyan --bold
set -U fish_pager_color_completion
set -U fish_pager_color_description blue
set -U fish_pager_color_progress brwhite --background=blue

#
# Directory history colors
#
set -U fish_color_history_current --bold
