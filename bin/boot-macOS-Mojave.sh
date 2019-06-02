#!/bin/bash

# qemu-img create -f qcow2 mac_hdd.img 128G
#
# echo 1 > /sys/module/kvm/parameters/ignore_msrs (this is required)
#
# The "media=cdrom" part is needed to make Clover recognize the bootable ISO
# image.

############################################################################

MY_OPTIONS="+pcid,+ssse3,+sse4.2,+popcnt,+avx,+aes,+xsave,+xsaveopt,check"

qemu-system-x86_64 -enable-kvm -m 16072 -cpu Penryn,kvm=on,vendor=GenuineIntel,+invtsc,vmware-cpuid-freq=on,$MY_OPTIONS\
	  -machine pc-q35-2.11 \
	  -smp 16,cores=8 \
      -vga none \
      -device vfio-pci,host=42:00.0,bus=pcie.0,multifunction=on \
      -device vfio-pci,host=42:00.1,bus=pcie.0 \
      -device usb-host,hostbus=7,hostport=4 \
      -device usb-host,hostbus=7,hostport=1 \
	  -usb -device usb-kbd -device usb-tablet \
	  -device isa-applesmc,osk="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc" \
	  -drive if=pflash,format=raw,readonly,file=OVMF_CODE.fd \
	  -drive if=pflash,format=raw,file=OVMF_VARS-1024x768.fd \
	  -smbios type=2 \
      -nic tap,model=rtl8139 \
	  -device ich9-intel-hda -device hda-duplex \
      -netdev tap,id=net0,ifname=vibr0,script=no,downscript=no -device cmxnet3,netdev=net0,id=net0,mac=52:54:00:c9:18:27 \
      -netdev user,id=mynet1,net=192.168.76.0/24,dhcpstart=192.168.76.9 -device e1000-82545em,netdev=mynet1,id=net1,mac=52:54:00:c9:18:28 \
      -netdev tap,id=net2 -device vmxnet3,netdev=net2,mac=52:54:00:12:34:56 \
	  -device ide-drive,bus=ide.2,drive=Clover \
	  -drive id=Clover,if=none,snapshot=on,format=qcow2,file=./'Mojave/Clover.qcow2' \
	  -device ide-drive,bus=ide.1,drive=MacHDD \
	  -drive id=MacHDD,if=none,file=/var/lib/libvirt/images/mac_hdd.img,format=qcow2 \
#	  -device ide-drive,bus=ide.0,drive=MacDVD \
#	  -drive id=MacDVD,if=none,snapshot=on,media=cdrom,file='/mnt/slow/isos/Mojave.iso' \
	  -monitor stdio

