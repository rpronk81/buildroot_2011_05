#
# Buildroot 2011.05 script to edit the RFS automatically
# 
echo $1

rm output/target/etc/inittab
cp ./inittab output/target/etc/inittab

exit 0
