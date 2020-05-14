$SrvInstance = "KENTICO"
$ExtName = "OPGeneral"
$ExtPath = "C:\Development\On Point - Extensions\OPGeneral\On Point Ltd._OPGeneral_1.0.0.74.app"

Publish-NAVApp -ServerInstance $SrvInstance -Path $ExtPath -SkipVerification
Sync-NavApp -ServerInstance $SrvInstance -Name $ExtName -Version 1.0.0.74
Start-NavAppDataUpgrade -ServerInstance $SrvInstance -Name $ExtName -Version 1.0.0.74
Unpublish-NAVApp -ServerInstance $SrvInstance -Name $ExtName -Version 1.0.0.49
#shell C:\Development\'On Point - Extensions'\OPGeneral\OPGeneral_upgrade.ps1


#Unpublish-NAVApp -ServerInstance KENTICO_navuserpwd -Name OPGeneral -Version 1.0.0.36