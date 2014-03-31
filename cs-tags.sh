#!/bin/sh

# generate tag file for lookupfile plugin
echo "Generating Lookupfile filenametags..."

echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags
gfind . -not -regex '.*\.\(png\|swp\|jpg\|gif\|o\)' -type f -printf "%f\t%p\t1\n" | \
        sort -f >> filenametags
# add the below line to ~/.bashrc or /etc/bash.bashrc
#let g:LookupFile_TagExpr='"./filenametags"'

#cscope for android and qualcomm modem
echo "Finding files for cscope..."

find \
./packages/apps/Bluetooth/src \
./packages/apps/Browser/src \
./packages/apps/Calendar/src \
./packages/apps/Calendar/extensions_src \
./packages/apps/Calculator/src \
./packages/apps/CertInstaller/src \
./packages/apps/Contacts/src \
./packages/apps/ContactsCommon/src \
./packages/apps/DeskClock/src \
./packages/apps/Dialer/src \
./packages/apps/Email/src \
./packages/apps/Email/emailcommon/src \
./packages/apps/Gallery2/src \
./packages/apps/Gallery2/src_pd \
./packages/apps/Gallery2/gallerycommon/src \
./packages/apps/HTMLViewer/src \
./packages/apps/Launcher2/src \
./packages/apps/Mms/src \
./packages/apps/Nfc/src \
./packages/apps/Nfc/nci/src \
./packages/apps/PackageInstaller/src \
./packages/apps/Phone/src \
./packages/apps/PhoneCommon/src \
./packages/apps/QuickSearchBox/src \
./packages/apps/Provision/src \
./packages/apps/Settings/src \
./packages/apps/SoundRecorder/src \
./packages/apps/Stk/src \
./packages/apps/VoiceDialer/src \
./packages/providers/CalendarProvider/src \
./packages/providers/ContactsProvider/src \
./packages/providers/DownloadProvider/src \
./packages/providers/DrmProvider/src \
./packages/providers/MediaProvider/src \
./packages/providers/TelephonyProvider/src \
./packages/screensavers/Basic/src \
./packages/screensavers/PhotoTable/src \
./packages/screensavers/WebView/src \
./frameworks/base/cmds/am/src \
./frameworks/base/cmds/input/src \
./frameworks/base/cmds/pm/src \
./frameworks/base/cmds/svc/src \
./frameworks/base/core/java \
./frameworks/base/drm/java \
./frameworks/base/graphics/java \
./frameworks/base/keystore/java \
./frameworks/base/location/java \
./frameworks/base/location/lib/java \
./frameworks/base/media/java \
./frameworks/base/media/mca/effect/java \
./frameworks/base/media/mca/filterfw/java \
./frameworks/base/media/mca/filterpacks/java \
./frameworks/base/nfc-extras/java \
./frameworks/base/obex \
./frameworks/base/opengl/java \
./frameworks/base/packages/FusedLocation/src \
./frameworks/base/packages/SettingsProvider/src \
./frameworks/base/packages/SystemUI/src \
./frameworks/base/policy/src \
./frameworks/base/sax/java \
./frameworks/base/services/java \
./frameworks/base/telephony/java \
./frameworks/base/test-runner/src \
./frameworks/base/wifi/java \
./frameworks/ex/carousel/java \
./frameworks/ex/chips/src \
./frameworks/ex/common/java \
./frameworks/ex/variablespeed/src \
./frameworks/opt/calendar/src \
./frameworks/opt/telephony/src/java \
./frameworks/opt/mms/src/java \
./frameworks/opt/net/voip/src/java \
./frameworks/opt/vcard/java \
./frameworks/support/v13/java \
./frameworks/support/v13/ics \
./frameworks/support/v13/ics-mr1 \
./development/samples/ApiDemos/src \
./development/samples/ApiDemos/tests/src \
./development/samples/Compass/src \
./development/samples/HelloActivity/src \
./development/samples/HelloActivity/tests/src \
./development/samples/Home/src \
./development/samples/LunarLander/src \
./development/samples/LunarLander/tests/src \
./development/samples/NotePad/src \
./development/samples/NotePad/tests/src \
./development/samples/RSSReader/src \
./development/samples/SkeletonApp/src \
./development/samples/SkeletonApp/tests/src \
./development/samples/Snake/src \
./development/samples/Snake/tests/src \
./libcore/dalvik/src/main/java \
./libcore/json/src/main/java \
./libcore/luni/src/main/java \
./libcore/xml/src/main/java \
./external/apache-http/src \
./external/bouncycastle/bcprov/src/main/java \
./external/guava/guava/src \
./external/libphonenumber/java/src \
./external/mp4parser/isoparser/src/main/java \
./external/nist-sip/java \
./external/tagsoup/src \
./external/xmp_toolkit/XMPCore/src \
-iname "*.java" -print -o \
-iname "*.aidl" -print -o \
-iname "*.mk" -print -o \
-iname "*.xml" -print > cscope.files

echo "Generating cscope database..."
cscope -bqk -i cscope.files

#ctags

echo "Generating ctags tags..."

/Users/pete_doherty/Git/ctags-5.8/ctags -R --langmap=Java:.java --languages=Java -L cscope.files -f androidtags

echo "Done"
