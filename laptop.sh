yay -S brillo --noconfirm
yay -S intel-undervolt --noconfirm
yay -S tp-battery-mode --noconfirm
yay -S vibrant-cli --noconfirm

systemctl enable intel-undervolt.service
systemctl enable tp-battery-mode.service
