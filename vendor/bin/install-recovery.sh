#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:45aacc6ed566b682a808b894826203695d51e981; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:d00dd1cc9df9ca9cfa7d6026f73dcbd6e8fcd075 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:45aacc6ed566b682a808b894826203695d51e981 && \
      log -t recovery "Installing new oplus recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oplus recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
