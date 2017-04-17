echo "	/home/robert/50G/br_oct19/buildroot_2011_05/output/host/usr/sbin/mkfs.jffs2 -p -e128KiB -l -d /home/robert/50G/br_oct19/buildroot_2011_05/output/target -o /home/robert/50G/br_oct19/buildroot_2011_05/output/images/rootfs.jffs2" >> /home/robert/50G/br_oct19/buildroot_2011_05/output/build/_fakeroot.fs

chmod a+x /home/robert/50G/br_oct19/buildroot_2011_05/output/build/_fakeroot.fs
/home/robert/50G/br_oct19/buildroot_2011_05/output/host/usr/bin/fakeroot -- /home/robert/50G/br_oct19/buildroot_2011_05/output/build/_fakeroot.fs
