OS="$(uname -s)"  # Linux, Darwin
NVIM_REPO="https://github.com/realphongha/nvim-configs.git"
NVIM_CFG_PATH="~/.config/nvim"
NVIM_DATA_PATH="~/.local/share/nvim"
TMUX_CFG_PATH="~/.tmux.conf"
WEZTERM_CFG_PATH="~/.wezterm.lua"
AEROSPACE_CFG_PATH="~/.aerospace.toml"

# neovim
while true; do
    read -p "Do you wish to install Neovim configs (older configs will be overwritten)? " yn
    case $yn in
        [Yy]* ) rm -rf $NVIM_CFG_PATH; rm -rf $NVIM_DATA_PATH; git clone $NVIM_REPO $NVIM_CFG_PATH; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# tmux
if [ ! -d ~/.tmux/plugins/tpm ] ; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
rm $TMUX_CFG_PATH
cp .tmux.conf $TMUX_CFG_PATH

# wezterm
rm $WEZTERM_CFG_PATH
cp .wezterm.lua $WEZTERM_CFG_PATH

# aerospace
if [ $OS = "Darwin" ]; then
    rm $AEROSPACE_CFG_PATH
    cp .aerospace.toml $AEROSPACE_CFG_PATH
fi
