@echo off
echo Preparing disk...
(echo Select disk 0
echo Clean
echo Convert gpt
echo Create partition efi size=200
echo Assign letter=s
echo Format quick fs=FAT32
echo Create partition msr size=128
echo Create partition primary
echo Assign letter=c
echo shrink minimum=15000
echo format quick fs=ntfs label="Windows"
echo create partition primary
echo format quick fs=ntfs label="Recovery"
echo set id="de94bba4-06d1-4d40-a16a-bfd50179d6ac"
echo gpt attributes=0x8000000000000001
echo assign letter=r
echo Exit
) | diskpart

echo Applying images...
dism /Apply-Image /ImageFile:<WINDOWS_IMAGE>.wim /Index:1 /ApplyDir:C:\
dism /Apply-Image /ImageFile:<EFI_IMAGE>.wim /Index:1 /ApplyDir:S:\
dism /Apply-Image /ImageFile:<RECOVERY_IMAGE>.wim /Index:1 /ApplyDir:R:\

echo Resetting bootloader
bcdedit /set {bootmgr} device partition=s:
bcdedit /set {memdiag} device partition=s:
bcdedit /set {default} device partition=c:
bcdedit /set {default} osdevice partition=c:
Bcdedit /set {FWbootmgr} displayorder {Bootmgr} /addfirst

echo Imaging done! Reboot now.
pause