# 📘: Linux 📘:
linux基本操作，读写拷贝，删除，查看cpu，内存，网络等
## 查看电脑ip地址
`win+r`然后`cmd`
然后在终端输入
```
ipconfig
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
退出到上两级
```
cd ../..
```
## 文件的读取
* 读取全文
```
cat <文件路径>
```
* 读取文件前十行
```
head <文件路径>
```
* 读取文件后十行
```
tail <文件路径>
```
假如文件路径如下：
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
假如当前的工作路径为project-name，想要读取`file3.ext`文件，则需要
```
cat ./dir2/sub-dir1/file3.ext
```
注意，在读取文件的时候需要打`.`来体现同级目录，而`cd`的时候不用打`.`
