@echo off
(echo select disk 0
echo select partition 1
echo assign letter=s
echo exit
) | diskpart

echo Creating images...
dism /Capture-Image /ImageFile:<WINDOWS_IMAGE>.wim /CaptureDir:C:\ /Name:"OS Partition"
dism /Capture-Image /ImageFile:<EFI_IMAGE>.wim /CaptureDir:S:\ /Name:"EFI Partition"