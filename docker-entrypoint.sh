service boinc-client start
sleep 10

POOL=${POOL:-""}

if [ "$POOL" == "" ] ; then
	echo "No pool defined. Exiting"
else
	boinccmd --join_acct_mgr "$POOL_URL" "$POOL_USER" "$POOL_PWD"

	while true
	do
		sleep 60
	done
fi