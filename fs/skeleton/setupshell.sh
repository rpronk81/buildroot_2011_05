#!/busybox sh

if /busybox grep -q "console=" /proc/cmdline ; then
	exec /busybox sh
fi

# Suspend to prevent respawning, if no console is configured
/busybox kill -STOP $$
