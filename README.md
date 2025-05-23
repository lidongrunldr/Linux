# 📘: Linux 📘:
linux基本操作，读写拷贝，删除，查看cpu，内存，网络等
## 查看电脑ip地址
`win+r`然后`cmd`
然后在终端输入
```
ipconfig
```
## 输出当前工作目录的路径
```
pwd
```
## 查看文件或文件夹路径是否正确
```
ls /mnt/ssd1/account702893/DecisionGroup/pingce/2024_sfc.grib
```
## 查看文件类型或是否损坏
```
file /mnt/ssd1/account702893/DecisionGroup/pingce/2024_sfc.grib
```
## 进出文件夹
* 进入文件夹
```
cd /<文件夹1>/<文件夹2>/<文件名>
```
* 退出文件夹
退出到上一级
```
cd ..
```
* 退出到上两级
```
cd ../..
```
* 切换到用户目录
```
cd ~
```
* 退出到根目录
```
cd /
```
tab可自动填充，连点两下tab可以查看当前可进入的目录且不会终止操作。（仅在打出cd后有用）
## 移动文件夹
```
mv
```
## 文件重命名
```
mv -i <老文件名>.grib <新文件名>.grib2
```
加上`-i`防止重命名错了文件，会有交互
```
yum insatll rename
rename testfile tt testfile*.log
```
可以实现批量将名为`testfile1.log` `testfile2.log` `testfile3.log`批量命名为`tt1.log` `tt2.log` `tt3.log`
```
rename .log .txt *.log
```
可以批量重命名后缀为`.log`的文件为后缀`.txt`
总结：
```
rename (想要替换的部分) (替换成的内容) (想要替换的文件全名)
```
## 删除文件
```
rm /dir1/dir2/test.py
```
* 强制批量删除2024033().grib
```
rm -rf 2024033*.grib
```
* 删除文件夹
```
rm -r <文件夹>/
```
## 文件的读取
* 读取全文
```
cat <文件路径>
```
或
```
less <文件路径>
```
也是读取全文，且可以一行行显示
* 读取文件前十行
```
head <文件路径>
```
* 读取文件后十行
```
tail <文件路径>
```
假如文件路径如下：
```
project-name/
│
├── dir1/
│   ├── file1.ext
│   └── file2.ext
│
├── dir2/
│   ├── sub-dir1/
│   │   └── file3.ext
│   └── sub-dir2/
│
└── dir3/
    ├── file4.ext
    └── file5.ext
```
假如当前的工作路径为project-name，想要读取`file3.ext`文件，则需要
```
cat ./dir2/sub-dir1/file3.ext
```
注意，在读取文件的时候需要打`.`来体现同级目录，而`cd`的时候不用打`.`
* 读取文件前x行
```
head -n x <文件路径>
```
* 读取文件后x行
```
tail -n x <文件路径>
```
* 文件目录查看
```
ll
```
## 文件的拷贝
* 把文件，复制到指定目录（打绝对路径）
```
cp ./<文件夹1>/<文件夹2>/<文件名> ./<文件夹1>/<文件夹2>/<文件夹3>
```
* 把整个文件夹，复制到指定目录
```
cp -r ./<文件夹1>/<文件夹2> ./<文件夹1>/<文件夹2>/<文件夹3>
```
`-r`表示递归
* 查看当前目录中的所有文件夹和文件
```
ll ~
```
`~`表示当前目录
## 跨服务器拷贝(注意如果使用scp，必须打绝对路径，即使已经进入了文件)
* 把本地的source.txt文件拷贝到用户名为root的192.168.0.10机器上的/home/work目录下
```
scp /home/work/source.txt root@192.168.0.10:/home/work/
```
* 把192.168.0.10机器上的source.txt文件拷贝到本地的D:\work目录下
```
scp root@192.168.0.10:/home/work/source.txt D:\work\
```
* 把192.168.0.10机器上的source.txt文件拷贝到192.168.0.11机器的/home/work目录下
```
scp root@192.168.0.10:/home/work/source.txt root@192.168.0.11:/home/work/ 
```
## 文件的创建
* 创建文件
```
touch <文件名>
```
这样会在当前工作目录下创建一个新文件，如果想在具体的某个文件夹中创建可以
```
touch ./<文件夹1>/<文件夹2>/<新文件名>
```
* 创建文件夹
```
mkdir <文件名>
```
这样会在当前工作目录下创建一个新文件夹，如果想在具体的某个文件夹中创建可以
```
mkdir ./<文件夹1>/<文件夹2>/<新文件夹名>
```
## 文件的写入
* 覆写
```
echo "想要写入的内容" > ./<文件夹1>/<文件夹2>/<文件名>
```
* 续写
```
echo "想要写入的内容" >> ./<文件夹1>/<文件夹2>/<文件名>
```
* 文件的复杂编辑，大规模写入和改写
```
nano ./<文件夹1>/<文件夹2>/<文件名>
```
如果linux中没装`nano`，执行
```
yum install nano
```
来安装`nano`
写完后`ctrl+o`保存，回车确认`ctrl+x`退出 <br>
`ctrl+_`后输入行数，可以直接跳转到该行，`ctrl+#`然后再`shift+#`可以在左侧显示行数。<br>
`ctrl+w`查找关键词
`ctrl+v`向下翻页
`ctrl+_`跳转到某一行（注意，在mac中必须使用`shift+_+control`,才行，顺序不能错）
## 终止进程
* 强制终止进程
```
kill -9 <PID>
```
有些时候`kill <PID>`也可以，但实际上就是`crtl+c`如果`ctrl+c`仍然结束不了进程，直接加个`-9`强制结束
* 查询PID
三种方法
1.
```
nvidia-smi
```
用查询显卡信息的方法的最下面一栏有显示进程信息

