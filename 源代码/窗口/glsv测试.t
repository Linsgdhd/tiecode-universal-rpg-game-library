类 glsv测试 : 窗口
	@布局配置([[根布局=真,宽度=-1,高度=-1]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,宽度=-1,高度=-1]])
	变量 glv : GLSurfaceView
	
	变量 tys : 我的渲染器
	
	变量 sz : 时钟

	事件 glsv测试 : 创建完毕()
		订阅事件()
		如果 glv.supportsEs2(本对象) 则
			glv.指定OpenGLES版本(2)
			glv.渲染器 = tys
		否则
			弹出提示("您的设备不支持android.opengl.GLES20")
			关闭窗口()
		结束 如果
	结束 事件
	
结束 类

类 我的渲染器 : 渲染器
	事件 我的渲染器 : 渲染器创建完毕()
	结束 事件
	事件 我的渲染器 : 渲染器开始绘制(unused : GL10)
	结束 事件
	事件 我的渲染器 : 渲染器大小改变(宽度 : 整数,高度 : 整数)
	结束 事件
结束 类