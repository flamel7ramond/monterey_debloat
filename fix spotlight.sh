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

sudo mount -o nobrowse -t apfs /dev/disk1s5 mnt/

# ---------------------------  AGENTS to disable -------------
TOENABLE=()


TOENABLE+=(
# --------------------- CLOUD -------------------------

'com.apple.cloudd' \
'com.apple.cloudpaird' \
'com.apple.cloudphotod' \
'com.apple.cloudphotosd' \
'com.apple.followupd' \
'com.apple.icloud.searchpartyuseragent' \
'com.apple.icloud' \
'com.apple.iCloudNotificationAgent' \
'com.apple.iCloudUserNotifications' \
'com.apple.itunescloudd' \
'com.apple.protectedcloudstorage.protectedcloudkeysyncing' \
'com.apple.webinspectord' \
'com.apple.security.cloudkeychainproxy3'  \

# -------------------- SAFARI ---------------------


'com.apple.Safari.SafeBrowsing.Service' \
'com.apple.SafariBookmarksSyncAgent' \
'com.apple.SafariCloudHistoryPushAgent' \
'com.apple.safaridavclient' \
'com.apple.SafariHistoryServiceAgent' \
'com.apple.SafariLaunchAgent' \
'com.apple.SafariNotificationAgent' \
'com.apple.SafariPlugInUpdateNotifier' \
'com.apple.swcd' \
'com.apple.WebKit.PluginAgent' \
'com.apple.Safari.PasswordBreachAgent' \

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

'com.apple.screensharing.MessagesAgent' \
'com.apple.screensharing.agent' \
'com.apple.screensharing.menuextra' \

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

'com.apple.corespotlightd' \
'com.apple.corespotlightservice' \
'com.apple.Spotlight' \
'com.apple.metadata.mdwrite' \
'com.apple.metadata.mdbulkimport' \
'com.apple.metadata.mdflagwriter' \
'com.apple.mdworker.mail' \
'com.apple.mdmclient.agent' \
'com.apple.mdworker.shared' \
'com.apple.mdworker.sizing' \
'com.apple.mdworker.single.plist' \
'com.apple.mdworker.single.arm64' \
'com.apple.mdworker.single.x86_64' \
'com.apple.mdworker.sizing' \
'com.apple.mdworker.bundles' \

# -------------------- iMessage / Facetime

'com.apple.avconferenced' \
'com.apple.findmymacmessenger' \
'com.apple.imagent' \
'com.apple.imautomatichistorydeletionagent' \
'com.apple.imklaunchagent' \
'com.apple.imtransferagent' \

# --------------------Others ---------------------------

'com.apple.macos.studentd' \
'com.apple.photoanalysisd' \
'com.apple.photolibraryd' \
'com.apple.PhotoLibraryMigrationUtility.XPC' \
'com.apple.podcasts.PodcastContentService' \
'com.apple.softwareupdate_notify_agent' \
'com.apple.SoftwareUpdateNotificationManager' \
'com.apple.suggestd' \
'com.apple.syncdefaultsd' \
'com.apple.UsageTrackingAgent' \
'com.apple.identityservicesd' \
'com.apple.touristd' \
'com.apple.appstoreagent' \
'com.apple.storedownloadd'

)

for agent in "${TOENABLE[@]}"
do
    sudo mv mnt/System/Library/LaunchAgents/OldPlist/${agent}.plist.bak mnt/System/Library/LaunchAgents/${agent}.plist
    echo "[OK] Agent ${agent} enabled"
done
# ---------------------------- DAEMONS to disable --------------------------------------
TOENABLE=()

# iCloud
TOENABLE+=(

# --------------------- CLOUD -------------------------

'com.apple.analyticsd' \
'com.apple.cloudd' \
'com.apple.iCloudStats' \
'com.apple.icloud.searchpartyd'

# ---------------------Spotlight

'com.apple.metadata.mds.index' \
'com.apple.metadata.mds' \
'com.apple.metadata.mds.spindump' \
'com.apple.metadata.mds.scan' \


# --------------------- Others

'com.apple.appleseed.fbahelperd' \
'com.apple.familycontrols' \
'com.apple.findmymac' \
'com.apple.findmymacmessenger' \
'com.apple.locate' \
'com.apple.locationd' \
'com.apple.metadata.mds.index' \
'com.apple.metadata.mds.scan' \
'com.apple.metadata.mds.spindump' \
'com.apple.metadata.mds' \
'com.apple.SubmitDiagInfo' \
'com.apple.mobile.softwareupdated' \
'com.apple.softwareupdated' \
'com.apple.siriinferenced' 


)

for daemon in "${TOENABLE[@]}"
do
    sudo mv mnt/System/Library/LaunchDaemons/OldPlist/${daemon}.plist.bak mnt/System/Library/LaunchDaemons/${daemon}.plist
    echo "[OK] Daemon ${daemon} enabled"
done

# -----------------------------------------------------------------
# Mission Control
defaults delete com.apple.dock mcx-expose-disabled

# Dashboard
defaults delete com.apple.dashboard mcx-disabled

# Spotlight
sudo mdutil -a -i on
sudo chmod 755 mnt/System/Library/CoreServices/Spotlight.app

sudo mv mnt/Library/Apple/System/Library/CoreServices/MRT.back mnt/Library/Apple/System/Library/CoreServices/MRT.app
sudo mv mnt/System/Library/Templates/Data/Library/Apple/System/Library/CoreServices/MRT.back mnt/System/Library/Templates/Data/Library/Apple/System/Library/CoreServices/MRT.app

killall Dock
sudo bless --folder mnt/System/Library/CoreServices --bootefi --create-snapshot && sudo reboot