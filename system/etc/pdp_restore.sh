#!/system/bin/sh
# Copyright (c) 2016, Samsung Electronics Co., Ltd.

# Create the sym-link , because OHIO's gzip does not support the -k option.
echo "[PDP] pdp_res____.s_  ln pd_____p_ln.tar.gz file at /da" > /dev/kmsg
/system/bin/ln -sf /cache/pdp_bkup/pdp_bkup.tar.gz /data/pdp_bkup/pdp_bkup_ln.tar.gz

# Unzip & un-tar
echo "[PDP] pdp_res____.s_  gzip symlinked - pd_____p_ln.tar.gz to /da" > /dev/kmsg
/system/bin/gzip -d /data/pdp_bkup/pdp_bkup_ln.tar.gz

echo "[PDP] pdp_res____.s_  tar pd_____p_ln.tar to /da__/a__" > /dev/kmsg
/system/bin/tar -xf /data/pdp_bkup/pdp_bkup_ln.tar -C /data

# Copy files
# -p option can preserve the additional attributes: context, links, xattr, all
echo "[PDP] pdp_res____.s_  cp pd______.tar.gz from /ca to /da" > /dev/kmsg
/system/bin/cp -f /cache/pdp_bkup/pdp_bkup.tar.gz /data/pdp_bkup/pdp_bkup.tar.gz

echo "[PDP] pdp_res____.s_  cp p___l__t.txt from /c to /da" > /dev/kmsg
/system/bin/cp -f /cache/pdp_bkup/pdp_list.txt /data/pdp_bkup/pdp_list.txt

# remove files
echo "[PDP] pdp_res____.s_  rm pdp_bkup.tar at /da" > /dev/kmsg
/system/bin/rm -f /data/pdp_bkup/pdp_bkup_ln.tar

echo "[PDP] pdp_res____.s_  rm files at /ca" > /dev/kmsg
/system/bin/rm -f /cache/pdp_bkup/pdp_bkup.tar.gz
/system/bin/rm -f /cache/pdp_bkup/pdp_list.txt
# /system/bin/rm -f /cache/pdp_bkup/pdp_cc_done.txt

# remove the /pdp_bkup folder at /cache : doesn't work
# echo -p i -t "[PDP] pdp_res____.s_  rmdir /c____/p___b___ folder" > /dev/kmsg
# /system/bin/rm -r -f /cache/pdp_bkup
