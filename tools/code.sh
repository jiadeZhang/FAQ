#统计代码行数
find . -name "*.c" -o -name "*.cpp" | xargs wc -l 

#把sh加上可执行权限
find . -name "*.sh" -exec chmod 777 {} \;

