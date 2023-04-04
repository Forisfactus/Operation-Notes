# Python3 安装

## 安装依赖

```shell
yum install -y gcc gcc-c++ oepnssl opensll-devel zlib*

yum install libffi-devel -y
```

------



## 下载源码包

```shell
wget https://www.python.org/ftp/python/3.9.0/Python-3.9.0.tgz
```

------



## 编译安装

**安装在/usr/local/python3（具体安装位置看个人喜好）**

 （1）创建目录：  mkdir -p /usr/local/python3

 （2）解压：tar -zxvf Python-3.9.0.tgz

 （3）进入文件夹：tar -zxvf Python-3.9.0.tgz

 （4）生成编译脚本：./configure --prefix=/usr/local/python3     #指定了刚刚创建的目录

 （5）编译：make

  （6）编译成功后：make install

  （7）检查python3.7的编译器：/usr/local/python3/bin/python3.9

  （8）建立Python3和pip3的软链:

​				ln -s /usr/local/python3/bin/python3 /usr/bin/python3

​				ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3

  （9）增加环境变量

​				vim /etc/profile

​				PATH=$PATH:$HOME/bin:/usr/local/python3/bin

​				export PATH

  （10）让上一步的修改生效：source ~/.bash_profile

  （11）检查Python3及pip3是否正常可用：python3 -V && pip3 -V

