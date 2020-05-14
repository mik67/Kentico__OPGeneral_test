
$SrvInstance = "Kentico_navuserpwd"
$ExtName = "OPGeneral"
$ExtPath = "C:\Development\On Point - Extensions\OPGeneral\On Point Ltd._OPGeneral_1.0.0.70.app"

#Uninstall-NAVApp -ServerInstance $SrvInstance -Name $ExtName

#Unpublish-NAVApp -ServerInstance $SrvInstance -Name $ExtName -Version 1.0.0.70
Sync-NavApp -ServerInstance $SrvInstance -Name $ExtName -Mode Clean -Force

#shell C:\Development\'On Point - Extensions'\OPGeneral\OPGeneral_uninstall.ps1

