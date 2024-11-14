OS="$(uname -s)"  # Linux, Darwin
NVIM_REPO="https://github.com/realphongha/nvim-configs.git"
NVIM_CFG_PATH="~/.config/nvim"
NVIM_DATA_PATH="~/.local/share/nvim"

while true; do
    read -p "Do you wish to install Neovim configs (older configs will be overwritten)? " yn
    case $yn in
        [Yy]* ) rm -rf $NVIM_CFG_PATH; rm -rf $NVIM_DATA_PATH; git clone $NVIM_REPO $NVIM_CFG_PATH; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

