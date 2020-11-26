#!/bin/bash

read -p "input a word :" word
if  [ ! -n "$word" ] ;then
    echo "you have not input a word!"
else
    echo "the word you input is $word"
fi
