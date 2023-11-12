#!/bin/bash


# Create the update and shutdown script
echo "#!/bin/bash" > update_shutdown.sh
echo "sudo apt update" >> update_shutdown.sh
echo "sudo apt upgrade -y" >>update_shutdown.sh
echo "vmrun -T ws -gu stephen -gp password stop \"~/vmware/Ubuntu 64-bit/Ubuntu 64-bit.vmx\" soft" >> update_shutdown.sh

# Change permissions of the script
chmod +x update_shutdown.sh

# Copy script to the VM
vmrun -T ws -gu stephen -gp password copyFileToGuest "~/vmware/Ubuntu 64-bit/Ubuntu 64-bit.vmx" "/bin/bash" "/tmp/update_shutdown.sh"

# Cron Scheduler Setup
vmrun -T ws -gu stephen -gp password runProgramInGuest "~/vmware/Ubuntu 64-bit/Ubuntu 64-bit.vmx" "/bin/bash" "-c" "echo '0 18 * * * /bin/bash /tmp/update_shutdown.sh' | crontab -"