#!/usr/bin/env bash
echo "----------starting boinc--------------"
service boinc-client start
sleep 10
service boinc-client status
echo "----------sync project----------------"
#boinccmd --project_attach http://srbase.my-firewall.org/sr5/ 1415_a1d6ad98cf9e20609e5ab241cd29054a
boinccmd --join_acct_mgr https://www.grcpool.com/ "qsdfghj4321" "azertyuiop4321"
#/etc/init.d/boinc-client restart
sleep 60
boinccmd --join_acct_mgr https://www.grcpool.com/ "qsdfghj4321" "azertyuiop4321"
#/etc/init.d/boinc-client restart

echo "-------------host info----------------"
HOST_INFO="$(boinccmd --get_host_info)"
echo "$HOST_INFO"
#HOST_GRAPHIC_CARDS="$(lspci | grep -i --color 'vga\|3d\|2d')"
#echo "$HOST_GRAPHIC_CARDS"
echo "---------------hostname---------------"
HOSTNAME=$('hostname')
echo "$HOSTNAME"
#echo $GITHUB_USER
#echo $GITHUB_PASSWORD
#GITHUB_USER=''
#GITHUB_PASSWORD=''

#echo "------------pushing to gist-----------"
#echo '{"description":"","public":false,"files":{"host":{"content":"$HOST_INFO"},"cg":{"content":"$HOST_GRAPHIC_CARDS"}}}' | curl --user "$GITHUB_USER:$GITHUB_PASSWORD" --data @- https://api.github.com/gists

echo "---starting work & task monitoring----"

echo "starting to work & sleep"
for i in {1..3000}
do
   echo "-------------Iteration $i-------------"
   sleep 60
   boinccmd --join_acct_mgr https://www.grcpool.com/ "qsdfghj4321" "azertyuiop4321"
#   boinccmd --get_state
   boinccmd --get_state | grep 'total_duration\|total_active_duration\|total_gpu_active_duration'
   boinccmd --project http://srbase.my-firewall.org/sr5/ update
   echo "Ended tasks: $(boinccmd --get_old_tasks | grep task | wc -l)"
   python /check.py
done