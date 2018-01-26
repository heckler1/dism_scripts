# DISM
These scripts capture and apply GPT/UEFI Windows installations using DISM.

## ApplyImage
The ApplyImage script restores DISM images to the main hard drive. It prepares the hard drive with the appropriate partitions: an EFI partition, an MSR partition, an OS partition and a recovery partition. It then restores the specific .wim files to the appropriate partitions, and prepares the EFI bootloader on the new disk.

## CreateImage
The CreateImage script mounts the EFI partition and then captures DISM images of the EFI partition and the main OS partition.
