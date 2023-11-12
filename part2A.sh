#!/bin/bash

# Check available space and memory
get_resources(){

    # I needed to remove "GB" from the returned information to get a pure integer value without letters.
    available_space=$(df -h / | awk 'NR==2{gsub(/[A-Za-z]/, "", $4); print $4}')
    available_memory=$(free -h | awk 'NR==2{gsub(/[A-Za-z]/, "", $2); print $2}')

    space_required=$1
    memory_required=$2

    if [ "$available_space" -gt "$space_required" ] && [ "$available_memory" -gt "$memory_required" ]; then
        echo "Sufficient Resources"
    else 
        echo "Insufficient Resources Available"
    fi
}


# Resource Requirements
total_space_needed=0
total_memory_needed=0

# Find out the number of VMs needed
read -p "How many VMs are needed?" num_vms

# Get the required details from user
for ((i=1; i<=$num_vms; i++)); do
    read -p "Choose Operating System $i: " os
    read -p "How Much Disk Space is Needed? (in GB): " required_space
    read -p "How Much Memory is Needed? (in GB): " required_memory

    # Accumulate Requirements
    total_memory_needed=$((total_memory_needed + required_memory))
    total_space_needed=$((total_space_needed + required_space))
done


# Check Resources after obtaining all VM details
get_resources "$total_space_needed" "$total_memory_needed"

echo "Space required for $num_vms VMs: $total_space_needed GB"
echo "Memory required for $num_vms VMs: $total_memory_needed GB"

