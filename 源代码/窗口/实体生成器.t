类 实体生成器 : 窗口

	@布局配置([[根布局=真,宽度=-1,高度=-1,填充系统界面=假]])
	变量 侧滑布局1 : 侧滑布局
	@布局配置([[父布局=侧滑布局1,背景颜色=-15592942,填充系统界面=真]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,宽度=-1,高度DP=46,ID=10]])
	变量 相对布局2 : 相对布局
	@布局配置([[父布局=相对布局2,@位于布局中间=真,@位于布局左边=假,字体大小=16,粗体=真,字体颜色=-1,@位于布局右边=真,@右外边距DP=20,内容="保存"]])
	变量 文本框_保存 : 文本框
	@布局配置([[父布局=相对布局2,@位于布局中间=真,@位于布局左边=真,字体大小=16,粗体=真,字体颜色=-1,内容="目录",@左外边距DP=20]])
	变量 文本框_目录 : 文本框
	@布局配置([[父布局=相对布局1,@位于某组件之下=10]])
	变量 分页布局1 : 分页布局
	@布局配置([[父布局=相对布局1,@位于某组件之下=10,@位于布局右边=真]])
	变量 相对布局3 : 相对布局
	@布局配置([[父布局=相对布局3,@右外边距DP=20]])
	变量 单选框布局1 : 单选框布局
	@布局配置([[父布局=单选框布局1,内容="code",@右外边距DP=6,选中=真]])
	变量 单选框1 : 单选框
	@布局配置([[父布局=单选框布局1,内容="view"]])
	变量 单选框2 : 单选框

	变量 f : lin文件管理器
	变量 d : 数据管理器
	变量 当前文件路径 : 文本
	变量 代码视图 : 实体代码视图
	变量 默认视图 : 实体默认视图
	变量 实体数据 : 文本
	
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
		
        // 设置输入法不顶起布局
        getWindow().setSoftInputMode(android.view.WindowManager.LayoutParams.SOFT_INPUT_ADJUST_PAN);
		@end
		
		d.初始化()
		f.初始化(本对象,d.取目录路径(路径定义.根路径))
		侧滑布局1.左侧布局 = f
		f.相对布局1.上内边距 = 取状态栏高度(本对象)
		相对布局1.上内边距 = 取状态栏高度(本对象)
		代码视图.绑定数据(本对象)
		默认视图.绑定数据(本对象)
		分页布局1.添加页面(代码视图)
		分页布局1.添加页面(默认视图)
		订阅事件()
	结束 事件
	
	事件 f : 打开文件(路径 : 文本,文件后缀 : 文本)
		文件后缀 = 文件后缀.到小写()
		如果 文件后缀 == 文档后缀.角色文档 则
			当前文件路径 = 路径
			实体数据 = 读入文本文件(路径)
			代码视图.编辑框1.内容 = 实体数据
			侧滑布局1.关闭所有侧滑栏()
		否则
			弹出提示("不支持的文件类型")
		结束 如果
	结束 事件
	
	事件 f : 加载目录(路径 : 文本)
		文本框_目录.内容 = 取文件名(路径)
	结束 事件

	//用户在组件上单击事件
	事件 文本框_保存 : 被单击()

	结束 事件
	
	事件 单选框布局1 : 单选框被选中(被选中的单选框 : 单选框)
		如果 被选中的单选框 == 单选框1 则
			分页布局1.显示页面(0,假)
		否则
			分页布局1.显示页面(1,假)
		结束 如果
	结束 事件

	//用户在组件上单击事件
	事件 文本框_目录:被单击()
		侧滑布局1.打开左侧滑栏()
	结束 事件
	
	事件 f : 单击菜单(所在目录 : 文本)
		变量 dh : 对话框
		变量 ls : zr创建文件对话框
		ls.文本框_路径.内容 = 所在目录
		dh.自定义布局 = ls
		dh.按钮1 = "确定"
		dh.按钮2 = "取消"
		侧滑布局1.关闭所有侧滑栏()
		dh.显示()
		事件 dh : 按钮1被单击()
			变量 文件路径 : 文本 = 所在目录 + "/" + ls.编辑框_文档名称.内容 + ls.取目标文档后缀()
			变量 文档内容 : 文本 = 生成器.空角色(种族标签.人族,真).序列化().到文本(2)
			写出文本文件(文件路径,文档内容)
			f.加载路径()
		结束 事件
	结束 事件
	
	定义事件 数据更新(更新类型 : 逻辑型)
结束 类

