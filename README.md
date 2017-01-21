
Prelaunch steps

Add MAC address to dhcp static leases.  Provide IP, hostname and description.

On Pi console:
- set user pi password
- raspi-config
	Boot options -> Console and disable splash screen
	Advanced -> enable SSH
- edit /etc/default/keyboard (Set keyboard to 'us')
- reboot
- edit wpa-supplicant.conf:
	network={
		ssid="SSID"
		psk="PSK"
	}
- reboot

Run playbook with '-e firstrun=true':

	time ansible-playbook playbook.yml -e firstrun=true -e @vault/vault.yml --vault-password-file ~/.XXvault.pass.txt
