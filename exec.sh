#!/usr/bin/bash

echo "what is your name?"
read name

echo "what is your pass"
read -s pass            #-s is silent for password

#or 

read -p "what is you language" lang

echo "$name, $pass, lang: $lang"
