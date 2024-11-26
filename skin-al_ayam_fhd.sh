#!/bin/bash

#
VERSION="1.0"
DESCRIPTION="AL_AYAM_FHD V1.0"

echo "======================================"
echo "        TeamNitro Skin Installer      "
echo "======================================"
echo ""

# 
FILES=(
    "TeamNitro.tar.gz:https://github.com/biko-73/TeamNitro/raw/main/skins/TeamNitro.tar.gz"
    "AL_AYAM_FHD1.tar.gz:https://github.com/biko-73/TeamNitro/raw/main/skins/AL_AYAM_FHD1.tar.gz"
    "AL_AYAM_FHD2.tar.gz:https://github.com/biko-73/TeamNitro/raw/main/skins/AL_AYAM_FHD2.tar.gz"
)

TMP_DIR="/var/volatile/tmp"

# 
echo "Removing old files..."
rm -rf "/usr/lib/enigma2/python/Plugins/Extensions/TeamNitro"
rm -rf "/usr/share/enigma2/AL_AYAM_FHD"

# 
for FILE in "${FILES[@]}"; do
    IFS=":" read -r FILENAME URL <<< "$FILE"
    TMP_FILE="$TMP_DIR/$FILENAME"
    
    echo "Downloading $FILENAME ..."
    if wget -O "$TMP_FILE" --no-check-certificate "$URL"; then
        echo "Extracting $FILENAME ..."
        tar -xzvf "$TMP_FILE" -C /
        rm -f "$TMP_FILE"
    else
        echo "Failed to download $FILENAME."
        echo "Installation aborted!"
        exit 1
    fi
done

# 
chmod 755 /usr/bin/opbitrate

# 
echo ""
echo "########################################################################"
echo "#            AL_AYAM_FHD by TeamNitro INSTALLED SUCCESSFULLY           #"
echo "#                      BY TeamNitro - support on                       #"
echo "#              https://www.tunisia-sat.com/forums/forums               #"
echo "########################################################################"
echo "#        Successfully Downloaded. Please apply from skin selection    #"
echo "########################################################################"

# 
echo "**************************************************"
echo "**                   FINISHED                   **"
echo "**************************************************"
exit 0