类 实体代码视图 : 组件容器

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
	@布局配置([[父布局=相对布局1,@位于某组件之下=1,宽度=-1,高度=-1,@左外边距DP=20,@右外边距DP=20,@位于某组件之上=6]])
	变量 相对布局3 : 相对布局
	@布局配置([[父布局=相对布局3,宽度=-1,字体大小=15,对齐方式=48,背景颜色=16777215,高度DP=500,@位于布局顶部=真]])
	变量 编辑框1 : 编辑框
	@布局配置([[父布局=相对布局3,@位于布局底部=真,ID=6]])
	变量 自适应布局1 : 自适应布局

	变量 容器 : 实体生成器?
	
	事件 实体代码视图 : 创建完毕()
		订阅事件()
	结束 事件
	
	事件 实体代码视图 : 绑定数据(数据 : 对象)
		容器 = 数据
	结束 事件
	
	事件 容器 : 数据更新(更新类型 : 逻辑型)
		如果 取反(更新类型) 则
			编辑框1.内容 = 容器.实体数据
		结束 如果
	结束 事件
	
	事件 编辑框1 : 内容被改变()
		容器.实体数据 = 编辑框1.内容
		开始俘获异常()
		变量 temp : JSON对象 = 编辑框1.内容
		容器.数据更新(真)
		俘获所有异常()
		结束俘获异常()
	结束 事件
结束 类


类 实体默认视图 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-1]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,宽度=-1,高度DP=50,ID=1]])
	变量 相对布局2 : 相对布局
	@布局配置([[父布局=相对布局2,纵向布局=真,@位于布局中间=真,@位于布局左边=真,@左外边距DP=20]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,@左外边距DP=0,字体大小=14,粗体=真,字体颜色=-1,内容="view"]])
	变量 title : 文本框
	@布局配置([[父布局=线性布局1,字体大小=10,粗体=假,字体颜色=1124073471]])
	变量 path : 文本框
	@布局配置([[父布局=相对布局1,@位于某组件之下=1,宽度=-1,高度=-1]])
	变量 相对布局3 : 相对布局

	变量 容器 : 实体生成器?
	
	事件 实体默认视图 : 创建完毕()
		订阅事件()
	结束 事件
	
	事件 实体默认视图 : 绑定数据(数据 : 对象)
		容器 = 数据
	结束 事件
结束 类

类 zr值属性项 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度DP=50]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,@位于布局中间=真,@位于布局左边=真,@左外边距DP=20,纵向布局=真]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,粗体=真,字体大小=15]])
	变量 文本框_属性名称 : 文本框
	@布局配置([[父布局=线性布局1,字体大小=12]])
	变量 文本框_属性id : 文本框
	@布局配置([[父布局=相对布局1,@位于布局中间=真,@位于布局右边=真,@右外边距DP=20]])
	变量 编辑框_数值 : 编辑框

结束 类

类 zr创建文件对话框 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-2]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,宽度=-1,高度DP=50,ID=1]])
	变量 相对布局2 : 相对布局
	@布局配置([[父布局=相对布局2,@位于布局中间=真,@位于布局左边=真,@左外边距DP=20,字体大小=17,粗体=真,内容="创建文档",字体颜色=-1]])
	变量 文本框_标题 : 文本框
	@布局配置([[父布局=相对布局1,ID=2,@位于某组件之下=1,@左外边距DP=20,字体大小=12]])
	变量 文本框_路径 : 文本框
	@布局配置([[父布局=相对布局1,@位于某组件之下=2,@位于布局右边=假,@右外边距DP=0,ID=3,@位于布局中间=真]])
	变量 单选框布局1 : 单选框布局
	@布局配置([[父布局=单选框布局1,内容="角色",选中=真]])
	变量 单选框4 : 单选框
	@布局配置([[父布局=单选框布局1,内容="建筑"]])
	变量 单选框5 : 单选框
	@布局配置([[父布局=单选框布局1,内容="世界"]])
	变量 单选框6 : 单选框
	@布局配置([[父布局=单选框布局1,内容="技能"]])
	变量 单选框7 : 单选框
	@布局配置([[父布局=相对布局1,@位于某组件之下=3,宽度=-1,@左外边距DP=20,@右外边距DP=20,提示文本="请输入文档名称"]])
	变量 编辑框_文档名称 : 编辑框

	变量 反参 : 文本 = 文档后缀.角色文档
	
	事件 zr创建文件对话框 : 创建完毕()
		订阅事件()
	结束 事件
	
	事件 单选框布局1 : 单选框被选中(被选中的单选框 : 单选框)
		如果 被选中的单选框.内容 == "角色" 则
			反参 = 文档后缀.角色文档
		否则 被选中的单选框.内容 == "建筑"
			反参 = 文档后缀.建筑文档
		否则 被选中的单选框.内容 == "世界"
			反参 = 文档后缀.世界文档
		否则 被选中的单选框.内容 == "技能"
			反参 = 文档后缀.技能文档
		结束 如果
	结束 事件
	
	方法 取目标文档后缀() : 文本
		返回 "." + 反参
	结束 方法
结束 类