#!/bin/sh -e
sleep 2

echo "Select NodeJS version which you want to install:"
echo "1. v18.*"
echo "2. v19.*"
echo "3. v20.*"
echo "4. v21.*"
echo "5. v22.*"
echo "6. v23.*"
read selected_number

selected_version=""

case $selected_number in
    1)
        selected_version = 18
        ;;
    2)
        selected_version = 19
        ;;
    3)
        selected_version = 20
        ;;
    4)
        selected_version = 21
        ;;
    5)
        selected_version = 22
        ;;
    6)
        selected_version = 23
        ;;
    *)
        echo "Selected wrong number! Exiting script..."
        exit 1
        ;;
esac

sudo xbps-install curl

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

nvm install $selected_version

echo "NodeJS v$selected_version is successfully installed!"
