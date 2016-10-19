#
# Buildroot 2011.05 script to edit the RFS automatically
# 
echo $1

rm -f output/target/etc/inittab
cp ./inittab output/target/etc/inittab

mkdir output/target/lib/firmware
cp -r package/redpine output/target/lib/firmware/

exit 0
