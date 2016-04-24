#统计代码行数
find . -name "*.c" -o -name "*.cpp" | xargs wc -l 

#把sh加上可执行权限
find . -name "*.sh" -exec chmod 777 {} \;

#find 的列子 -prune 
$ find . -printf "%y %p\n"    # print the file type the first time FYI
d .
f ./test
d ./dir1
d ./dir1/test
f ./dir1/test/file
f ./dir1/test/test
d ./dir1/scripts
f ./dir1/scripts/myscript.pl
f ./dir1/scripts/myscript.sh
f ./dir1/scripts/myscript.py
d ./dir2
d ./dir2/test
f ./dir2/test/file
f ./dir2/test/myscript.pl
f ./dir2/test/myscript.sh

$ find . -name test
./test
./dir1/test
./dir1/test/test
./dir2/test

$ find . -prune
.

$ find . -name test -prune
./test
./dir1/test
./dir2/test

$ find . -name test -prune -o -print
.
./dir1
./dir1/scripts
./dir1/scripts/myscript.pl
./dir1/scripts/myscript.sh
./dir1/scripts/myscript.py
./dir2

$ find . -regex ".*/my.*p.$"
./dir1/scripts/myscript.pl
./dir1/scripts/myscript.py
./dir2/test/myscript.pl

$ find . -name test -prune -regex ".*/my.*p.$"
(no results)

$ find . -name test -prune -o -regex ".*/my.*p.$"
./test
./dir1/test
./dir1/scripts/myscript.pl
./dir1/scripts/myscript.py
./dir2/test

$ find . -regex ".*/my.*p.$" -a -not -regex ".*test.*"
./dir1/scripts/myscript.pl
./dir1/scripts/myscript.py

$ find . -not -regex ".*test.*"                   .
./dir1
./dir1/scripts
./dir1/scripts/myscript.pl
./dir1/scripts/myscript.sh
./dir1/scripts/myscript.py
./dir2
