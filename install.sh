yay -S fish --noconfirm
yay -S which --noconfirm
chsh -s $(which fish)
curl -sS https://starship.rs/install.sh | sh

yay -S picom --noconfirm

yay -S neovim --noconfirm
yay -S xclip --noconfirm
yay -S ripgrep --noconfirm
yay -S npm --noconfirm

yay -S alacritty --noconfirm

yay -S tmux --noconfirm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

yay -S rustup --noconfirm
rustup default nightly

ln -sf ~/dotfiles/fish ~/.config
ln -sf ~/dotfiles/nvim ~/.config
ln -sf ~/dotfiles/picom ~/.config
ln -sf ~/dotfiles/tmux ~/.config
ln -sf ~/dotfiles/alacritty ~/.config
