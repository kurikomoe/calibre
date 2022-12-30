# Calibre 中文文件名修正

## Usage
### Installation

1. 下载 release 的[压缩包](https://github.com/kurikomoe/calibre-utf8-path/releases/tag/v6.10.0)
   1. 压缩包中包含 src, resources, calibre-windows.bat, calibre-linux.bat
   2. 对于 Linux 党，可以直接下载编译好的 binary，见 release
2. 分平台安装说明：
   1. 对于 Linux 党，path 中可以搜索到 calibre，所以放在哪儿都行。
   2. 对于 Windows 党，将压缩包内容解压到 calibre 程序目录，即 src, resources，bat，sh 文件位于 calibre.exe 同级目录），如图：
       <img width="473" alt="image" src="https://user-images.githubusercontent.com/31176859/210058802-3126372a-8175-49cb-897a-ea85fa4a0dd2.png">
       
3. 执行 calibre-{windows.bat|linux.sh}


### Pre-Update
! 风险提示 !

接下来的操作如果出现问题有可能损坏数据库，请务必备份 calibre 所有数据。即执行`导入/导出所有 calibre 数据`。

### Update

对于书库中存在的书籍，请`全选`所有书籍后，右键`批量修改元数据`，切换到第三个 Tab `搜索替换`：
```
搜索模式：字符匹配
搜索范围：title
搜索：12345      # 注，这个可以是任意内容，主要是为了触发一下数据库更新
替换为：12345    # 注，保持和上面一样防止真的替换了什么东西
```
确认`测试文本`和`测试结果`中的内容相同，没有错误替换掉什么东西之后点击`确定`，等待数据库更新（可能比较慢，600本书大概半分钟多叭）

执行完毕后，随便打开一本书所在目录，确认是否更改为非 ascii 英文字符（点选一本书，右侧点击`路径：点击打开`）。

### Rollback

如果想改回原英文书名，用 `原版 calibre `启动之后重新执行`批量修改元数据`操作。但是需要两步操作
#### 执行一次加空格操作
```
搜索模式：正则表达式
搜索范围：title
搜索：^(.)      # regex 意思是选中开头的第一个字符（希望没有空文件名存在）
替换为：[ ]\1    # 注意空格，意思是将上面选中的字符前加一个空格
```
#### 删除上面的空格
```
搜索模式：正则表达式
搜索范围：title
搜索：^[ ]      # regex 意思是选中开头空格
替换为：    # 空，即删除上面选中的空格
```
两步操作后，书库中保存的所有书籍会被恢复成英文名。

### 传书操作

对于已经在电纸书等阅读器上的书籍无法更新为中文，只能重新发送到电纸书存储中，再删除掉之前的英文名的书籍。

### 缺陷和不足

1. 由于为了兼容批量修改已有书籍的名字，因此绕过了 calibre 原有的对于未经变动的元数据进行略过的代码，因此以后所有 metadata 更新都会对所有`被选中`的书籍执行。
2. 采用 utf-8 存储书名，未经 windows 其他编码验证（中文系统的 gbk），可能存在问题。
3. 采用 dev 模式运行，效率下降。
4. 其他可能的未知问题

## 原理说明

通过设置环境变量 `CALIBRE_DEVELOP_FROM` 来使 calibre 调用 src 目录代码。

其余代码的修改见本 repo patch

## 相关 repo

https://github.com/snomiao/calibre-utf8-path

------------------------------------------
> The Original Calibre Repo Readme
# calibre

<img align="left" src="https://raw.githubusercontent.com/kovidgoyal/calibre/master/resources/images/lt.png" height="200" width="200"/>

calibre is an e-book manager. It can view, convert, edit and catalog e-books 
in all of the major e-book formats. It can also talk to e-book reader 
devices. It can go out to the internet and fetch metadata for your books. 
It can download newspapers and convert them into e-books for convenient 
reading. It is cross platform, running on Linux, Windows and macOS.

For more information, see the [calibre About page](https://calibre-ebook.com/about).

[![Build Status](https://github.com/kovidgoyal/calibre/workflows/CI/badge.svg)](https://github.com/kovidgoyal/calibre/actions?query=workflow%3ACI)

## Screenshots  

[Screenshots page](https://calibre-ebook.com/demo)

## Usage

See the [User Manual](https://manual.calibre-ebook.com).

## Development

[Setting up a development environment for calibre](https://manual.calibre-ebook.com/develop.html).

A [tarball of the source code](https://calibre-ebook.com/dist/src) for the 
current calibre release.

## Bugs

Bug reports and feature requests should be made in the calibre bug tracker at [Launchpad](https://bugs.launchpad.net/calibre).
GitHub is only used for code hosting and pull requests.

## Support calibre

calibre is a result of the efforts of many volunteers from all over the world.
If you find it useful, please consider contributing to support its development.
[Donate to support calibre development](https://calibre-ebook.com/donate).

## Building calibre binaries

See [Build instructions](bypy/README.rst) for instructions on how to build the
calibre binaries and installers for all the platforms calibre supports.

## calibre package versions in various repositories

[![Packaging Status](https://repology.org/badge/vertical-allrepos/calibre.svg)](https://repology.org/project/calibre/versions)
