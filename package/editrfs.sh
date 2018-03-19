#
# Buildroot 2011.05 script to edit the RFS automatically
# 
echo $1

if [ ! -e output/target/lib/firmware ]
then
	mkdir -p output/target/lib/firmware
fi
cp -fr package/redpine output/target/lib/firmware/

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
	mkdir -p output/target/var/tmp
	chmod 775 output/target/var/tmp
fi

if [ -e output/target/usr/sbin/flashcp ]
then
	mv output/target/usr/sbin/flash_erase output/target/sbin/flash_erase
	mv output/target/usr/sbin/flashcp output/target/sbin/flashcp
fi

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

echo "Done expanding elinos_rfs tar files to this RFS"

TARGETPOINT=$STARTINGPOINT/output/target
cd $TARGETPOINT
pwd
ln -sf /bin/busybox busybox 
ln -sf /tmp/resolv.conf          etc/resolv.conf
ln -sf /etc/comsystem/localtime   etc/localtime

mkdir -p $TARGETPOINT/sbin/.ssh
mkdir -p $TARGETPOINT/var/empty/ntp/
sudo ln -sf /dev/.udev udev
mkdir -p $TARGETPOINT/etc/dhcp
ln -sf /var/dhclient.conf etc/dhcp/dhclient.conf
ln -sf /tmp/known_hosts_www sbin/.ssh/known_hosts
ln -sf /tmp/wb45n-bbraun tmp
ln -sf /tmp/wlan tmp
mkdir -p $TARGETPOINT/usr/local
mkdir -p $TARGETPOINT/var/state/dhcp
mkdir -p $TARGETPOINT/var/lib/dhcp
rm -rf $TARGETPOINT/root/.ssh
mkdir -p $TARGETPOINT/root/.ssh

if [ -e $TARGETPOINT/usr/bin/od ]
then
   mv $TARGETPOINT/usr/bin/od $TARGETPOINT/bin/od
fi
if [ -e $TARGETPOINT/usr/bin/tr ]
then
   mv $TARGETPOINT/usr/bin/tr $TARGETPOINT/bin/tr
fi

mkdir -p $TARGETPOINT/sbin/inet6

chmod 0755 $TARGETPOINT/var/run $TARGETPOINT/var/state $TARGETPOINT/var/state/dhcp

chmod 0755 $TARGETPOINT/var/lib
chmod 0755 $TARGETPOINT/var/lib/dhcp $TARGETPOINT/lib $TARGETPOINT/etc/NetworkManager $TARGETPOINT/etc/dbus-1 

chmod 0755 $TARGETPOINT/etc/NetworkManager/dispatcher.d \
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
$TARGETPOINT/media 

chmod 0755  $TARGETPOINT/etc/dhcp \
$TARGETPOINT/usr/local 

chmod 01775 $TARGETPOINT/etc/spacecom

chmod 0700 $TARGETPOINT/root $TARGETPOINT/root/.ssh $TARGETPOINT/sbin/.ssh
mkdir -p $TARGETPOINT/var/tmp
chmod 775 $TARGETPOINT/var/tmp
rm -rf $TARGETPOINT/var/watchdog/empty

echo "editrfs.sh is complete"
exit 0
