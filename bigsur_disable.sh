# For those who does not care iCloud and stock mac Applications
# As well as stopping Spotlight completley
# tested on bigsur (Intel and M )

#!/bin/bash

# Reboot your Mac into Recovery Mode 
# Terminal from top menu
# csrutil disable
# csrutil authenticated-root disable
# reboot to desktop

# Find your root mnt's device
# run mnt and chop off the last s, e.g. if your / is /dev/disk1s5s1 -> you'll mnt /dev/disk1s5


sudo mkdir  mnt
sudo mount -o nobrowse -t apfs /dev/disk1s5 mnt/

# Disable telemetry home
echo 127.0.0.1 ocsp.apple.com | sudo tee -a /etc/hosts
echo ::1       ocsp.apple.com | sudo tee -a /etc/hosts

# ---------------------------  AGENTS to disable -------------
TODISABLE=()


TODISABLE+=(
# --------------------- CLOUD -------------------------

#'com.apple.cloudd' \
#'com.apple.cloudpaird' \
#'com.apple.cloudphotod' \
#'com.apple.cloudphotosd' \
#'com.apple.followupd' \
#'com.apple.icloud.searchpartyuseragent' \
#'com.apple.icloud' \
#'com.apple.iCloudNotificationAgent' \
#'com.apple.iCloudUserNotifications' \
#'com.apple.itunescloudd' \
#'com.apple.protectedcloudstorage.protectedcloudkeysyncing' \
#'com.apple.webinspectord' \
#'com.apple.security.cloudkeychainproxy3'  \

# -------------------- SAFARI ---------------------


#'com.apple.Safari.SafeBrowsing.Service' \
#'com.apple.SafariBookmarksSyncAgent' \
#'com.apple.SafariCloudHistoryPushAgent' \
#'com.apple.safaridavclient' \
#'com.apple.SafariHistoryServiceAgent' \
#'com.apple.SafariLaunchAgent' \
#'com.apple.SafariNotificationAgent' \
#'com.apple.SafariPlugInUpdateNotifier' \
#'com.apple.swcd' \
#'com.apple.WebKit.PluginAgent' \
#'com.apple.Safari.PasswordBreachAgent' \

# -------------------- ADD RELATED ---------------------------

'com.apple.ap.adprivacyd' \
'com.apple.ap.adservicesd' \
'com.apple.ap.promotedcontentd' \


# ------------------- Game Center / Passbook / Apple TV / Homekit...

'com.apple.gamed' \
'com.apple.passd' \
'com.apple.Maps.pushdaemon' \
'com.apple.videosubscriptionsd' \
'com.apple.homed' \


# -------------------- SIRI ---------------------------

'com.apple.assistant_service' \
'com.apple.assistantd' \
'com.apple.parsec-fbf' \
'com.apple.siri-distributed-evaluation' \
'com.apple.Siri.agent' \
'com.apple.siri.context.service' \
'com.apple.siriknowledged' \

# -------------------- Screensharing ---------------------------

#'com.apple.screensharing.MessagesAgent' \
#'com.apple.screensharing.agent' \
#'com.apple.screensharing.menuextra' \

# -------------------- Sidecar --------------

'com.apple.sidecar-hid-relay' \
'com.apple.sidecar-relay' \

# -------------------- Screentime -------------

'com.apple.ScreenTimeAgent' \
'com.apple.UsageTrackingAgent' \

# --------------------Family Parent Control ---------------------

'com.apple.familycircled' \
'com.apple.familycontrols.useragent' \
'com.apple.familynotificationd' \
'com.apple.parentalcontrols.check' \


# --------------------Classroom -------------------------------

'com.apple.progressd' \

# --------------------Spotlight------------------------------

#'com.apple.corespotlightd' \
#'com.apple.corespotlightservice' \
#'com.apple.Spotlight' \
#'com.apple.metadata.mdwrite' \
#'com.apple.metadata.mdbulkimport' \
#'com.apple.metadata.mdflagwriter' \
#'com.apple.mdworker.mail' \
#'com.apple.mdmclient.agent' \
#'com.apple.mdworker.shared' \
#'com.apple.mdworker.sizing' \
#'com.apple.mdworker.single.plist' \
#'com.apple.mdworker.single.arm64' \
#'com.apple.mdworker.single.x86_64' \
#'com.apple.mdworker.sizing' \
#'com.apple.mdworker.bundles' \

# -------------------- iMessage / Facetime

#'com.apple.avconferenced' \
#'com.apple.findmymacmessenger' \
#'com.apple.imagent' \
#'com.apple.imautomatichistorydeletionagent' \
#'com.apple.imklaunchagent' \
#'com.apple.imtransferagent' \

# --------------------Others ---------------------------

'com.apple.macos.studentd' \
'com.apple.photoanalysisd' \
#'com.apple.photolibraryd' \
#'com.apple.PhotoLibraryMigrationUtility.XPC' \
#'com.apple.podcasts.PodcastContentService' \
'com.apple.softwareupdate_notify_agent' \
'com.apple.SoftwareUpdateNotificationManager' \
#'com.apple.suggestd' \
#'com.apple.syncdefaultsd' \
'com.apple.UsageTrackingAgent' \
'com.apple.identityservicesd' \
'com.apple.touristd' \
#'com.apple.appstoreagent' \
#'com.apple.storedownloadd'

)

