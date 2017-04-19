#!/busybox sh

#
# Bind-mount all directories from the flash filesystem.
#
cd /.flash
for file in * ; do
	# No need to bind-mount virtual file systems and RAM file systems.
	if /busybox [ "$file" != "dev" ] && \
		/busybox [ "$file" != "media" ] && \
		/busybox [ "$file" != "proc" ] && \
		/busybox [ "$file" != "sys" ] && \
		/busybox [ "$file" != "tmp" ]
	then
		# Create mountpoints and bind-mount or symlink.
		if /busybox [ -d "$file" ]
		then
			if /busybox [ ! -d "/$file" ]
			then
				/busybox mkdir "/$file"
			fi
			/busybox mount -o bind "$file" "/$file"
		else
			/busybox ln -s "/.flash/$file" "/$file"
		fi
	fi

	/busybox cp -a /.flash/dev/* /dev
done

/etc/rc.start
