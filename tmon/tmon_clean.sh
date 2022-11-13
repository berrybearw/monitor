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

date_time=`date '+%s'`

#chk_dir='/u1/etc/tmon/mon_log' 
#chmod 777 $chk_dir
#chown tiptop.tiptop $chk_dir 2>/dev/null

# 7 : 保留今天到 8 天前 ( today 10 號 會保留到 2 ~ 10 )
# 6 : 保留今天到 7 天前 
#chk_clean='7' 



#找出指定時間目錄 清理
#find $chk_dir/* -mtime +$chk_clean -print0 | xargs -0 -l1 -t rm -rf


chk_dir='/u1/etc/tmon/tmon_chk' 
chmod 777 $chk_dir
chown tiptop.tiptop $chk_dir 2>/dev/null

chk_clean='7' 

echo "$tmon_clean_time_go"

#if [ "$tmon_clean_time_go" == "Y" ]; then

   #找出指定時間目錄 清理
   find $chk_dir/* -mtime +$chk_clean -print0 | xargs -0 -l1 rm -rf

#fi

chk_dir='/u1/etc/tmon/script/basement' 
chmod 777 $chk_dir
chown tiptop.tiptop $chk_dir 2>/dev/null

#chk_clean='2' 
lim=600
#timeout 30 find $chk_dir/*_chk_*.log -mmin +5 -print0 | xargs -0 -l1 rm -rf
#timeout 30 find $chk_dir/*_chk_*.html -mmin +5 -print0 | xargs -0 -l1 rm -rf
#timeout 30 find $chk_dir/*_chk_*.html -mmin +360 -print0 | xargs -0 -l1 rm -rf
#timeout 30 find $chk_dir/* -mmin +60 -print0 | xargs -0 -l1 rm -rf

du -a --time --time-style='+%s' `find $chk_dir/ 2>/dev/null` |
awk -v MAX=$date_time '{sec=(MAX-$2); print $3 " " sec}' |
awk -v MAX=$lim '{if(MAX<$2) {print $1}}' | xargs rm -rf

#timeout 30 for f in $chk_dir/*_chk_*.log; do find $f -mmin +5 -print0 ; rm $f; done
#timeout 30 find $chk_dir/*_chk_*.html -mmin +5 -print0 | xargs -0 -l1 -t rm -rf
#timeout 30 find $chk_dir/*_chk_*.html -mmin +360 -print0 | xargs -0 -l1 -t rm -rf

#echo "$tmon_clean_time_go"

#if [ "$tmon_clean_time_go" == "Y" ]; then

   #找出指定時間目錄 清理
   #timeout 10 find $chk_dir/* -mtime +$chk_clean -print0 | xargs -0 -l1 rm -rf

#fi

chk_dir='/u1/etc/tmon/mon_log' 
chmod 777 $chk_dir
chown tiptop.tiptop $chk_dir 2>/dev/null

#chk_clean='6' 
lim=`echo | awk "{print 86400*$chk_clean}"`
#echo "$tmon_clean_time_go"

#if [ "$tmon_clean_time_go" == "Y" ]; then

   #找出指定時間目錄 清理
   #find $chk_dir/* -mtime +$chk_clean -print0 | xargs -0 -l1 rm -rf
   #find $chk_dir/* -type f -maxdepth 1 -mmin +120 -print0 | xargs -0 -l1 rm -rf
   #1. add (s)
   cd $chk_dir
   du -a --time --time-style='+%s' `find $chk_dir/ 2>/dev/null` |
   awk -v MAX=$date_time '{sec=(MAX-$2); print $3 " " sec}' |
   awk -v MAX=$lim '{if(MAX<$2) {print $1}}' | xargs rm -rf
   #1. add (e)
   #2. add (s) 只刪除 mon_log 第一層檔案 , 不抓子目錄
   lim=7200
   du -a --time --time-style='+%s' `find $chk_dir/ -maxdepth 1 -type f 2>/dev/null` |
   awk -v MAX=$date_time '{sec=(MAX-$2); print $3 " " sec}' |
   awk -v MAX=$lim '{if(MAX<$2) {print $1}}' | xargs rm -rf
   #2. add (e)

#fi


