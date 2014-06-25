TARGETS = mountkernfs.sh fake-hwclock hostname.sh udev keyboard-setup mountdevsubfs.sh checkroot.sh console-setup networking mountall.sh mountall-bootclean.sh mountnfs.sh mountnfs-bootclean.sh alsa-utils urandom x11-common kbd procps checkroot-bootclean.sh bootmisc.sh mtab.sh checkfs.sh udev-mtab kmod
INTERACTIVE = udev keyboard-setup checkroot.sh console-setup kbd checkfs.sh
udev: mountkernfs.sh
keyboard-setup: mountkernfs.sh udev
mountdevsubfs.sh: mountkernfs.sh udev
checkroot.sh: fake-hwclock mountdevsubfs.sh hostname.sh keyboard-setup
console-setup: mountall.sh mountall-bootclean.sh mountnfs.sh mountnfs-bootclean.sh kbd
networking: mountkernfs.sh mountall.sh mountall-bootclean.sh urandom
mountall.sh: checkfs.sh checkroot-bootclean.sh
mountall-bootclean.sh: mountall.sh
mountnfs.sh: mountall.sh mountall-bootclean.sh networking
mountnfs-bootclean.sh: mountall.sh mountall-bootclean.sh mountnfs.sh
alsa-utils: mountall.sh mountall-bootclean.sh mountnfs.sh mountnfs-bootclean.sh
urandom: mountall.sh mountall-bootclean.sh
x11-common: mountall.sh mountall-bootclean.sh mountnfs.sh mountnfs-bootclean.sh
kbd: mountall.sh mountall-bootclean.sh mountnfs.sh mountnfs-bootclean.sh
procps: mountkernfs.sh mountall.sh mountall-bootclean.sh udev
checkroot-bootclean.sh: checkroot.sh
bootmisc.sh: checkroot-bootclean.sh mountall.sh mountall-bootclean.sh mountnfs.sh mountnfs-bootclean.sh udev
mtab.sh: checkroot.sh
checkfs.sh: checkroot.sh mtab.sh
udev-mtab: udev mountall.sh mountall-bootclean.sh
kmod: checkroot.sh
