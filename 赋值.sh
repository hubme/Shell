#!/bin/bash

#
# 1. 等号赋值两边不能有空格
# 2. 命令与选项之间需要空格
# 3. 管道两边空格可有可无
#

name="VanceKing"
echo $name

apple="apple"
readonly apple
echo apple
# 回报 "apple: readonly variable" 错误
# apple="banana"