#!/bin/bash

function printHelloWorld(){
	echo "Hello World!"
}

function printAllParams(){
    # echo "第一个参数为 $1 !"
    # echo "第二个参数为 $2 !"
    # echo "第二个参数为 $9 !"
    # echo "第十个参数为 $10 !"
    # echo "第十个参数为 ${10} !"
    # echo "第十一个参数为 ${11} !"
    echo "参数总数有 $# 个!"
    echo "$*"
}

#
# usage:
# dir=$(getCurrentDir)
# echo "$dir"
#
function getCurrentDir(){
    local basepath=$(cd `dirname $0`; pwd)
    echo $basepath
}

function printWhichDir(){
	# dirname $0，取得当前执行的脚本文件的父目录
	# cd `dirname $0`，进入这个目录(切换当前工作目录)
	# pwd，显示当前工作目录(cd执行后的)
	basepath=$(cd `dirname $0`; pwd)
	echo $basepath
}

# Windows 环境下,运行后会生成一个"0"文件
function getCurrentDirSize(){
    count=`ls $*|wc -w`
    if [ "$count" > "0" ]; then
        echo $count
    else
        echo "empty"
    fi
}

# 判断目录是否为空
function checkDirEmpty(){
    DIRECTORY=$1
    readonly DIRECTORY
    if [ "`ls -A $DIRECTORY`" = "" ]; then
        echo "$DIRECTORY is empty!"
    else
        echo "$DIRECTORY is not empty!"
    fi
}
