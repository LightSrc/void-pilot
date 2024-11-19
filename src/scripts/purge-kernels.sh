#!/bin/sh -e

deleteable_kernels=$(vkpurge list)
kernels=""

echo "Kernels you can purge:"
i=1
for kernel in $deleteable_kernels; do
    echo "$i. $kernel"
    kernels="$kernels $i $kernel"
    i=$((i+1))
done

echo "Enter the number of the kernel you want to purge or type 'A' to purge them all:"
read number

set -- $kernels
if [ $number = "a" ] || [ $number = "A" ]; then
    while [ $# -gt 0 ]; do
        kernel_to_purge=$2
        shift 2
        echo "Purging kernel $kernel_to_purge"
        sudo vkpurge rm "$kernel_to_purge"
    done
    echo "All kernels successfully purged"
    exit 0
fi

# Check if input is a valid number
if ! [ "$number" -eq "$number" ] 2>/dev/null; then
    echo "Invalid number!"
    exit 1
fi

# Check if input is valid and then delete the chosen kernel
while [ $# -gt 0 ]; do
    current_number=$1
    current_kernel=$2
    shift 2
    if [ "$current_number" -eq "$number" ]; then
        echo "Enter root password if you want to remove kernel $current_kernel"
        sudo vkpurge rm "$current_kernel"
        exit 0
    fi
done

echo "Invalid number entered. No kernel deleted."
