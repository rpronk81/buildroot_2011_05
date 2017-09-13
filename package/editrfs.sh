#
# Buildroot 2011.05 script to edit the RFS automatically
# 
echo $1

if [ -e output/target/etc/inittab ]
then
   rm -f output/target/etc/inittab
fi
cp package/customize/etc/etc/inittab output/target/etc/inittab
cp package/customize/system.conf output/target/etc/dbus-1/

if [ ! -e output/target/lib/firmware ]
then
	mkdir output/target/lib/firmware
fi
cp -fr package/redpine output/target/lib/firmware/

if [ ! -e output/target/.flash ]
then
	mkdir output/target/.flash
fi
chmod a+rwx output/target/.flash

if [ ! -e output/target/etc/spacecom ]
then
	mkdir output/target/etc/spacecom
fi
chmod a+rwx output/target/etc/spacecom

if [ ! -e output/target/run ]
then
	mkdir output/target/run
fi
if [ ! -e output/target/run/udev ]
then
	mkdir output/target/run/udev
fi
if [ ! -e output/target/var/lock ]
then
	mkdir output/target/var/lock
fi
if [ ! -e output/target/var/log ]
then
	mkdir output/target/var/log
	mkdir output/target/var/log/debug
fi


echo "Expanding elinos_rfs tar files to this RFS"
SPACE_RFS_ADD_ONS=package/customize
tar -xf $SPACE_RFS_ADD_ONS/bin.tar         -C output/target
tar -xf $SPACE_RFS_ADD_ONS/sbin.tar         -C output/target
tar -xf $SPACE_RFS_ADD_ONS/usr_libexec.tar -C output/target
tar -xf $SPACE_RFS_ADD_ONS/networkman.tar  -C output/target
tar -xf $SPACE_RFS_ADD_ONS/nm_wpa.tar      -C output/target
cp $SPACE_RFS_ADD_ONS/udev                    output/target/etc/init.d/

cp ./package/customize/fi.epitest.hostap.WPASupplicant.service output/target/usr/share/dbus-1/system-services/fi.epitest.hostap.WPASupplicant.service

cp ./package/customize/nmwpa/etc/group output/target/etc/group
cp ./package/customize/nmwpa/etc/passwd output/target/etc/passwd

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

cd $STARTINGPOINT/output/target/usr/lib; ln -s libpcre.so libpcre.so.3

echo "Done expanding elinos_rfs tar files to this RFS"

ln -s /opt/buildroot-2011.05/usr/lib/libiw.so /home/robert/svn/trunk/clones/sclite/app.rootfs/lib/


echo "editrfs.sh is complete"
exit 0
