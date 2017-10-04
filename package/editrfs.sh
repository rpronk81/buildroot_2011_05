#
# Buildroot 2011.05 script to edit the RFS automatically
# 
echo $1

if [ -e output/target/etc/inittab ]
then
   rm -f output/target/etc/inittab
fi
#cp package/customize/etc/etc/inittab output/target/etc/inittab
cp fs/skeleton/etc/inittab output/target/etc/inittab

cp /home/robert/50G/br_oct19/buildroot_2011_05/package/customize/init.sh output/target/
chmod a+x output/target/init.sh

cp package/customize/system.conf output/target/etc/dbus-1/

if [ ! -e output/target/lib/firmware ]
then
	mkdir -p output/target/lib/firmware
fi
cp -fr package/redpine output/target/lib/firmware/

if [ ! -e output/target/.flash ]
then
	mkdir -p output/target/.flash
fi
chmod a+rwx output/target/.flash

if [ ! -e output/target/etc/spacecom ]
then
	mkdir -p output/target/etc/spacecom
fi
chmod a+rwx output/target/etc/spacecom

if [ ! -e output/target/run ]
then
	mkdir -p output/target/run
fi
if [ ! -e output/target/run/udev ]
then
	mkdir -p output/target/run/udev
fi
if [ ! -e output/target/var/lock ]
then
	mkdir -p output/target/var/lock
fi
if [ ! -e output/target/var/log ]
then
	mkdir -p output/target/var/log
	mkdir -p output/target/var/log/debug
fi


echo "Expanding elinos_rfs tar files to this RFS"
SPACE_RFS_ADD_ONS=package/customize
tar -xf $SPACE_RFS_ADD_ONS/bin.tar         -C output/target
tar -xf $SPACE_RFS_ADD_ONS/sbin.tar        -C output/target
tar -xf $SPACE_RFS_ADD_ONS/usr_libexec.tar -C output/target
tar -xf $SPACE_RFS_ADD_ONS/networkman.tar  -C output/target
tar -xf $SPACE_RFS_ADD_ONS/nm_wpa.tar      -C output/target
tar -xf $SPACE_RFS_ADD_ONS/updater.tar     -C output/target
tar -xf $SPACE_RFS_ADD_ONS/id_rsa.tar         -C output/target
cp $SPACE_RFS_ADD_ONS/udev                    output/target/etc/init.d/

# Temporary work around for json issues preventing connection with the library. 
rm output/target/usr/lib/libjson*
cp /home/robert/50G/br_oct19/buildroot_2011_05/package/customize/usrbin/usr/bin/json-dbus-bridge output/target/usr/bin
cp -d /home/robert/50G/br_oct19/buildroot_2011_05/package/customize/lib2/lib/libjson.so.0.0.1 output/target/usr/lib
cp -d /home/robert/50G/br_oct19/buildroot_2011_05/package/customize/lib2/lib/libjson.so.0 output/target/usr/lib


cp ./package/customize/fi.epitest.hostap.WPASupplicant.service output/target/usr/share/dbus-1/system-services/fi.epitest.hostap.WPASupplicant.service

cp ./package/customize/nmwpa/etc/group output/target/etc/group
cp ./package/customize/nmwpa/etc/passwd output/target/etc/passwd
cp ./package/customize/system-local.conf output/target/etc/dbus-1

STARTINGPOINT=$PWD
cd output/target/usr/share/locale/
rm -rf \
af   be@latin     cs           en_CA    eu  he  it  locale.alias  mn   nn  pt     sl        te  vi \
am   bg           cy           en_GB    fa  hi  ja  lt            mr   no  pt_BR  sq        th  wa \
ar   bn                      en@quot  fi  hr  ka  lv            ms   oc  ro     sr        tl  xh \
as   bn_IN        de           en@shaw  fr  hu  kk  mai           nb   or  ru     sr@ije    tr  yi \
ast  bs           dz           eo       ga  hy  kn  mg            nds  pa  rw     sr@latin  tt  zh_CN \
az   ca           el           es       gl  id  ko  mk            ne   pl  si     sv        ug  zh_HK \
be   ca@valencia  en@boldquot  et       gu  is  ku  ml            nl   ps  sk     ta        uk  zh_TW \

