#!/bin/bash

# Step 1: Create the uinput group if it doesn't exist
if ! getent group uinput > /dev/null; then
    echo "Creating uinput group..."
    sudo groupadd uinput
else
    echo "uinput group already exists."
fi

# Step 2: Add the current user to the input and uinput groups
echo "Adding user $USER to the 'input' and 'uinput' groups..."
sudo usermod -aG input "$USER"
sudo usermod -aG uinput "$USER"

# Confirm the user has been added to the groups
echo "User $USER now belongs to the following groups:"
groups "$USER"

# Step 3: Add udev rule for uinput device permissions
echo "Setting up udev rule for uinput permissions..."
UDEV_RULE_FILE="/etc/udev/rules.d/99-uinput.rules"
if [ ! -f "$UDEV_RULE_FILE" ]; then
    echo 'KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"' | sudo tee "$UDEV_RULE_FILE" > /dev/null
    echo "uinput udev rule created at $UDEV_RULE_FILE"
else
    echo "uinput udev rule already exists at $UDEV_RULE_FILE"
fi

# Step 4: Ensure uinput driver is loaded
echo "Ensuring uinput module is loaded..."
if ! lsmod | grep -q uinput; then
    sudo modprobe uinput
    echo "uinput module loaded."
else
    echo "uinput module already loaded."
fi

echo "Script complete. You may need to log out and log back in for group changes to take effect."
