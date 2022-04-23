#!/usr/bin/python3

import sys

t_head1 = ["CONFIG_TARGET_ramips=y", "CONFIG_TARGET_ramips_mt7621=y"]
t_head2 = ["CONFIG_TARGET_ramips_mt7621_DEVICE_xiaomi_mi-router-4a-gigabit=y",
	"CONFIG_TARGET_ramips_mt7621_DEVICE_xiaomi_mi-router-3g-v2=y",
	"CONFIG_TARGET_ramips_mt7621_DEVICE_phicomm_k2p=y",
	"CONFIG_TARGET_ramips_mt7621_DEVICE_xiaomi_mi-router-ac2100=y",
	"CONFIG_TARGET_ramips_mt7621_DEVICE_xiaomi_redmi-router-ac2100=y",
	"CONFIG_TARGET_ramips_mt7621_DEVICE_xiaomi_mi-router-cr6606=y",
	"CONFIG_TARGET_ramips_mt7621_DEVICE_xiaomi_mi-router-cr6608=y",
	"CONFIG_TARGET_ramips_mt7621_DEVICE_xiaomi_mi-router-cr6609=y",
	"CONFIG_TARGET_ramips_mt7621_DEVICE_xiaomi_mi-router-3g=y",
	"CONFIG_TARGET_ramips_mt7621_DEVICE_xiaomi_mi-router-4=y",
	"CONFIG_TARGET_ramips_mt7621_DEVICE_xiaomi_mi-router-3-pro=y"]

# 1.config为小闪存机型配置，2.config为大闪存机型配置
conf_files = ["preset-models/1.config", "preset-models/2.config"]

m = t_head2.index("CONFIG_TARGET_ramips_mt7621_DEVICE_" + sys.argv[1] + "=y")

if m < 3:
	n = 0
else:
	n =1

with open(conf_files[n]) as orig_conf, open(".config", "w") as co_conf:
	for t in t_head1:
		co_conf.write(t + "\n")
	co_conf.write(t_head2[m] + "\n\n")
	co_conf.writelines(orig_conf.readlines())

if m == 0 or m == 1:
	with open("preset-models/modify.sh", "a") as f_orig:
		f_orig.write(". extra-files/mi-router-4a-3g-v2.sh\n")

print(m + 1)
