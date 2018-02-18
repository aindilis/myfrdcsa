function continue_on {
    read -p "Continue? " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Nn]$ ]]
    then
	echo "Cancelled, exiting."
	exit
    fi
}
