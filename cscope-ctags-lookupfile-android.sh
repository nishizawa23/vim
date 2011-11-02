#!/bin/sh

# generate tag file for lookupfile plugin
echo "Generating Lookupfile filenametags..."

echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags
find . -not -regex '.*\.\(png\|gif\)' -type f -printf "%f\t%p\t1\n" | \
        sort -f >> filenametags
# add the below line to ~/.bashrc or /etc/bash.bashrc
#let g:LookupFile_TagExpr='"./filenametags"'

#cscope for android and qualcomm modem
echo "Finding files for cscope..."

find . \( \
-path "./prebuilt" -o \
-path "./out" -o \
-path "*/.git" -o \
-path "*/.svn" -o \
-path "*/.repo" \) -prune -o \
-iname "*.[chsx]" -print -o \
-iname "*.hh" -print -o \
-iname "*.hpp" -print -o \
-iname "*.cc" -print -o \
-iname "*.cpp" -print -o \
-iname "*.java" -print -o \
-iname "*.aidl" -print -o \
-iname "*.mk" -print -o \
-iname "*.mak" -print -o \
-iname "Makefile" -print -o \
-iname "GNUmakefile" -print -o \
-iname "*.pl" -print -o \
-iname "*.pm" -print -o \
-iname "*.xml" -print -o \
-iname "*.py" -print -o \
-iname "*.rc" -print -o \
-iname "*.cmd" -print -o \
-iname "*.min" -print > cscope.files

echo "Generating cscope database..."
cscope -bqk -i cscope.files

#ctags
#ctags --c++-kinds=+p --fields=+iaS --extra=+q  -R .
#ctags -R --langmap=c++:+.inl --c++-kinds=+p --fields=+iaS --extra=+q .

echo "Generating ctags tags..."
ctags -R --langmap=c++:+.inl -h +.inl \
         --c++-kinds=+px \
         --fields=+aiKSz \
         --extra=+q \
         --exclude="\.git" \
         --exclude="\.svn" \
         --exclude="\.repo" \
         --exclude="\.\/prebuilt" \
         --exclude="\.\/out" \
         ./
echo "Done"