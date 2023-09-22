# Southeast University PLD Contest Repository

## Introduction

这是东南大学PLD竞赛熬夜不秃头小组的Git仓库。

## Structure

下面一段给出了此代码仓库的整体结构。在整理代码的时候请遵守代码仓库的文件规则。
在Vivado工程中使用代码的时候，请一定**直接使用Add File**，把`rtl-srcs`文件夹里的RTL源文件引用到工程里面，**并且不要勾选copy到工程目录下！**
这是为了整个工程的整洁，请一定要注意。

``` Plain Text
.
├── Documents
│   └── ...             # 此处存放各种文档
├── README.md           # 仓库说明
├── dev-logs
│   └── ...             # 各种开发记录的文档。例如设计接口、规范的说明，或者使用的记录和笔记
├── rtl-srcs
│   ├── e203            # risc-v ebird-e203 RTL代码相关
│   ├── e203-soc        # 用于e203板级整合的文件。例如适配不同开发板的system.v、xdc文件。
│   ├── cv-core         # 图像处理算法相关
│   ├── utils           # 杂项。比如HDMI和图像显示相关。
│   └── system          # 最终系统整合
├── dev-srcs
│   └── ...             # 包括E203相关的SDK、Toolchain、示例以及最终的用户代码。
├── projects            # 这个目录存放各种Vivado项目。注意RTL代码不应该出现在这里。
│   ├── e203-zybo
│   ├── e203-boolean
│   ├── cv-boolean
│   └── sys-boolean

```
