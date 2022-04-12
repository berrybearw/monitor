# monitor
tmon
* 簡介 : 檢查 Linux 環境系統資源用量 ， 技術為 shell
## 主要 :
目錄 : tmon/script
## AP ( Linux )
檢查          | 程序           |
------------- |:-------------:|
CPU           | chk_cpu       |
Mem           | chk_mem       |
Disk          | chk_du        |
Process       | chk_ps        |
IO            | chk_io        |
## DB ( Oracle )
檢查                 | 程序           |
---------------------|:-------------:|
alive                | chk_cpu       |
tablespace           | chk_mem       |
sql active           | chk_du        |
lock                 | chk_ps        |
redo                 | chk_io        |

## 項目簡介 : 
* 每個項目都會提供 html 給用戶閱覽
```
Linux 使用到技術
製作 : echo , pipe
Html  使用到技術
格式 : table
```
* CPU 檢查 : 閒置率 idle % , 負載 load average ， 符合條件值顯示 CPU 用量前幾名程序
```
Linux 使用到技術
idle              : sar ( 替代方案 mpstat ) , awk
load average      : cat , /proc/loadavg , awk
CPU 用量前幾名程序 : ps , sed , awk
```
## 展示
> ![image](https://user-images.githubusercontent.com/96226780/162616698-0c03a238-2a15-4081-a01e-babe399e7291.png)

* Mem 檢查 : available , swap ， 符合條件值顯示 Mem 用量前幾名程序
```
Linux 使用到技術
available         : free , awk
swap              : free , awk
Mem 用量前幾名程序 : ps , sed , awk
```
## 展示
> ![image](https://user-images.githubusercontent.com/96226780/162616711-5977f1ae-1426-44c7-91a6-34887060ca93.png)
* Disk 檢查 : use , free , available ， 符合條件值顯示占用空間大小前幾名檔案
```
Linux 使用到技術
use                : df -l , awk
inode              : df -i , awk
Disk 用量前幾名檔案 : du , sed
```
* Process 檢查 : 長時間程序 
```
Linux 使用到技術 : ps , awk
```
* IO 檢查 : io 用量
```
Linux 使用到技術 : iowait
```
* DB alive 檢查 : DB listener
```
DB 使用到技術
login 檢查 error
```
* DB tablespace 檢查 : 表空間用量 , 檢查超過一天物件 , 檢查物件大小前 10 名 
```
DB 使用到技術
```
* DB SQL active 檢查 : 找到 SQL 執行時間有超出條件
```
DB 使用到技術
```
* DB lock 檢查 : 
```
DB 使用到技術
```
* DB redo 檢查
```
DB 使用到技術
```
