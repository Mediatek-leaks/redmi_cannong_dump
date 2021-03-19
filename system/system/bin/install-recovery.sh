#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery:134217728:abd16847f033fee927754b3a2136ad435fb89647; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot:67108864:9fbec354ff2f268d0d5f921aa2aba34bd61bb7dd \
          --target EMMC:/dev/block/by-name/recovery:134217728:abd16847f033fee927754b3a2136ad435fb89647 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
