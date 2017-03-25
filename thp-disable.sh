#Include this script in /etc/rc.local

if test -f /sys/kernel/mm/trannsparent_hugepage/enabled; then
	echo never > /sys/kernel/mm/transparent_hugepage/enabled
fi
if test -f /sys/kernel/mm/trannsparent_hugepage/defrag; then
	echo never > /sys/kernel/mm/transparent_hugepage/defrag
fi
