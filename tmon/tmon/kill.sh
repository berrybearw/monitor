
#passwd='tiptop'

#pid=`ps -ef | grep fglrun | grep -v grep | grep -v azzp951 | grep $1 | awk '{print $2}'`
#pid=`ps -ef | grep -v grep | grep -v azzp951 | grep $1 | awk '{print $2}'`
date_dir=`date '+%Y%m%d'` 
#date_file=`date '+%H%M'` 
#for i in $pid 
#do
  #echo "kill -9 $i"
  if [ "$USER" != root ] ; then
     echo "kill -9 $1" >> /u1/etc/tmon/mon_log/kill_chk_${2}.log
     kill -9 $1 >> /u1/etc/tmon/mon_log/kill_chk_${2}.log 2>&1
  else
     echo "sudo kill -9 $1" >> /u1/etc/tmon/mon_log/kill_chk_${2}.log
     sudo kill -9 $1 >> /u1/etc/tmon/mon_log/kill_chk_${2}.log 2>&1
  fi
  #echo "$passwd" | sudo -S kill -9 $i
#done
