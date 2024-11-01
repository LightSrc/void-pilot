#!/bin/sh -e
sleep 1

echo "*** PLEASE READ THIS BEFORE YOU CONTINUE! ***"
echo "* If this is your first time doing this I recommend you watching this video: https://www.youtube.com/watch?v=QIEyv-Pnh0w&t=132s"
echo "* This script will install Linux Tkg kernel which has best optimizations for gaming"
echo "* Most likely your FPS will not increase, but games will be more smooth and you will get less input lag"
echo "* This proccess will take aprox. 5 minutes to 2 hours depending on your hardware"
echo "** CAUTION: You need around 30GB of free space in your HOME folder to compile this kernel and it is recommended that you have 8GB of RAM"
echo ""
echo "Do you want to continue? (y/n)"
read answer
case $answer in
    y|Y)
        echo "Continuing the script..."
        ;;
    n|N)
        echo "Exiting the script."
        exit 0
        ;;
    *)
        echo "Invalid input. Exiting."
        exit 1
        ;;
esac

sudo xbps-install -S git
cd ~/
if [ ! -d ~/linux-tkg ]; then
    git clone https://github.com/Frogging-Family/linux-tkg.git
fi
cd linux-tkg
sed -i 's/_distro=""/_distro="Generic"/' customization.cfg
sed -i 's/_configfile=""/_configfile="running-kernel"/' customization.cfg
echo "Edit customization.cfg if you know what you are doing"
echo "DONT CHANGE _distro and _configfile variables"
echo "vim ~/linux-tkg/customization.cfg"
echo ""
echo "Do you want to continue or still editing customization.cfg? (y/n)"
read answer
case $answer in
    y|Y)
        echo "Continuing the script..."
        ;;
    n|N)
        echo "Exiting the script."
        exit 0
        ;;
    *)
        echo "Invalid input. Exiting."
        exit 1
        ;;
esac

echo "Updating system and Installing packages which are needed to compile kernel"
sudo xbps-install -Su
sudo xbps-install make gcc bc bison perl wget curl ccache elfutils elfutils-devel flex git libXi-devel lz4 ncurses-devel openssl openssl-devel python3-devel schedtool zstd rsync libstdc++ pahole cpio fakeroot kmod inetutils xmlto docbook-xsl patchutils graphviz ImageMagick tar xz llvm clang lld
./install.sh install

if [ -f /boot/vmlinuz ]; then
    echo "For some reason script failed to rename kernel"
    echo "Please select correct version which u just compiled"
    # Initialize an empty array
    tkg_files=""
    # Loop through the matching files and strip unwanted parts
    for file in /boot/initramfs-*tkg*.img; do
        filename=$(basename "$file" | sed 's/initramfs-//; s/.img//')
        tkg_files="$tkg_files $filename"
    done

    # Convert string to array-like indexing
    i=1
    for filename in $tkg_files; do
        echo "$i. $filename"
        i=$((i + 1))
    done

    # Prompt user to select a file
    echo "Select a number: "
    read user_input

    # Check if input is a valid number
    if ! [ "$user_input" -eq "$user_input" ] 2>/dev/null; then
        echo "Invalid number!"
        exit 1
    fi

    # Get the selected filename
    i=1
    for filename in $tkg_files; do
        if [ "$i" -eq "$user_input" ]; then
            selected_file=$filename
            break
        fi
        i=$((i + 1))
    done

    # Output the selected filename
    echo "You selected: $selected_file"

    sudo mv /boot/vmlinuz /boot/vmlinuz-$selected_file
    sudo update-grub
fi
echo "Linux Tkg kernel successfully compiled and installed!"
echo "Restart your PC to use new kernel"
echo "If you write uname -r after restart and dont see tkg in kernel name then you need to select correct kernel version in GRUB -> advanced options"
