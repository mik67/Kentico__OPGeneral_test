$SrvInstance = "KENTICO"
$ExtName = "OPGeneral"
$ExtPath = "C:\Development\On Point - Extensions\OPGeneral\On Point Ltd._OPGeneral_1.0.0.42.app"

Uninstall-NAVApp -ServerInstance $SrvInstance -Name $ExtName
Unpublish-NAVApp -ServerInstance $SrvInstance -Name $ExtName
Sync-NAVApp -ServerInstance $SrvInstance -Name $ExtName -Mode Clean -Force
#Publish-NAVApp -ServerInstance $SrvInstance -Path $ExtPath -SkipVerification
#Sync-NAVApp -ServerInstance $SrvInstance -Name $ExtName
#Install-NAVApp -ServerInstance $SrvInstance -Name $ExtName -Version "1.0.0.0"

#shell C:\Development\'On Point - Extensions'\OPGeneral\OPGeneral_update.ps1