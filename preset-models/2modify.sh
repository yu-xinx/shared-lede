#!/bin/sh
#修改登录IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
#修改主机名
sed -i 's/OpenWrt/MiWiFi-CR6608/g' package/base-files/files/bin/config_generate
#删除自带低版本xray-core
rm -rf feeds/packages/net/xray-core
rm -rf package/feeds/packages/xray-core
#设置WIFI
#sed -i 's/OpenWrt/coolxiaomi/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i 's/wireless.default_radio${devidx}.encryption=none/wireless.default_radio${devidx}.encryption=psk-mixed/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i '/encryption/a\set wireless.default_radio${devidx}.key=coolxiaomi' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#修改登录密码为coolxiaomi
#sed -i '/root/croot:$1$CBd7u73H$LvSDVXLBrzpk4JfuuN.Lv1:18676:0:99999:7:::' package/base-files/files/etc/shadow
#切换ramips内核到5.15
#sed -i '/KERNEL_PATCHVER/cKERNEL_PATCHVER:=5.15' target/linux/ramips/Makefile
#复制内核5.10版本CPU超频补丁
#\cp -rf extra_files/322-mt7621-fix-cpu-clk-add-clkdev.patch target/linux/ramips/patches-5.10/322-mt7621-fix-cpu-clk-add-clkdev.patch

#删除一些zzz中的脚本
sed -i '/DISTRIB_/d' package/default-settings/files/zzz-default-settings
sed -i '/footer.htm/d' package/default-settings/files/zzz-default-settings
sed -i '/admin_status/d' package/default-settings/files/zzz-default-settings

#禁用一些开机启动脚本
mkdir -p files/etc/uci-defaults
cat << EOF > files/etc/uci-defaults/99_custom-settings
/etc/init.d/ddns disable
/etc/init.d/openclash disable
/etc/init.d/smartdns disable
/etc/init.d/passwall2 disable
/etc/init.d/passwall2_server disable
/etc/init.d/nat6-helper disable
/etc/init.d/xray disable
/etc/init.d/vssr disable
exit 0
EOF

#追加一些预设脚本到99_custom-settings
sed -i '/exit 0/d' files/etc/uci-defaults/99_custom-settings
cat default-settings/config_theme >> files/etc/uci-defaults/99_custom-settings
cat default-settings/config_smartdns >> files/etc/uci-defaults/99_custom-settings
echo "exit 0" >> files/etc/uci-defaults/99_custom-settings
