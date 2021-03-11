#!/bin/bash
# shift命令会重新分配位置参数，其实就是把所有的位置参数都向左移动一个位置。
while [ $# -gt 0 ] ; do
	echo "first param $1"
    case $1 in
    -a) echo $1;;#即使不跳出，也不会执行下面的代码，如果break，跳出的是while
    -b) echo $1;;
	-c) echo $1;;
    esac
	shift ;
done

# 执行
# ./shift.sh -a -c -b -d
# 输出
# first param -a
# -a
# first param -c
# -c
# first param -b
# -b
# first param -d
# shift命令会重新分配位置参数，其实就是把所有的位置参数都向左移动一个位置。