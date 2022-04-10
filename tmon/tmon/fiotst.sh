tdate=`date +%Y%m%d`
logdir=/u1/etc/tmon/fio-3.16/log/
logfile=${logdir}fio.log
mkdir -p $logdir
start_time=`date`

echo "FIO測試" > $logfile
echo '測試開始時間 ' $start_time >> $logfile

echo "FIO 隨機讀取測試中"
#隨機讀
fio -direct=1 -iodepth=128 -rw=randread -ioengine=libaio -bs=4k -size=1G -numjobs=1 -runtime=1000 -group_reporting -filename=iotest_randr${tdate} -name=Rand_R_Test > ${logdir}fio_randr.log
rm -rf iotest_randr${tdate}
fio_randr=`grep 'IOPS=' ${logdir}fio_randr.log`

echo "FIO 隨機寫入測試中"
#隨機寫
fio -direct=1 -iodepth=128 -rw=randwrite -ioengine=libaio -bs=4k -size=1G -numjobs=1 -runtime=1000 -group_reporting -filename=iotest_randw${tdate} -name=Rand_W_Test > ${logdir}fio_randw.log
rm -rf iotest_randw${tdate}
fio_randw=`grep 'IOPS=' ${logdir}fio_randw.log`


echo "FIO 混合隨機讀寫測試中"
#混合隨機讀寫
fio -direct=1 -iodepth=128 -rw=randrw -rwmixread=70 -ioengine=libaio -bs=4k -size=1G -numjobs=1 -runtime=1000 -group_reporting -filename=iotest_randrw${tdate} -name=Rand_RW_Test > ${logdir}fio_randrw.log
rm -rf iotest_randrw${tdate}
fio_randrw=`grep 'IOPS=' ${logdir}fio_randrw.log`


##循序讀寫先不測試##
##循序寫
#fio -direct=1 -iodepth=128 -rw=write -ioengine=libaio -bs=4k -size=1G -numjobs=1 -runtime=1000 -group_reporting -filename=iotest_w${tdate} -name=Write_Testing > ${logdir}fio_w.log
#rm -rf iotest_w${tdate}
#fio_w=`grep 'IOPS=' ${logdir}fio_w.log`

##循序讀
#fio -direct=1 -iodepth=128 -rw=read -ioengine=libaio -bs=4k -size=1G -numjobs=1 -runtime=1000 -group_reporting -filename=iotest_r${tdate} -name=Read_Testing > ${logdir}fio_r.log
#rm -rf iotest_r${tdate}
#fio_r=`grep 'IOPS=' ${logdir}fio_r.log`

stop_time=`date`
echo '測試結束時間 ' $stop_time >> $logfile
echo '測試目錄    ===> ' $PWD    >> $logfile
echo '隨機讀      ===> ' $fio_randr  >> $logfile
echo '隨機寫      ===> ' $fio_randw  >> $logfile
echo '混合隨機讀寫===> ' $fio_randrw  >> $logfile
#echo '循序寫     ===> ' $fio_w  >> $logfile
#echo '循序讀     ===> ' $fio_r  >> $logfile

cat $logfile
echo ""
echo "以上為IOPS數值，若有需查看詳細測試結果請至/u1/etc/tmon/fio-3.16/log目錄內查看log"
