#!/bin/sh
#修改固件大小、复制闪存布局文件
sed -i '/Device\/xiaomi_mi-router-4a-gigabit/,/Mi Router 4A/ s/14848k/16064k/' target/linux/ramips/image/mt7621.mk
sed -i '/Device\/xiaomi_mi-router-3g-v2/,/mir3g-v2/ s/14848k/16064k/' target/linux/ramips/image/mt7621.mk
\cp -rf extra-files/mt7621_xiaomi_mi-router-4a-3g-v2.dtsi target/linux/ramips/dts/mt7621_xiaomi_mi-router-4a-3g-v2.dtsi
