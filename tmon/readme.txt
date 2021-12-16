
version tmon 

ls_version : 1.0 -s 
2019 部署版本
ls_version : 1.0 -e 

ls_version : 1.1 -s 
2021 版本
新增 監控預警
     chk_aliv   重要連線程序存活 ( T100 , 授權 , 整合 gas )
     chk_sql    SQL ( runtime )
     chk_cron   重要排程狀態 ( erp 備份 )
     chk_err    log 檔異常訊息 ( genero 6088 )
新增 緊急自保 
     chk_psmem程序使用內存超過限制會停止
新增 定位工具
     infor_all  各版本資訊 ( genero , python , java 顯示 )
     infor_all  硬件資訊收集 ( cpu 版本 顯示 )
     chk_lic2   授權 ( U 數 顯示 )
     chk_sql    SQL 執行 ( runtime , top SQL 顯示 )
     chk_cron   重要排程 ( erp 備份 )
     chk_err    log 檔異常訊息 ( webrun , DB alert log , dmesg )
ls_versioo :  1.1 -e 
             
             
             
             
             
             
