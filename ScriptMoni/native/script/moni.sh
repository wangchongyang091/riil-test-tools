#!/bin/sh

pid=`ps -ef|grep tomcat|grep -v grep|awk '{print $2}'`
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
./jmap -heap $pid>temp.txt
line=$(awk '/PS Old Generation/{print NR}' temp.txt )
s=$line
e=$(($s+4))
awk -v a=$s -v b=$e 'NR>a&&NR<b {print $3 $4","}' temp.txt

awk -v a=$(($line+4)) 'NR==a {print $1","}' temp.txt

line=$(awk '/PS Perm Generation/{print NR}' temp.txt)
s=$line
e=$(($s+4))
awk -v a=$s -v b=$e 'NR>a&&NR<b {print $3 $4","}' temp.txt
awk -v a=$(($line+4)) 'NR==a {print $1","}' temp.txt

rm -f temp.txt
	
