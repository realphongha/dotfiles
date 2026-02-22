# check if rsync is installed
if ! command -v rsync &> /dev/null
then
    echo "rsync is not installed. Please install it and try again."
    exit 1
fi
OS="$(uname -s)"  # Linux, Darwin
AEROSPACE_PATH="$HOME/.aerospace.toml"
WEZTERM_PATH="$HOME/.wezterm.lua"

# ~/.config
rsync -a $(pwd)/.config/ $HOME/.config/

# aerospace
rsync -a $(pwd)/.aerospace.toml $AEROSPACE_PATH

# wezterm
rsync -a $(pwd)/.wezterm.lua $WEZTERM_PATH
