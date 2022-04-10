#!/bin/bash

#目錄

echo -e "##### 各項目 ##### \n"
echo -e "\n##### 1. 空間 ##### \n"

df -h 

echo -e "\n##### 2. swap ##### \n"

free -h

echo -e "\n##### 3. Genero Version ##### \n"

echo "安裝類型       : "`cd $GENERODIR ;fglWrt -V |grep 'Target'`
echo "fglrun         : "`cd $GENERODIR ;fglrun -V|grep fglrun`
echo "fglWrt         : "`cd $GENERODIR ;fglWrt -V|grep fglWrt`
echo "flmprg         : "`cd ${FLMDIR}/bin ;flmprg -V|grep flmprg`
echo "fastcgidispatch: "`cd $GENERODIR ;fastcgidispatch -V|grep fastcgidispatch`
echo "gas            : "`cd $GENERODIR ;fglgar -V|grep 'fglgar'`
echo "gsform         : "`cd $GENERODIR ;gsform -V|grep gsform`
echo "greportwriter  : "`cd $GENERODIR ;greportwriter -V|grep greportwriter`

echo -e "\n##### 4. hosts ##### \n"
cat /etc/hosts

echo -e "\n##### 5. Users ##### \n"
#fglWrt -a info users|grep '^License'
fglWrt -a info users|grep '^Product'
fglWrt -a info users|grep '^Type'
fglWrt -a info users|grep 'Users'
#fglWrt -a info users|grep '^Host'

echo -e "\n##### 6. CPU 資訊 ##### \n"

cpu_n=`cat /proc/cpuinfo |grep "processor"|wc -l`
wa=`echo "scale=5; 1/$cpu_n" |bc`
wa2=`echo "$wa*100" |bc`
echo "CPU數量:" `lscpu |grep '^CPU(s):' |sed 's/^[ \t]*//g'|cut -d: -f 2`
echo "CPU型號:" `lscpu |grep '^Model name:' |sed 's/^[ \t]*//g'|cut -d: -f 2`
echo "CPU MHz:" `lscpu |grep '^CPU MHz:' |sed 's/^[ \t]*//g'|cut -d: -f 2` 
echo "wa上限 :" $wa2"%" 


echo -e "\n##### 7. Red Hat 版本 ##### \n"
cat /etc/redhat-release

echo -e "\n##### 8. 硬碟 ##### \n"

cat /proc/scsi/scsi |grep -E 'Vendor|Type' |sed 's/^[ \t]*//g'

echo -e "\n##### 9. 0為 SSD, 1為 HDD ##### \n"
lsblk -d -o name,rota

echo -e "\n##### 10. 是否有 卡住的process ##### \n"
count=`ps -ef | grep defunct | grep -v grep | wc -l`
if [ "$count" != 0 ]; then
   echo -e "有 $count 個 process 卡住，請檢查\n"
   echo "以下是 process 相關資訊"
   ps aux | grep  Zs|grep -v 'grep'
else
   echo "無 process 卡住"
fi

echo -e "\n#### 11. AP , DB 同主機檢查 #### \n"
sh ap_db/ap_db_with

