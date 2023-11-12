#!/bin/bash

# I couldn't get this to work on my ubuntu VM, and I cannot understand what the problem is with line 9.

# Create the update and shutdown script
echo "#!/bin/bash" > update_shutdown.sh
echo "sudo apt update" >> update_shutdown.sh
echo "sudo apt upgrade -y" >>update_shutdown.sh
echo "vmrun -T ws -gu stephen -gp password stop \"~/vmware/Ubuntu 64-bit/Ubuntu 64-bit.vmx\" soft" >> update_shutdown.sh

# Change permissions of the script
chmod +x update_shutdown

# Copy script to the VM
vmrun -T ws -gu stephen -gp password copyFileToGuest "~/vmware/Ubuntu 64-bit/Ubuntu 64-bit.vmx" "/bin/bash" "/tmp/update_shutdown.sh"