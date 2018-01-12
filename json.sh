#
# SOURCE this file to insert the PKG_CONFIG_PATH into your shell environment.
# source json.sh
#
sudo mkdir /opt/buildroot-2011.05/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/json/
sudo chmod -R 777 /opt/buildroot-2011.05/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/json/
sudo cp ./output/build/json-c-0.10-20120530/*.h /opt/buildroot-2011.05/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/json/
cp -p output/target/usr/lib/libjson.*  /opt/buildroot-2011.05/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib
export PKG_CONFIG_PATH=$PWD/output/build/json-c-0.10-20120530
