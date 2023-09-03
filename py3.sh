#!/bin/bash


# 确保在运行脚本之前，已经下载了Python 3.9.0的源代码文件，并将其命名为 Python-3.9.0.tgz，并且要有适当的权限来执行这些操作。另外，注意在修改环境变量之前，确认脚本是否运行正常，以免意外更改了系统的环境配置

# 1. 创建目录
mkdir -p /usr/local/python3

# 2. 解压
tar -zxvf Python-3.9.0.tgz

# 3. 进入文件夹
cd Python-3.9.0

# 4. 生成编译脚本
./configure --prefix=/usr/local/python3

# 5. 编译
make

# 6. 安装
make install

# 7. 检查Python3.9的编译器
/usr/local/python3/bin/python3.9 -V

# 8. 建立Python3和pip3的软链
ln -s /usr/local/python3/bin/python3 /usr/bin/python3
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3

# 9. 增加环境变量
echo 'PATH=$PATH:$HOME/bin:/usr/local/python3/bin' >> /etc/profile
source /etc/profile

# 10. 让环境变量修改生效
source ~/.bashrc

# 11. 检查Python3及pip3是否正常可用
python3 -V && pip3 -V

