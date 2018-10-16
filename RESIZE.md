# Expand your file systems
> So, you downloaded a preconfigured Lakka image...
> ...and it wasn't from Lakka

Chance are, when the image you downloaded was made, it was 'frozen' from a small size SD Card
Let's say 1GB for this use case

Here's what happened next:
* [ ] Burnt the image onto a 32GB card
* [ ] Set everything up
* [ ] Started uploading ROMs
* [x] The upload failed saying you where out of space!!!

"But it's a 32GB card you say!"

## We will now show you how to resize your SD Card remotely

#### SSH into your Lakka device
> See [README.md](README.md) on how to do this

```shell
$ ssh root@[ip_address]
```

## Check your drive space
> Even loading the pre burnt image onto a 32GB will show you that you only have 1GB (use case) space on your SD Card
```shell
$ df -h
```

#### Ensure you are in the root director
```shell
$ cd /
```

#### Lock and Stop XBMC
```shell
$ touch /var/lock/xbmc.disabled
$ killall -9 xbmc.bin
```

#### Unmount the storage partition (where you put all the ROMs)
```shell
$ umount /storage
```

### For the rest we will be using a program call **parted**, it's part of Lakka
> **mmcblk0** is the default partition in Lakka...  ...**ALWAYS**
```shell
$ parted /dev/mmcblk0
```
Once you start parted, you will see your cursor preceeded by *(parted)* instead of *$*
Below, in the next steps you will see *(parted)*, this is NOT something you need to type

#### Display Sectors on the "parted" drive
```shell
(parted) unit s
```

#### Display partitions in parter
```shell
(parted) p
```

#### Remove the *storage* partition
```shell
(parted) rm 2
```

#### Recreate the *storage* partition
> The numbers below are *sectors* where to start creating and ending the next partition, the *-1* just means all the way to the end
```shell
(parted) mkpart primary 258048 -1
```

#### Quit parted
> We are now DONE in parted, you will be returned to the *$* cursor
```shell
(parted) quit parted
```

### Back in normal terminal

#### Ensure the new partition is an **ext2** file system and check for errors
> mmcblk0p2 is the second partition of mmcblk0, which is the partition we worked with in *parted*
```shell
$ e2fsck -f /dev/mmcblk0p2
```

#### Resize the ext2 partition
```shell
$ resize2fs /dev/mmcblk0p2
```

#### Mount the partition again
> Remeber how we unmounted using *parted*...
```shell
$ mount /dev/mmcblk0p2 /storage
```

## Check your drive space
> This time around you will notice that the sector labeled **/storage** has been inflated to the remaining space of your SD card.
In this example (the 32GB card) you should have around 30.5GB space

```shell
$ df -h
```

#### Remove the lock
> The one we create above
```shell
$rm /var/lock/xbmc.disabled
```

