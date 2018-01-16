export BR2_HOST_DIR=/opt/buildroot-2011.05-ppc
#export BR2_HOST_DIR=$HOME/50G/br_oct19/buildroot_2011_05-ppc/output/host


mkdir ${BR2_HOST_DIR}/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/pppd
cp ./output/build/pppd-2.4.5/pppd/pppd.h  ${BR2_HOST_DIR}/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/pppd/
cp ./output/build/pppd-2.4.5/pppd/fsm.h  ${BR2_HOST_DIR}/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/pppd/
cp ./output/build/pppd-2.4.5/pppd/ipcp.h  ${BR2_HOST_DIR}/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/pppd/
cp ./output/build/pppd-2.4.5/pppd/patchlevel.h  ${BR2_HOST_DIR}/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/

cp output/build/wireless_tools-30/wireless.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/

cp output/build/wireless_tools-30/iwlib.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/

cp output/build/libnspr-4.8.7/mozilla/nsprpub/pr/include/prinit.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnspr-4.8.7/mozilla/nsprpub/pr/include/prthread.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnspr-4.8.7/mozilla/nsprpub/pr/include/prtypes.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnspr-4.8.7/mozilla/nsprpub/dist/include/nspr/prcpucfg.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnspr-4.8.7/mozilla/nsprpub/pr/include/prinrval.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/

mkdir /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/obsolete
touch /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/obsolete/protypes.h

cp output/build/libnspr-4.8.7/mozilla/nsprpub/dist/include/nspr/prwin16.h  /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/

cp output/build/libnss-3.12.9/mozilla/security/nss/lib/pk11wrap/pk11pub.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/

cp output/build/libnspr-4.8.7/mozilla/nsprpub/dist/include/nspr/plarena.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnspr-4.8.7/mozilla/nsprpub/dist/include/nspr/plarenas.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/

cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/seccomon.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/utilrename.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/secport.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnspr-4.8.7/mozilla/nsprpub/dist/include/nspr/prlink.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnspr-4.8.7/mozilla/nsprpub/dist/include/nspr/prlog.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnspr-4.8.7/mozilla/nsprpub/dist/include/nspr/plstr.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/

cp output/build/libnss-3.12.9/mozilla/security/nss/lib/pk11wrap/pk11pub.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/secport.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/secoidt.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/secitem.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnspr-4.8.7/mozilla/nsprpub/dist/include/nspr/plhash.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/secdert.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/cryptohi/keyt.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/cryptohi/keythi.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/pkcs11t.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/pkcs11p.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/pkcs11n.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/pkcs11u.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/softoken/secmodt.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/nssrwlkt.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/nssilock.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnspr-4.8.7/mozilla/nsprpub/dist/include/nspr/prmon.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnspr-4.8.7/mozilla/nsprpub/dist/include/nspr/prlock.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnspr-4.8.7/mozilla/nsprpub/dist/include/nspr/prcvar.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/nssilckt.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/secoid.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/secasn1t.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/secasn1.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnspr-4.8.7/mozilla/nsprpub/dist/include/nspr/prclist.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/certdb/certt.h  /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnspr-4.8.7/mozilla/nsprpub/dist/include/nspr/prio.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnspr-4.8.7/mozilla/nsprpub/dist/include/nspr/prlong.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnspr-4.8.7/mozilla/nsprpub/dist/include/nspr/prtime.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnspr-4.8.7/mozilla/nsprpub/dist/include/nspr/prinet.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/

cp output/build/libnss-3.12.9/mozilla/security/nss/lib/pkcs7/pkcs7t.h  /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/smime/cmsreclist.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/certdb/cert.h  /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnspr-4.8.7/mozilla/nsprpub/dist/include/nspr/prerror.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnspr-4.8.7/mozilla/nsprpub/dist/include/nspr/prerr.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/pkcs12/p12.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/cryptohi/key.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/cryptohi/keyhi.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/pkcs7/secpkcs7.h  /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/freebl/hasht.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/pkcs12/p12t.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/pkcs11.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/pkcs11f.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/secdig.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/secdigt.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/pkcs12/pkcs12t.h  /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/util/ciferfam.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/pkcs12/p12plcy.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp output/build/libnss-3.12.9/mozilla/security/nss/lib/nss/nss.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
