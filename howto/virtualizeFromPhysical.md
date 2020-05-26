# Virtualize a physical HD

### create image

```
sudo mkdir /media/Backup
sudo dd if=/dev/zero of=/media/Backup/backup.img bs=1024 count=83886080
sudo modprobe loop
sudo losetup /dev/loop20 /media/Backup/backup.img 
```
### create partitions

```
sudo parted /dev/loop20 mklabel gpt -s
sudo parted -a opt /dev/loop20 mkpart primary ext4 0% 100% -s
sudo mkfs.ext4 -L ubuntu /dev/loop20p1
sudo parted /dev/loop20 set 1 boot on -s
sudo mount /dev/loop20p1 /mnt/Virtual
sudo rsync -aAXv /* /mnt/Virtual --exclude={/dev/*,/proc/*,/sys/*,/tmp/*,/run/*,/mnt/*,/media/*,/lost+found,/home/*/.gvfs}
sudo VBoxManage convertfromraw --format VMDK /media/Backup/backup.img /media/Backup/backup.vmdk
```
- Create boot partition with flag efi

[Tutorial see here](https://www.thegeekdiary.com/how-to-create-a-partition-using-parted-command/)
```
sudo parted /dev/loop20
--> mklabel gpt
--> mkpart primary
--> set 1 boot on

--> copy to vmware and create new vmware..  
--> start with rescuedisk
```

```
sudo mount /dev/sda1 /mnt
sudo mount /dev/sda2 /mnt/boot/efi
for i in /dev /dev/pts /proc /sys /run; do sudo mount -B $i /mnt$i; done
sudo chroot /mnt
export PATH="/bin:/usr/sbin:$PATH"
grub-install --target=x86_64-efi /dev/sda
grub-install --recheck --target=x86_64-efi /dev/sda
```
[change /etc/fstab](https://wiki.archlinux.org/index.php/Moving_an_existing_install_into_(or_out_of)_a_virtual_machine)
```
mv /etc/X11/xorg.conf /etc/X11/xorg.conf.bak
mv /etc/X11/xorg.conf.d/10-monitor /etc/X11/xorg.conf.d/10-monitor.bak
update-initramfs -u
exit
umount -R /mnt
poweroff
```

- change boodoption in vmware to efi
