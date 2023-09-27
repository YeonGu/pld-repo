# RISCV-USER-INTERFACE Project

## Build

为了快速验证与仿真，UI做了前后端解耦。`Makefile`中有两个目标可供Build：

- `make run`调用CMake，在Linux-x86_64下编译链接`core`和`sim`中的内容。
- `make rv`调用Nuclei-Tools，为Risc-V SoC编译.hex文件和一些反汇编文件、.verilog仿真文件。.verilog仿真文件会被放到`RTL-SRCS`中。

## core

core包含所有核心的代码，但是和顶层的接口需要在sim中或者port中实现。例如：

- 输入事件
- 显示接口

每1/60s（帧率不一定），顶层call一次vmem_draw()。（在实际使用中这个可能通过一个中断flag实现。）接着底层通过提供的一系列画线/画像素接口在显存中绘制图形。

在core项目中需要如下的模块：

- 页面元素管理（链表）
- 图形绘制调用
- 用户输入处理

`core`的cycle定义如下：
```
while(1)
{
	等待间隔;						// 定时器中断
	处理输入事件，更新element状态;
	GPIO输出控制信息;
	绘制一帧图形;
}
```
