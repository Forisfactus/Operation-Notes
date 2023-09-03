#!/bin/bash

# 获取当前日期和时间，用于备份文件名
DATE=$(date +%F_%H-%M-%S)

# MySQL数据库连接信息
HOST=6.6.6.6   # MySQL服务器主机名
USER=backup      # MySQL用户名
PASS=6666666     # MySQL密码

# 备份文件存储目录
BACKUP_DIR=/data/db_backup

# 获取数据库列表（排除系统数据库）
DB_LIST=$(mysql -h$HOST -u$USER -p$PASS -s -e "show databases;" 2>/dev/null | egrep -v "Database|information_schema|mysql|performance_schema|sys")

# 遍历数据库列表并备份每个数据库
for DB in $DB_LIST; do
    # 构建备份文件名，包含数据库名和当前日期时间
    BACKUP_NAME=$BACKUP_DIR/${DB}_${DATE}.sql
    
    # 使用mysqldump命令备份数据库到指定文件
    if ! mysqldump -h$HOST -u$USER -p$PASS -B $DB > $BACKUP_NAME 2>/dev/null; then
        echo "$BACKUP_NAME 备份失败!"  # 输出备份失败信息
    fi
done

