
Prelaunch steps

Via Pi console:
- set user pi password
- raspi-config
	Boot options -> Console and disable splash screen
	Advanced -> enable SSH
- edit wpa-supplicant.conf:
	network={
		ssid="SSID"
		psk="PSK"
	}

Run playbook with '-e firstrun=true':

	time ansible-playbook playbook.yml -e firstrun=true -e @vault/vault.yml --vault-password-file ~/.XXvault.pass.txt
