yay -S openssh --noconfirm
yay -S xclip --noconfirm
ssh-keygen -t ed25519 -C "vilhelm.lindell123@gmail.com"
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_ed25519
xclip -sel clip < ~/.ssh/id_ed25519.pub
