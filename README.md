# HaiTunJia
HTJ测试
1.  Main，这是程序的入口，包括 AppDelegate 和。
2.  Section, 这里放各个相对独立的业务模块相关的代码，比如登陆模块，主页等，其中每个模块又细分为控制器，界面，数据，网络层等。
3.  General，这里放一些通用的、可以在各个业务模块之间复用的代码，网络请求父类，复用的空间，父类Controller等。
4.  Helper，这里放得是一些辅助类，一些帮助类，categary等。
5.  Macro，这个目录主要放一些宏，并且再细分为 ApiUrlMacro(api), SystemMarco(系统配置宏定义), HearderMacro(项目中公用的头文件)等。
6.  Vendor，这个目录是用来放一些第三方库或者其他的支持库的，网络请求库，数据库等。
7.  Resource， 这是资源目录，具体又包括图片，图片细分为2x图和3x图。
