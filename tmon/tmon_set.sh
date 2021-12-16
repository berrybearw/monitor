#!/bin/ksh 

echo " 不輸入請輸入 enter , 跳出請輸入 ctrl + c "
echo " "
section=""

if [ "$section" == "" ] ; then
   echo "請選擇設定項目 "
   echo " 1. mail   : 1 "
   echo " 2. 檢查項 : 2 "
   read section
fi

if [ "$section" == 1 ] ; then

   new=f
   old=`cat tmon.conf | grep chk_sent | grep -v '#' | awk -F = '{print $2}'`
   echo " "
   echo " 請輸入 多久發一封警告信 : "
   echo " 原 mail chk_sent : " $old
   read new
   #stty echo
   
   if [ "$new" == "" ] ; then 
      new=$old
   else
      sed -i -e "s/chk_sent=\"$old\"/chk_sent=\"$new\"/" tmon.conf
   fi
   
   new=`cat tmon.conf | grep chk_sent | grep -v '#' | awk -F = '{print $2}'`
   echo " 新 mail chk_sent : " $new

   new=f
   old=`cat tmon.conf | grep mail_ser | grep -v '#' | awk -F \" '{print $2}'`
   echo " "
   echo "1. 請輸入 mail server : "
   echo " 原 mail server : " $old
   read new
   #stty echo
   
   if [ "$new" == "" ] ; then 
      new=$old
   else
      sed -i -e "s/mail_ser=\"$old\"/mail_ser=\"$new\"/" tmon.conf
   fi
   
   new=`cat tmon.conf | grep mail_ser | grep -v '#' | awk -F \" '{print $2}'`
   echo " 新 mail server : " $new
   
   new=f
   old=`cat tmon.conf | grep ck_auth | grep -v '#' | awk -F \" '{print $2}'`
   
   echo '2. smtp寄件認證，預設為"Y"郵件主機不需認証請改"N" '
   echo ' 原 設定 : ' $old
   read new
   
   if [ "$new" == "" ] ; then 
      new=$old
   else
      sed -i -e "s/ck_auth=\"$old\"/ck_auth=\"$new\"/" tmon.conf
   fi
   
   new=`cat tmon.conf | grep ck_auth | grep -v '#' | awk -F \" '{print $2}'`
   echo " 新 設定 : " $new
   
   new=f
   old=`cat tmon.conf | grep mail_to | grep -v '#' | awk -F \" '{print $2}'`
   change='mail_to'
   
   echo '3. 通知誰 '
   echo ' 原 設定 : ' $old
   read new
   
   if [ "$new" == "" ] ; then 
      new=$old
   else
      sed -i -e "s/$change=\"$old\"/$change=\"$new\"/" tmon.conf
   fi
   
   new=`cat tmon.conf | grep $change | grep -v '#'`
   echo " 新 設定 : " $new

elif [ "$section" == 2 ] ; then

   section=""
   if [ "$section" == "" ] ; then
      echo "Hi "
      echo " 請選擇檢查項 "
      echo " all : 0 "
      echo " cpu : 1 "
      echo " mem : 2 "
      echo " process : 3 "
      echo " disk space : 4 "
      echo " db space : 5 "
      echo " db lock : 6 "
      echo " db redo : 7 "
      echo " db sql : 8 "
      read section

   fi

   cd /u1/etc/tmon/set

   case $section in

      0)
       sh cpu_set
       sh mem_set
       sh ps_set
       sh du_set
       sh tbk_set
       sh lock_set
       sh redo_set
       ;;
      1)
       sh cpu_set
       ;;
      2)
       sh mem_set
       ;;
      3)
       sh ps_set
       ;;
      4)
       sh du_set
       ;;
      5)
       sh tbk_set
       ;;
      6)
       sh lock_set
       ;;
      7)
       sh redo_set
       ;;
      8)
       sh sql_set
       ;;
   esac

fi
