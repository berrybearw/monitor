#!/bin/ksh

if [ "$1" == "tes" ] ; then

   mode="test"

   tmon_clean_time_go="Y"

fi

if [ "$mode" == "test" ] ; then

   echo "$mode"
else
   tmon_clean_time_go=`cat /u1/etc/tmon/chk_script_time.txt | 
                       grep "tmon_clean_time_go" | awk -F : '{print $2}' | sed 's/^[ \t]*//g'`

fi

chk_dir='/u1/etc/tmon/mon_log' 

# 7 : 保留今天到 8 天前 ( today 10 號 會保留到 2 ~ 10 )
# 6 : 保留今天到 7 天前 
chk_clean='7' 

echo "$tmon_clean_time_go"

if [ "$tmon_clean_time_go" == "Y" ]; then

   #找出指定時間目錄 清理
   find $chk_dir/* -mtime +$chk_clean -print0 | xargs -0 -l1 -t rm -rf

fi

chk_dir='/u1/etc/tmon/tmon_chk' 

chk_clean='7' 

echo "$tmon_clean_time_go"

if [ "$tmon_clean_time_go" == "Y" ]; then

   #找出指定時間目錄 清理
   find $chk_dir/* -mtime +$chk_clean -print0 | xargs -0 -l1 -t rm -rf

fi

chk_dir='/u1/etc/tmon/script/basement' 

chk_clean='2' 

timeout 30 find $chk_dir/*_chk_*.log -mmin +5 -print0 | xargs -0 -l1 -t rm -rf
timeout 30 find $chk_dir/*_chk_*.html -mmin +5 -print0 | xargs -0 -l1 -t rm -rf
echo "$tmon_clean_time_go"

if [ "$tmon_clean_time_go" == "Y" ]; then

   #找出指定時間目錄 清理
   timeout 10 find $chk_dir/* -mtime +$chk_clean -print0 | xargs -0 -l1 -t rm -rf

fi

chk_dir='/u1/etc/tmon/mon_log' 

chk_clean='6' 

echo "$tmon_clean_time_go"

if [ "$tmon_clean_time_go" == "Y" ]; then

   #找出指定時間目錄 清理
   find $chk_dir/* -mtime +$chk_clean -print0 | xargs -0 -l1 -t rm -rf

fi
