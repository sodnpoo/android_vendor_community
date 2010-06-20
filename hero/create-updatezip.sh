#!/bin/bash

#echo unyaffing system.img
#cd system
#unyaffs ~/android/aosp/out/target/product/hero/system.img
#cd ..

#echo copying
#rm -rf system/*
#cp -r ../cyanogenmod/out/target/product/hero/system/* system/

DEST=../../../out/target/product/hero
echo $DEST
mkdir -p $DEST/META-INF/com/google/android/
cp update-script $DEST/META-INF/com/google/android/
pushd $DEST

echo zipping ...
rm -f update.zip
zip -r update.zip system META-INF boot.img

echo signing ...
java -jar ../../../../out/host/linux-x86/framework/signapk.jar ../../../../build/target/product/security/testkey.x509.pem ../../../../build/target/product/security/testkey.pk8 update.zip update-signed.zip

popd

