@静态
@指代类("android.view.WindowManager")
类 窗口管理器
	@静态
	方法 取窗口管理器(环境 : 安卓环境) : 窗口管理器
		code return (android.view.WindowManager) #环境.getSystemService(android.content.Context.WINDOW_SERVICE);
	结束 方法
结束 类