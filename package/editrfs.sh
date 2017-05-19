#
# Buildroot 2011.05 script to edit the RFS automatically
# 
echo $1

rm -f output/target/etc/inittab
cp ./inittab output/target/etc/inittab

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
tar -xf $SPACE_RFS_ADD_ONS/etc.tar         -C output/target
tar -xf $SPACE_RFS_ADD_ONS/etc2.tar        -C output/target
tar -xf $SPACE_RFS_ADD_ONS/updater.tar     -C output/target

tar -xf $SPACE_RFS_ADD_ONS/sbin.tar        -C output/target
tar -xf $SPACE_RFS_ADD_ONS/usrbin.tar      -C output/target
tar -xf $SPACE_RFS_ADD_ONS/usr_libexec.tar -C output/target
tar -xf $SPACE_RFS_ADD_ONS/usr_local.tar   -C output/target
tar -xf $SPACE_RFS_ADD_ONS/www.tar         -C output/target
tar -xf $SPACE_RFS_ADD_ONS/lib2.tar        -C output/target
tar -xf $SPACE_RFS_ADD_ONS/networkman.tar  -C output/target

# rm -f output/target/lib/libpolkit-gobject-1*
#rm -f output/target/usr/lib/libpolkit-gobject-1*
#rm -f output/target/usr/lib/libpolkit-backend-1*
# cp ./output/target_too_big/lib/libeggdbus-1.so.0.0.0 output/target/lib
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

echo "editrfs.sh is complete"
exit 0
