#!/bin/bash

# usage: ./test.sh 需要复制的文件 目标文件夹（）
# sample: ./test.sh /c/text.jpg /d/pictures

function getCurrentDir(){
    local basepath=$(cd `dirname $0`; pwd)
    echo $basepath
}

copiedFile=$1
readonly copiedFile

destDir=$2
#目标目录未配置，使用当前目录
if  [ ! -n "$destDir" ] ;then
    destDir=$(getCurrentDir)
else
	#如果目标目录是文件，退出
	if [ -f "$destDir" ]; then
		echo "目标不是目录，无法复制。"
		exit 0
	fi
fi
readonly destDir


echo "需要复制的文件：$copiedFile, 目标文件夹：$destDir"

# -n 判断一个变量是否有值
# -d 判断目录是否存在
# -f 判断文件是否存在
if [ ! -f "$copiedFile" ]; then
	echo "文件不存在。"
	exit 0
fi

# 上面判断文件是否存在已包含在内，无需再判断是否是文件了。
# if test -d $copiedFile
# then
# 	echo "是目录。"
# 	exit 0
# fi

echo "开始复制文件 $copiedFile"
for file in $destDir/*
do
	# test -f    测试是否是文本
	# test -d    测试是否是目录
    if test -d $file
    then
        echo "复制文件到 $file"
        cp $copiedFile $file
    fi
done

