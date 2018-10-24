#!/bin/sh

# source build/envsetup.sh
# lunch aosp_x86-eng #(or pick your favorite lunch target)
# make
# mmm development/tools/idegen/
# development/tools/idegen/idegen.sh

cat android.iml | grep isTestSource=\"false\" > tmp.1
echo '' > vim-android-source.sh
sed -i '1 i#!/bin/sh \
# generate tag file for lookupfile plugin \
echo "Generating Lookupfile filenametags..." \
echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags' vim-android-source.sh
sed -i '$ afind \\' vim-android-source.sh

sed "s/<sourceFolder url=\"file:\/\/\$MODULE_DIR\$\\//\"/g;s/ isTestSource=\"false\"\/>/ \\\/g" tmp.1 > tmp.3

sed "/\"\.\/cts\//d;/\"\.\/developers\//d;/\"\.\/developers\//d;/\"\.\/development\//d;/\"\.\/toolchain\//d;/\"\.\/prebuilts\//d;/\"\.\/toolchain\//d;/\"\.\/tools\//d;/\"\.\/sdk\//d" tmp.3 >> vim-android-source.sh

sed -i '$ a-type f -not -type l -printf "%f\\t%p\\t1\\n" | sort -f >> filenametags' vim-android-source.sh

sed -i '$ a#cscope for android and qualcomm modem' vim-android-source.sh
sed -i '$ aecho "Finding files for cscope..."' vim-android-source.sh

sed -i '$ afind \\' vim-android-source.sh
sed "/\"\.\/cts\//d;/\"\.\/developers\//d;/\"\.\/developers\//d;/\"\.\/development\//d;/\"\.\/toolchain\//d;/\"\.\/prebuilts\//d;/\"\.\/toolchain\//d;/\"\.\/tools\//d;/\"\.\/sdk\//d" tmp.3 >> vim-android-source.sh
sed -i '$ a-type f -not -type l \\' vim-android-source.sh
sed -i '$ a-iname "*.[chsx]" -print -o \\\
-iname "*.hh" -print -o \\\
-iname "*.hpp" -print -o \\\
-iname "*.cc" -print -o \\\
-iname "*.cpp" -print -o \\\
-iname "*.java" -print -o \\\
-iname "*.aidl" -print -o \\\
-iname "*.mk" -print -o \\\
-iname "*.m" -print -o \\\
-iname "*.mak" -print -o \\\
-iname "Makefile" -print -o \\\
-iname "GNUmakefile" -print -o \\\
-iname "*.xml" -print -o \\\
-iname "*.rc" -print -o \\\
-iname "*.cmd" -print -o \\\
-iname "*.min" -print > cscope.files' vim-android-source.sh

sed -i '$ aecho "Generating cscope database..."' vim-android-source.sh
sed -i '$ acscope -bqk -i cscope.files \' vim-android-source.sh
sed -i '$ aecho "Generating ctags tags..."' vim-android-source.sh

sed -i '$ actags -R --langmap=c++:+.inl -h +.inl \\\
         --c++-kinds=+px  \\\
         --fields=+aiKSz  \\\
         --extra=+q  \\\
         --exclude="\.git"  \\\
         --exclude="\.svn"  \\\
         --exclude="\.repo" \\\
         -L cscope.files  \\\
         -f androidtags \
echo "Done"' vim-android-source.sh
sed -i '$ arm tmp.*' vim-android-source.sh
