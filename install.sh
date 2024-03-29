git config --global user.email "vilhelm.lindell123@gmail.com"
git config --global user.name "Vilhelm"

git submodule update --init --recursive

ln -sf $PWD/fish ~/.config
ln -sf $PWD/NvChad ~/.config/nvim
ln -sf $PWD/nvchad-config $PWD/NvChad/lua/custom
ln -sf $PWD/picom ~/.config
ln -sf $PWD/tmux ~/.config
ln -sf $PWD/alacritty ~/.config
ln -sf $PWD/i3blocks ~/.config
ln -sf $PWD/dunst ~/.config
ln -sf $PWD/zellij ~/.config
sudo ln -sf $PWD/auto-cpufreq/auto-cpufreq.conf /etc/

yay -S fish --noconfirm
yay -S which --noconfirm
chsh -s $(which fish)
curl -sS https://starship.rs/install.sh | sh

yay -S zoxide --noconfirm
yay -S fzf --noconfirm

yay -S picom --noconfirm

yay -S wezterm --noconfirm
yay -S fd --noconfirm

yay -S tmux --noconfirm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

yay -S zellij --noconfirm

yay -S neovim --noconfirm
yay -S thermald --noconfirm
sudo systemctl enable thermald.service

# For getting pyright to work
python3 -m venv ~/venvs/.nvim-venv && source ~/venvs/.nvim-venv/bin/activate.fish && python3 -m pip install pynvim && which python

yay -S xclip --noconfirm
yay -S ripgrep --noconfirm
yay -S npm --noconfirm
yay -S ttf-jetbrains-mono-nerd --noconfirm
yay -S noto-fonts-emoji --noconfirm
yay -S xkblayout-state --noconfirm
yay -S throttled --noconfirm
sudo systemctl enable --now throttled.service
yay -S thinkfan --noconfirm
yay -S glsl_analyzer-bin --noconfirm

yay -S ghc --noconfirm
yay -S ghcup-hs-bin --noconfirm
yay -S stack --noconfirm
yay -S hoogle --noconfirm
yay -S haskell-fast-tags --noconfirm

stack install haskell-dap ghci-dap haskell-debug-adapter
stack install ghcid
fish_add_path /home/vilhelm/.local/bin
hoogle generate

yay -S rustup --noconfirm
rustup default nightly

yay -S jre-openjdk --noconfirm
yay -S maven --noconfirm

yay -S evremap-git --noconfirm
sudo cp evremap/evremap.service /usr/lib/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable evremap/evremap.service
sudo systemctl start evremap/evremap.service

yay -S vibrant-cli --noconfirm
yay -S tp-battery-mode --noconfirm
yay -S neovide --noconfirm

# Run ssh_key.sh in order for this to work
git remote set-url origin git@github.com:vilhelmlindell/dotfiles.git

systemctl enable bluetooth.service