chmod -R a+x $STARTINGPOINT/output/target/etc/init.d/*

# cd $STARTINGPOINT/output/target/usr/lib; ln -sf libpcre.so libpcre.so.3

echo "Done expanding elinos_rfs tar files to this RFS"

# ln -sf /opt/buildroot-2011.05/usr/lib/libiw.so /home/robert/svn/trunk/clones/sclite/app.rootfs/lib/
TARGETPOINT=$STARTINGPOINT/output/target
cd $TARGETPOINT
pwd
ln -sf bin/busybox busybox 

ln -sf /tmp/resolv.conf          etc/resolv.conf
#ln -sf /etc/spacecom/localtime   etc/localtime
#ln -sf /tmp/adjtime             etc/adjtime
#ln -sf /etc/tmp/adjtime          etc/adjtime
#ln -sf /etc/spacecom/ftpd.passwd etc/ftpd.passwd


chmod u+s  updater/check_params
mkdir -p sbin/.ssh
mkdir -p $TARGETPOINT/var/empty/ntp/
mkdir -p $TARGETPOINT/var/watchdog/empty
ln -sf dev/.udev udev
mkdir -p $TARGETPOINT/etc/dhcp
ln -sf var/dhclient.conf etc/dhcp/dhclient.conf
ln -sf tmp/known_hosts_www sbin/.ssh
ln -sf tmp/known_hosts_www root/.ssh
ln -sf tmp/wb45n-bbraun tmp
ln -sf tmp/wlan tmp
mkdir -p $TARGETPOINT/usr/local
#ln -sf etc/ssl usr/local/ssl
mkdir -p $TARGETPOINT/var/state/dhcp
mkdir -p $TARGETPOINT/var/lib/dhcp
mkdir -p root/.ssh
cp -fv etc/id_rsa.pub root/.ssh/authorized_keys2
mv usr/bin/od bin/od
mv usr/bin/tr bin/tr
mkdir -p sbin/inet6
cp sbin/ifconfig sbin/inet6/ifconfig
cp sbin/route sbin/inet6/route
cp etc/id_rsa sbin/.ssh/
cp etc/id_rsa.pub sbin/.ssh/

# ALL of these need specific file permission bits.
#cd dev
#mkdir shm tun proc/kcore proc/self/fd proc/self/fd/2 proc/self/fd/0 proc/self/fd/1 cpu_dma_latency full fuse kmsg mtd0ro mtd1ro mtd2ro mtd3ro network_latency network_throughput ppp rtc0 tty8 tty9 ttya0 ttya1 ttya2 ttya3 ttya4 ttya5 ttya6 ttya7 ttya8 ttya9 vcs vcs1 vcsa vcsa1 watchdog


chmod 0600 root/.ssh/authorized_keys2 sbin/.ssh/id_rsa sbin/.ssh/id_rsa.pub

chmod 06755 $TARGETPOINT/sbin/updaterwr 
cd $TARGETPOINT

chmod 0755 \
$TARGETPOINT/var/watchdog/empty \
$TARGETPOINT/var/run \
$TARGETPOINT/var/state \ 
$TARGETPOINT/var/state/dhcp \
$TARGETPOINT/var/lib \
$TARGETPOINT/var/lib/dhcp \
$TARGETPOINT/lib \
$TARGETPOINT/lib/udev \
$TARGETPOINT/etc/NetworkManager \
$TARGETPOINT/etc/dbus-1 \
$TARGETPOINT/etc/spacecom_backup \
$TARGETPOINT/etc/spacecom_backup/protected \
$TARGETPOINT/etc/spacecom_backup/protected/system-connections \
$TARGETPOINT/etc/NetworkManger/dispatcher.d \
$TARGETPOINT/etc/NetworkManager/dispatcher.d/01ifupdown \
$TARGETPOINT/mnt \
$TARGETPOINT/etc/dbus-1/system.d \
$TARGETPOINT/usr/share \
$TARGETPOINT/usr/share/polkit-1 \
$TARGETPOINT/usr/share/polkit-1/actions \
$TARGETPOINT/usr/lib \
$TARGETPOINT/usr/libexec \
$TARGETPOINT/usr/sbin \
$TARGETPOINT/usr/share/NetworkManager \
$TARGETPOINT/usr/share/dbus-1 \
$TARGETPOINT/media \
$TARGETPOINT/www \
$TARGETPOINT/etc/fake-files \
$TARGETPOINT/www/diag \
$TARGETPOINT/dev/shm \
$TARGETPOINT/dev/net \
$TARGETPOINT/etc/dhcp \
$TARGETPOINT/updater \
$TARGETPOINT/usr/local 

chmod 0666 $TARGETPOINT/dev/tun


chmod 01775 $TARGETPOINT/etc/spacecom

chmod 0700 $TARGETPOINT/root $TARGETPOINT/root/.ssh $TARGETPOINT/sbin/.ssh

echo "editrfs.sh is complete"
exit 0