2.
```
ps aux | grep python 
```
会列出所有包含`python`的进程名及id 进程名可以替换

3.
```
sudo apt-get install hotp
```
安装`hotp`图形化界面
```
hotp
```
启动
## 发送HTTP请求
```
curl
```
## 查看硬件信息
* 查看cpu
```
lscpu
```
* 查看当前服务器cpu的占用和进程
```
top
```
该命令会显示一个列表，其中包含了系统中每个进程的CPU使用率。如果服务器是多核CPU，可能会看到某些进程的CPU占用率超过100%，这通常意味着该进程正在使用多个CPU核心。
```
vmstat 1
```
该命令显示了系统的虚拟内存统计信息，包括进程、内存、交换、IO、系统和CPU信息。通过`vmstat`命令，可以查看到CPU的用户时间、系统时间以及空闲时间等详细信息。上述命令每秒更新一次CPU使用情况，可以通过更改命令中的数字来调整更新频率。
* 查看内存占用
```
free -m
```
* 查看硬盘和分区分布
```
lsblk
```
* 查看主板所有硬件槽信息
```
lspci
```
* 查看服务器磁盘占用
```
df -h
```
* 查看某一进程的磁盘占用
```
pidstat -d -p <PID>
```
* 查看当前目录每个文件的具体磁盘占用
```
du --max-depth=1 -h
```
或
```
du -sh ./*
```
下面这条命令显示的文件更全，小文件也会显示，但是上面那条可以显示总占用。
## 查看网络信息
```
ifconfig
```
用于显示或设置网络设备的配置信息。不带任何参数时，它会显示所有活动的网络接口的信息。例如，使用`ifconfig`可以查看网络接口的IP地址、子网掩码、广播地址和物理（MAC）地址等信息。
## 文件压缩与解压
* xz文件
```
xz -d <文件名>.xz
```
* tar文件
```
tar -xvf <文件名>.tar
```
`-x`从归档文件中提取文件，`-v`显示详细信息，`-f`指定归档文档名
## 更改文件夹访问权限
* 查看访问权限
```
ls -l /home/account702893/.conda/envs/wuwu/bin/python
```
* 为所有用户添加访问权限
```
chmod +x /home/account702893/.conda/envs/wuwu/bin/python
```
* 只为当前用户添加访问权限
```
chmod u+x /home/account702893/.conda/envs/wuwu/bin/python
```
* 以管理员身份更改
```
sudo chmod 644 /home/account702893/.conda/envs/wuwu/bin/python
```
## shell脚本的编写
例子见项目文件
* shebang行
```
#!/bin/bash
```
指定了脚本执行的解释器是bash
* for循环
```
for i in {1..32}
do
    <想要循环的指令>
```
从1-32循环
* 编写完后记得要给shell文件开放执行权限
```
chmod u+x /文件路径/test.sh
```
## 日志保存
* 静默运行
覆盖模式（每次运行清空旧内容）
```
bash inference.sh > info.log 2>&1
```
追加模式（保留历史日志）
```
bash inference.sh >> info.log 2>&1
```
* 实时显示输出并保存副本
覆盖模式
```
bash inference.sh 2>&1 | tee info.log
```
追加模式
```
bash inference.sh 2>&1 | tee -a info.log
```

## screen使用
screen可以远程后台运行代码，本地断网关机都不会影响代码运行，只要连接的服务器所在的物理地址不被断电
* screen安装
```
yum install screen
```
* 新建screen
```
screen -S <屏幕名>
```
* 检查当前工作路径下所有screen
```
screen -ls
```
* 打开指定screen
```
screen -r <ip.名字>
```
* 删除指定的screen
```
screen -X -S <ip.名字> quit
```
* 关掉当前的screen（不影响当前代码的运行）
```
crtl+a+d
```
* 关掉当前的screen（不影响当前代码的运行）
```
crtl+a+d
```
* 有些时候有的屏幕会显示（Attached），即正在前台运行，这个时候用`-r`是打不开的,需要先切换到（Detached），即后台运行才可以打开
```
screen -d <ip.名字>
```
* 由于screen无法滚动，如果想实现页面的滚动，可以如下操作
```
crtl+a,esc
```
退出滚动状态
```
esc
```


