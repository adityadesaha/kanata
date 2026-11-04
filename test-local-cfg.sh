#!/usr/bin/env bash

kanata_systemd_was_running=0

cleanup() {
    if [ "$kanata_systemd_was_running" -eq 1 ]; then
	echo "Cleaning Up, starting systemd service again."
        kanata_systemd_was_running=0
        sudo systemctl start kanata.service
	echo -n "Wait for a couple of seconds..."
	sleep 2
	echo "Bye!"
	exit 0
    fi
}

trap cleanup EXIT
trap 'exit 130' INT
trap 'exit 143' TERM
trap 'exit 129' HUP

if systemctl is-active --quiet kanata.service; then

    echo -n "kanata.service was running, stopping ..."
    sudo systemctl stop kanata.service
    echo " done."
    kanata_systemd_was_running=1

fi

kanata --cfg ./kanata.kbd
