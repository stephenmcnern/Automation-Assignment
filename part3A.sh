#!/bin/bash

# I have chosen Linux for this script

# Store Paths as Variables
path_ubuntu="~/vmware/ubuntu 64-bit/ubuntu 64-bit.vmx"
path_script="~/Documents/scripts/update_vm.sh"
username="stephen"
password="password"

# Check for updates
vmrun -T ws checkToolsState "$path_ubuntu"

# Run update script on VM
if [$? -eq 1 ]; then
    echo "Updating VM..."
    # Copy update script from host to VM
    vmrun -T ws -gu $username -gp $password copyFileToGuest  "$path_ubuntu" "$path_script" "/tmp/update_vm.sh"
    # Run the script on the VM
    vmrun -T ws -gu $username -gp $password runProgramInGuest "$path_ubuntu" "/bin/bash" "/tmp/update_vm.sh"

    echo "Update Complete"
else
    echo "No Updates Required"
fi
