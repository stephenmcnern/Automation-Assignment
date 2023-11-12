#!/bin/bash

# Variables
path_ubuntu="~/vmware//Ubuntu 64-bit/Ubuntu 64-bit.vmx"
path_windows="~/vmware/Windows10/Windows10 64-bit.vmx"
# I'm using the same credentials for both, just for simplicity.
username="my_username"
password="my_password"

# Ubuntu Method
echo "Writing Ubuntu System Information to ubuntu_system_info.txt"
vmrun -T ws -h https://$username:$password@localhost:8333/sdk -gu stephen -gp password runScriptInGuest "$path_ubuntu" "/usr/sbin/dmidecode" > ubuntu_system_info.txt

# Windows Method
# I don't have a suitable windows host to test this on so it is theoretical.
echo "Writing Windows System Information to windows_system_info_txt"
vmrun -T ws -h https://$username:$password@localhost:8333/sdk -gu stephen -gp password runProgramInGuest "$path_windows" "C:\\Windows\\System32\\wbem\\WMIC.exe" "path Win32_ComputerSystem get /all" > windows_system_info.txt