sudo mkdir mnt/System/Library/LaunchAgents/OldPlist

for agent in "${TODISABLE[@]}"
do
    sudo mv mnt/System/Library/LaunchAgents/${agent}.plist mnt/System/Library/LaunchAgents/OldPlist/${agent}.plist.bak
    echo "[OK] Agent ${agent} disabled"
done

# ---------------------------- DAEMONS to disable --------------------------------------
TODISABLE=()

# iCloud
TODISABLE+=(

# --------------------- CLOUD -------------------------

#'com.apple.analyticsd' \
#'com.apple.cloudd' \
#'com.apple.iCloudStats' \
#'com.apple.icloud.searchpartyd'

# ---------------------Spotlight

#'com.apple.metadata.mds.index' \
#'com.apple.metadata.mds' \
#'com.apple.metadata.mds.spindump' \
#'com.apple.metadata.mds.scan' \


# --------------------- Others

'com.apple.appleseed.fbahelperd' \
'com.apple.familycontrols' \
'com.apple.findmymac' \
'com.apple.findmymacmessenger' \
'com.apple.locate' \
'com.apple.locationd' \
#'com.apple.metadata.mds.index' \
#'com.apple.metadata.mds.scan' \
#'com.apple.metadata.mds.spindump' \
#'com.apple.metadata.mds' \
'com.apple.SubmitDiagInfo' \
'com.apple.mobile.softwareupdated' \
'com.apple.softwareupdated' \
'com.apple.siriinferenced' 


)

sudo mkdir mnt/System/Library/LaunchDaemons/OldPlist

for daemon in "${TODISABLE[@]}"
do
    sudo mv mnt/System/Library/LaunchDaemons/${daemon}.plist mnt/System/Library/LaunchDaemons/OldPlist/${daemon}.plist.bak
    echo "[OK] Daemon ${daemon} disabled"
done

#----------------------- REMOVE APPS ------------------------------------

sudo rm -rf ~/mnt/System/Applications/Chess.app
#sudo rm -rf ~/mnt/System/Applications/FaceTime.app
sudo rm -rf ~/mnt/System/Applications/Home.app
sudo rm -rf ~/mnt/System/Applications/Maps.app
sudo rm -rf ~/mnt/System/Applications/Messages.app
#sudo rm -rf ~/mnt/System/Applications/News.app
sudo rm -rf ~/mnt/System/Applications/Photo\ Booth.app
#sudo rm -rf ~/mnt/System/Applications/Photos.app
#sudo rm -rf ~/mnt/System/Applications/Podcasts.app
sudo rm -rf ~/mnt/System/Applications/Siri.app
sudo rm -rf ~/mnt/System/Applications/Stickies.app
sudo rm -rf ~/mnt/System/Applications/Stocks.app
sudo rm -rf ~/mnt/System/Applications/TV.app
#sudo rm -rf ~/mnt/System/Applications/VoiceMemos.app
#sudo rm -rf ~/mnt/System/Applications/QuickTime\ Player.app 

# -----------------------------------------------------------------
# Mission Control
defaults write com.apple.dock mcx-expose-disabled -bool TRUE
#defaults delete com.apple.dock mcx-expose-disabled

# Dashboard
defaults write com.apple.dashboard mcx-disabled -bool TRUE
#defaults delete com.apple.dashboard mcx-disabled

# Spotlight
#sudo mdutil -a -i off
#sudo chmod 0 mnt/System/Library/CoreServices/Spotlight.app
#sudo mdutil -a -i on
#sudo chmod 755 mnt/System/Library/CoreServices/Spotlight.app

# ------------------------ REMOVE OTHER STUFF ---------------------------
# Sometime MRT.app goes 120% CPU Time , both of them --------------------

sudo mv mnt/Library/Apple/System/Library/CoreServices/MRT.app mnt/Library/Apple/System/Library/CoreServices/MRT.back
sudo mv mnt/System/Library/Templates/Data/Library/Apple/System/Library/CoreServices/MRT.app mnt/System/Library/Templates/Data/Library/Apple/System/Library/CoreServices/MRT.back

killall Dock
sudo bless --folder mnt/System/Library/CoreServices --bootefi --create-snapshot && sudo reboot



