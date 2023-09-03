#!/bin/bash

# 定义Nginx日志目录和日志文件名
LOG_DIR="/usr/local/nginx/logs"
LOG_FILE="access.log"

# 获取当前日期，格式为YYYYMMDD
CURRENT_DATE=$(date +"%Y%m%d")

# 构建新日志文件名，附带当前日期
NEW_LOG_FILE="${LOG_FILE%.*}_${CURRENT_DATE}.${LOG_FILE##*.}"

# 备份日志目录
BACKUP_DIR="/work/backup/log/nginx"

# 移动并重命名日志文件到备份目录
mv "$LOG_DIR/$LOG_FILE" "$BACKUP_DIR/$NEW_LOG_FILE"

# 向Nginx主进程发送USR1信号，重新打开日志文件
nginx_pid_file="/var/run/nginx.pid"
if [ -f "$nginx_pid_file" ]; then
    nginx_pid=$(cat "$nginx_pid_file")
    if [ -n "$nginx_pid" ]; then
        kill -USR1 "$nginx_pid"
    else
        echo "无法获取Nginx主进程ID。"
        exit 1
    fi
else
    echo "Nginx主进程ID文件不存在。"
    exit 1
fi

# 创建新的空日志文件
touch "$LOG_DIR/$LOG_FILE"

# 输出日志切割信息
echo "已切割日志文件 $LOG_FILE 为 $BACKUP_DIR/$NEW_LOG_FILE"

