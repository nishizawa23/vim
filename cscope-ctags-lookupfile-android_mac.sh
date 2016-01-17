#!/bin/sh

# generate tag file for lookupfile plugin
echo "Generating Lookupfile filenametags..."

echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags
gfind . -not -regex '.*\.\(png\|swp\|jpg\|gif\|o\)'  \( \
-path "./abi" -o \
-path "./art" -o \
-path "./cts" -o \
-path "./development" -o \
-path "./developers" -o \
-path "./libcore" -o \
-path "./libnativehelper" -o \
-path "./ndk" -o \
-path "./pdk" -o \
-path "./prebuilts" -o \
-path "./sdk" -o \
-path "./external/qemu" -o \
-path "./external/chromium" -o \
-path "./external/chromium-libpac" -o \
-path "./external/chromium-trace" -o \
-path "./external/chromium_org" -o \
-path "./docs" -o \
-path "./out" -o \
-path "*/.git" -o \
-path "*/.svn" -o \
-path "*/.repo" \) -prune -o -type f -printf "%f\t%p\t1\n" | \
sort -f >> filenametags

#cscope for android and qualcomm modem
echo "Finding files for cscope..."

find . \( \
-path "./abi" -o \
-path "./art" -o \
-path "./cts" -o \
-path "./development" -o \
-path "./developers" -o \
-path "./libcore" -o \
-path "./libnativehelper" -o \
-path "./ndk" -o \
-path "./pdk" -o \
-path "./prebuilts" -o \
-path "./sdk" -o \
-path "./external/qemu" -o \
-path "./external/chromium" -o \
-path "./external/chromium-libpac" -o \
-path "./external/chromium-trace" -o \
-path "./external/chromium_org" -o \
-path "./docs" -o \
-path "./out" -o \
-path "*/.git" -o \
-path "*/.svn" -o \
-path "*/.repo" \) -prune -o \
-type f \
-iname "*.[chsx]" -print -o \
-iname "*.hh" -print -o \
-iname "*.hpp" -print -o \
-iname "*.cpp" -print -o \
-iname "*.java" -print -o \
-iname "*.aidl" -print -o \
-iname "*.mk" -print -o \
-iname "Makefile" -print -o \
-iname "*.xml" -print -o \
-iname "*.rc" -print -o \
-iname "*.min" -print > cscope.files

echo "Generating cscope database..."
cscope -bqk -i cscope.files

#ctags
#ctags --c++-kinds=+p --fields=+iaS --extra=+q  -R .
#ctags -R --langmap=c++:+.inl --c++-kinds=+p --fields=+iaS --extra=+q .

echo "Generating ctags tags..."
/Users/pete_doherty/Git/ctags-5.8/ctags -R --langmap=c++:+.inl -h +.inl \
         --c++-kinds=+px \
         --fields=+aiKSz \
         --extra=+q \
         --exclude="\.git" \
         --exclude="\.svn" \
         --exclude="\.repo" \
         --exclude="\.\/prebuilt" \
         --exclude="\.\/out" \
		 -L cscope.files \
		 -f androidtags
         
echo "Done"
