yay -S brillo --noconfirm
yay -S intel-undervolt --noconfirm
yay -S tp-battery-mode --noconfirm
yay -S vibrant-cli --noconfirm
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer

systemctl enable intel-undervolt.service
systemctl enable tp-battery-mode.service

yay -S bumblebee --noconfirm
yay -S mesa --noconfirm
yay -S mesa-utils --noconfirm
yay -S xf86-video-intel --noconfirm
sudo gpasswd -a vilhelm bumblebee

systemctl enable bumblebeed.service
yay -S bbswitch --noconfirm
sudo pacman -Syu bbswitch
