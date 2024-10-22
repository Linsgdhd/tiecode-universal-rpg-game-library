类 实体生成器 : 窗口

	@布局配置([[根布局=真,宽度=-1,高度=-1]])
	变量 侧滑布局1 : 侧滑布局
	@布局配置([[父布局=侧滑布局1,背景颜色=-15592942]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,宽度=-1,高度DP=46,ID=10]])
	变量 相对布局2 : 相对布局
	@布局配置([[父布局=相对布局2,@位于布局中间=真,@位于布局左边=假,字体大小=16,粗体=真,字体颜色=-1,@位于布局右边=真,@右外边距DP=20,内容="创建"]])
	变量 文本框_创建 : 文本框
	@布局配置([[父布局=相对布局2,@位于布局中间=真,@位于布局左边=真,字体大小=16,粗体=真,字体颜色=-1,内容="",@左外边距DP=20]])
	变量 文本框_目录 : 文本框
	@布局配置([[父布局=相对布局1,@位于某组件之下=10]])
	变量 分页布局1 : 分页布局

	变量 f : lin文件管理器
	变量 d : 数据管理器
	变量 当前文件路径 : 文本
	变量 编辑器 : 实体编辑视图
	变量 视图编辑器 : 实体视图
	
	事件 实体生成器:创建完毕()
		@code
		getWindow().getDecorView().setSystemUiVisibility(
		android.view.View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN |
		android.view.View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION |
		android.view.View.SYSTEM_UI_FLAG_LAYOUT_STABLE);
		getWindow().setStatusBarColor(android.graphics.Color.TRANSPARENT);
		getWindow().setNavigationBarColor(android.graphics.Color.TRANSPARENT);
		// 清除半透明标志
		getWindow().clearFlags(android.view.WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
		getWindow().clearFlags(android.view.WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION);
		// 添加绘制系统栏背景的标志
		getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
		// 设置布局延伸到系统UI
		int uiVisibility = android.view.View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
		| android.view.View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
		| android.view.View.SYSTEM_UI_FLAG_LAYOUT_STABLE;
		getWindow().getDecorView().setSystemUiVisibility(uiVisibility);
		@end
		d.初始化()
		f.初始化(本对象,d.取目录("根路径"))
		侧滑布局1.左侧布局 = f
		f.相对布局1.上内边距 = 取状态栏高度(本对象)
		相对布局1.上内边距 = 取状态栏高度(本对象)
		分页布局1.添加页面(编辑器)
		分页布局1.添加页面(视图编辑器)
		订阅事件()
	结束 事件
	
	事件 f : 打开文件(路径 : 文本,文件后缀 : 文本)
		文件后缀 = 文件后缀.到小写()
		如果 编辑器.需要保存 则
			变量 ts : 对话框
			ts.按钮1 = "保存"
			ts.按钮2 = "取消"
			ts.标题 = "提示"
			ts.信息 = 编辑器.路径 + "未保存，是否保存该文档?"
			ts.显示()
			事件 ts : 按钮1被单击()
				编辑器.保存()
				编辑器.初始化(路径)
			结束 事件
		否则
			如果(文件后缀 == 文档后缀.角色文档 || 文件后缀 == 文档后缀.实体文档 || 文件后缀 == 文档后缀.txt)
				编辑器.初始化(路径)
			否则
				弹出提示("无法识别此文档")
			结束 如果
		结束 如果
	结束 事件
	
	事件 f : 加载目录(路径 : 文本)
		文本框_目录.内容 = 取文件名(路径)
	结束 事件

	//用户在组件上单击事件
	事件 文本框_创建 : 被单击()
		/*
		变量 cd : 菜单
		cd.添加菜单项("角色")
		cd.添加菜单项("地图")
		*/
		变量 dh : 对话框
		变量 xm : 文本[] = {"角色","技能","建筑","地图"}
		dh.标题 = "选择文档类型"
		dh.置单选列表项(xm,0)
		dh.显示()
		事件 dh : 项目被单击(索引 : 整数)
			如果 索引 < 取数组长度(xm) 则
				变量 dhw : 输入对话框
				dhw.标题 = "创建" + xm[索引]
				dhw.提示文本 = "请输入文档名称"
				dhw.按钮1 = "确定"
				dhw.显示()
				事件 dhw : 按钮1被单击()
					写出文本文件(f.当前路径 + "/" + dhw.内容 + "." + 文档后缀.实体文档,生成器.空角色(0,真).序列化().到文本())
					dh.关闭()
					dhw.关闭()
				结束 事件
			结束 如果
		结束 事件
	结束 事件

	//用户在组件上单击事件
	事件 文本框_目录:被单击()
		编辑器.保存()
		弹出提示("保存完成")
	结束 事件
结束 类

类 实体编辑视图 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-1]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,宽度=-1,高度DP=40,ID=1]])
	变量 相对布局2 : 相对布局
	@布局配置([[父布局=相对布局2,纵向布局=真,@位于布局中间=真,@位于布局左边=真,@左外边距DP=20]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,@左外边距DP=0,字体大小=14,粗体=真,字体颜色=-1,内容="code"]])
	变量 title : 文本框
	@布局配置([[父布局=线性布局1,字体大小=10,粗体=假,字体颜色=1124073471]])
	变量 path : 文本框
	@布局配置([[父布局=相对布局1,@位于某组件之下=1,宽度=-1,高度=-1,@左外边距DP=20,@右外边距DP=20]])
	变量 相对布局3 : 相对布局
	@布局配置([[父布局=相对布局3,宽度=-1,高度=-1,字体大小=15,对齐方式=48]])
	变量 编辑框1 : 编辑框

	变量 路径 : 文本
	变量 需要保存 : 逻辑型 = 假
	变量 内容缓存 : 文本
	
	方法 初始化(路径 : 文本)
		本对象.路径 = 路径
		path.内容 = 路径
		变量 jsono : JSON对象 = 读入文本文件(路径)
		编辑框1.内容 = jsono.到文本(2)
		订阅事件()
	结束 方法
	
	事件 编辑框1 : 内容被改变()
		如果 内容缓存 == 编辑框1.内容 则
			需要保存 = 假
		否则
			需要保存 = 真
		结束 如果
	结束 事件
	
	方法 保存()
		写出文本文件(路径,编辑框1.内容)
		内容缓存 = 编辑框1.内容
		需要保存 = 假
	结束 方法
结束 类


类 实体视图 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-1]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,宽度=-1,高度DP=50,ID=1]])
	变量 相对布局2 : 相对布局
	@布局配置([[父布局=相对布局2,纵向布局=真,@位于布局中间=真,@位于布局左边=真,@左外边距DP=20]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,@左外边距DP=0,字体大小=16,粗体=真,字体颜色=-1,内容="view"]])
	变量 title : 文本框
	@布局配置([[父布局=线性布局1,字体大小=10,粗体=假,字体颜色=1124073471]])
	变量 path : 文本框
	@布局配置([[父布局=相对布局1,@位于某组件之下=1,宽度=-1,高度=-1]])
	变量 相对布局3 : 相对布局

	变量 路径 : 文本
	
	方法 初始化(路径 : 文本)
		本对象.路径 = 路径
		path.内容 = 路径
	结束 方法

结束 类