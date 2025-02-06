OS="$(uname -s)"  # Linux, Darwin
NVIM_REPO="https://github.com/realphongha/nvim-configs.git"
NVIM_CFG_PATH="$HOME/.config/nvim"
NVIM_DATA_PATH="$HOME/.local/share/nvim"
GIT_CFG_PATH=$HOME/.gitconfig
TMUX_CFG_PATH=$HOME/.tmux.conf
YAZI_CFG_PATH=$HOME/yazi

# neovim
while true; do
    read -p "Do you wish to install Neovim configs (older configs will be overwritten) (y/n)? " yn
    case $yn in
        [Yy]* ) rm -rf $NVIM_CFG_PATH; rm -rf $NVIM_DATA_PATH; git clone $NVIM_REPO $NVIM_CFG_PATH; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# git
rm -f $GIT_CFG_PATH
cp $(pwd)/.gitconfig $GIT_CFG_PATH

# tmux
if [ ! -d ~/.tmux/plugins/tpm ] ; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
rm -f $TMUX_CFG_PATH
cp $(pwd)/.tmux.conf $TMUX_CFG_PATH

# yazi
rm -rf $YAZI_CFG_PATH
mkdir -p $YAZI_CFG_PATH
cp $(pwd)/yazi/* $YAZI_CFG_PATH
