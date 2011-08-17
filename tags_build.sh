#!/bin/bash
find ./ -name "*.h" -o -name "*.c" -o -name "*.S" -o -name "*.s" -o -name "*lds" > mytags.files
ctags -f ./mytags -L mytags.files

find ./ -name "*.h" -o -name "*.c" -o -name "*.S" -o -name "*.s" -o -name "*lds" > cscope.files
cscope -bkq -f ./cscope.out -i cscope.files

# cursor: 2 del

