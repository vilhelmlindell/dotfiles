yay -S brillo --noconfirm
yay -S intel-undervolt --noconfirm
yay -S tp-battery-mode --noconfirm
yay -S vibrant-cli --noconfirm
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer

systemctl enable intel-undervolt.service
systemctl enable tp-battery-mode.service
