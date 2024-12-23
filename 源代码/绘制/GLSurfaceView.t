@导入Java("android.opengl.GLSurfaceView")
@导入Java("android.opengl.GLSurfaceView.Renderer")
@导入Java("javax.microedition.khronos.opengles.GL10")
@导入Java("javax.microedition.khronos.egl.EGLConfig")
@导入Java("android.opengl.GLES20")
@导入Java("android.app.Activity")
类 GLSurfaceView : 可视化组件
	
	// GLSurfaceView.RENDERMODE_WHEN_DIRTY
	@静态
	常量 渲染模式_按需渲染 : 整数?
	// GLSurfaceView.RENDERMODE_CONTINUOUSLY
	@静态
	常量 渲染模式_连续渲染 : 整数?
	
	@code
	static {
		#渲染模式_按需渲染 = GLSurfaceView.RENDERMODE_WHEN_DIRTY;
		#渲染模式_连续渲染 = GLSurfaceView.RENDERMODE_CONTINUOUSLY;
	}
	
	public #<GLSurfaceView>(android.content.Context context) {
		super(context);
	}
	
	@Override
	public android.opengl.GLSurfaceView onCreateView(android.content.Context context) {
		android.opengl.GLSurfaceView view = new android.opengl.GLSurfaceView(context);
		return (android.opengl.GLSurfaceView) view;
	}
	
	@Override
	public android.opengl.GLSurfaceView getView() {
		return (android.opengl.GLSurfaceView) view;
	}
	@end
	
	// 检查是否支持 OpenGL ES 2.0
	方法 supportsEs2(act : 安卓窗口) : 逻辑型
		@code
		Activity activity = #act;
		GLSurfaceView glSurfaceView = new GLSurfaceView(activity);
		try {
			glSurfaceView.setEGLContextClientVersion(2);
			return true;
		} catch (Exception e) {
			return false;
		}
		@end
	结束 方法
	
	方法 指定窗口暂停时是否保留上下文(booleanpreserveOnPause : 逻辑型)
		code getView().setPreserveEGLContextOnPause(#booleanpreserveOnPause);
	结束 方法
	
	方法 指定OpenGLES版本(version : 整数)
		code getView().setEGLContextClientVersion(#version);
	结束 方法
	
	方法 queueEvent(r : 时钟)
		code getView().queueEvent(#r);
	结束 方法
	
	方法 重绘()
		code getView().requestRender();
	结束 方法
	
	方法 加载着色器(类型 : 整数,着色器代码 : 文本) : 整数
		变量 着色器 : 整数 = GLES20.创建着色器(类型)
		如果 着色器 == 0 则
			运行时异常("类 : GLSurfaceView\n方法 : 加载着色器\n着色器创建失败。")
		结束 如果
		GLES20.编码着色器(着色器,着色器代码)
		GLES20.编译着色器(着色器)
		如果(GLES20.检查着色器(着色器))
			GLES20.删除着色器(着色器)
			运行时异常("类 : GLSurfaceView\n方法 : 加载着色器\n着色器编译失败: " + GLES20.取着色器日志(着色器));
		结束 如果
		返回 着色器
	结束 方法
	
	属性写 渲染模式(模式 : 整数)
		code getView().setRenderMode(#模式);
	结束 属性
	
	属性读 渲染模式() : 整数
		code return getView().getRenderMode();
	结束 属性
	
	属性读 渲染器() : 渲染器
		code return getView().getRenderer();
	结束 属性
	
	属性写 渲染器(mRenderer : 渲染器)
		code getView().setRenderer(#mRenderer);
	结束 属性
	
	定义事件 运行时异常(error : 文本)
结束 类

/*
类 你的渲染器 : 渲染器
	变量 你的对象 : 对象 = 空
	事件 你的渲染器 : 渲染器创建完毕()
	结束 事件
	事件 你的渲染器 : 渲染器开始绘制(unused : GL10)
	结束 事件
	事件 你的渲染器 : 渲染器大小改变(宽度 : 整数,高度 : 整数)
	结束 事件
结束 类
*/

@导入Java("android.opengl.GLSurfaceView.Renderer")
@导入Java("android.opengl.GLES20")
@导入Java("javax.microedition.khronos.opengles.GL10")
@导入Java("javax.microedition.khronos.egl.EGLConfig")
@后缀代码("implements Renderer")
类 渲染器
	@code
	@Override
	public void onSurfaceCreated(GL10 unused, EGLConfig config) {
		GLES20.glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
		#渲染器创建完毕();
	}
	
	@Override
	public void onDrawFrame(GL10 unused) {
		GLES20.glClear(GLES20.GL_COLOR_BUFFER_BIT);
		#渲染器开始绘制(unused);
	}
		
	@Override
	public void onSurfaceChanged(GL10 unused, int width, int height) {
		GLES20.glViewport(0, 0, width, height);
		#渲染器大小改变(width,height);
	}
	@end
	@虚拟事件
	方法 渲染器创建完毕()
	结束 方法
	@虚拟事件
	方法 渲染器开始绘制(unused : GL10)
	结束 方法
	@虚拟事件
	方法 渲染器大小改变(宽度 : 整数,高度 : 整数)
	结束 方法
结束 类

// 使用GL10将导致无法使用GLES20，故不实现
@指代类("javax.microedition.khronos.opengles.GL10")
类 GL10
结束 类

@指代类("android.opengl.GLES20")
类 GLES20
	
	// GLES20.GL_COLOR_BUFFER_BIT
	@静态
	常量 颜色缓冲区 : 整数?
	// GLES20.GL_DEPTH_BUFFER_BIT
	@静态
	常量 深度缓冲区   : 整数?
	// GLES20.GL_STENCIL_BUFFER_BIT
	@静态
	常量 模板缓冲区 : 整数?
	// GLES20.GL_VERTEX_SHADER
	@静态
	常量 顶点着色器 : 整数?
	// GLES20.GL_FRAGMENT_SHADER
	@静态
	常量 片段着色器 : 整数?
	
	@code
	static {
		#颜色缓冲区 = GLES20.GL_COLOR_BUFFER_BIT;
		#深度缓冲区 = GLES20.GL_DEPTH_BUFFER_BIT;
		#模板缓冲区 = GLES20.GL_STENCIL_BUFFER_BIT;
		#顶点着色器 = GLES20.GL_VERTEX_SHADER;
		#片段着色器 = GLES20.GL_FRAGMENT_SHADER;
	}
	@end
	
	@静态
	方法 取着色器日志(着色器id : 整数) : 文本
		code return glGetShaderInfoLog(#着色器id);
	结束 方法
	
	@静态
	方法 清除缓冲区(mask : 整数)
		code glClear(#mask);
	结束 方法
	
	@静态
	方法 设置清除颜色值(r : 单精度小数,g : 单精度小数,b : 单精度小数,a : 单精度小数)
		code glClearColor(#r,#g,#b,#a);
	结束 方法
	
	@静态
	方法 设置清除深度值(v : 单精度小数)
		code glClearColor(#v);
	结束 方法
	
	@静态
	方法 设置清除模板值(v : 整数)
		code glClearStencil(#v);
	结束 方法
	
	@静态
	方法 创建着色器(类型 : 整数) : 整数
		code return glCreateShader(#类型);
	结束 方法
	
	@静态
	方法 编码着色器(着色器id : 整数,着色器代码 : 文本)
		code return.glShaderSource(#着色器id, #着色器代码);
	结束 方法
	
	@静态
	方法 编译着色器(着色器id : 整数)
		code return glCompileShader(#着色器id);
	结束 方法
	
	@静态
	方法 附加着色器(程序id : 整数,着色器id : 整数)
		code glAttachShader(#程序id,#着色器id);
	结束 方法
	
	@静态
	方法 链接着色器(程序id :整数)
		code glLinkProgram(#程序id);
	结束 方法
	
	@静态
	方法 分离着色器(程序id : 整数,着色器id : 整数)
		code glDetachShader(#程序id,#着色器id);
	结束 方法
	
	@静态
	方法 删除着色器(着色器id : 整数)
		code glDeleteShader(#着色器id);
	结束 方法
	
	@静态
	方法 创建程序() : 整数
		code return glCreateProgram();
	结束 方法
	
	@静态
	方法 删除程序(程序id : 整数)
		@code
		glUseProgram(0);
		glDeleteProgram(#程序id);
		@end
	结束 方法
	
	@静态
	方法 使用程序(程序id : 整数)
		code glUseProgram(#程序id);
	结束 方法
	
	/* GLES20
	参数 : 着色器id
	返回 : 布尔值，表示着色器是否有错误
	*/
	@静态
	方法 检查着色器(着色器id : 整数) : 逻辑型
		@code
		final int[] compileStatus = new int[1];
		GLES20.glGetShaderiv(#着色器id, GLES20.GL_COMPILE_STATUS, compileStatus, 0);
		return (compileStatus[0] == 0)
		@end
	结束 方法
	
	/* GLES20
	参数 : 程序id
	返回 : 布尔值，表示链接是否有错误
	*/
	@静态
	方法 检查链接(程序id : 整数) : 逻辑型
		@code
		int[] linkStatus = new int[1];
		GLES20.glGetProgramiv(#程序id, GLES20.GL_LINK_STATUS, linkStatus, 0);
		return (linkStatus[0] == GLES20.GL_FALSE)
		@end
	结束 方法
结束 类