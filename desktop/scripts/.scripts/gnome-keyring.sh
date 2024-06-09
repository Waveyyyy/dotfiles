# https://yashagarwal.in/notes/setting-up-ssh-agent-in-i3
eval $(/usr/bin/gnome-keyring-daemon --start --componets=gpg,pkcs11,secrets,ssh)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK
