@导入Java("android.view.SurfaceHolder")
@导入Java("android.view.SurfaceHolder.*")
@导入Java("android.view.MotionEvent")
@导入Java("android.graphics.Canvas")
@导入Java("android.graphics.Bitmap")
@导入Java("android.graphics.Bitmap.Config")
@导入Java("android.view.SurfaceView")
@导入Java("android.content.Context")
@导入Java("android.view.Choreographer")
@导入Java("android.view.Display")
类 rlv2游戏视图 : 可视化组件
	变量 rlv位图 : 位图?
	变量 rlv画布 : 画布?
	变量 游戏绘制 : 线程
	变量 rt游戏画面 : 位图?
	变量 rt游戏画布 : 画布?
	变量 界面绘制 : 线程
	变量 rt界面画面 : 位图?
	变量 rt界面画布 : 画布?
	变量 帧间隔 : 长整数 = 15
	变量 填充色 : 整数 = 0xff707070
	@前缀代码("volatile")
	变量 游戏状态 : 逻辑型
	@前缀代码("volatile")
	变量 界面状态 : 逻辑型
	@前缀代码("volatile")
	变量 游戏画面绘制完成 : 逻辑型
	@code
	SurfaceHolder surfaceholder;
	
	public #<rlv2游戏视图>(android.content.Context context) {
		super(context);
	}

	@Override
	public android.view.SurfaceView onCreateView(android.content.Context context) {
		android.view.SurfaceView view = new GameSurfaceView(context);
		surfaceholder = view.getHolder();
		surfaceholder.addCallback(new SurfaceHolder.Callback(){
			@Override
			public void surfaceChanged (SurfaceHolder holder,int format, int width, int height){
				#rlv位图.setHeight(height);
				#rlv位图.setWidth(width);
				#rt游戏画面.setHeight(height);
				#rt游戏画面.setWidth(width);
				#rt界面画面.setHeight(height);
				#rt界面画面.setWidth(width);
			}
			@Override
			public void surfaceCreated (SurfaceHolder holder){
				#rlv位图 = Bitmap.createBitmap(holder.getSurfaceFrame().width(),holder.getSurfaceFrame().height(),Bitmap.Config.ARGB_8888);
				#rlv画布 = new Canvas(#rlv位图);
				#初始化();
			}
			@Override
			public void surfaceDestroyed (SurfaceHolder holder){
			
			}
		});
		return view;
	}
	
	@Override
	public android.view.SurfaceView getView() {
		return (android.view.SurfaceView) view;
	}
	
	class GameSurfaceView extends SurfaceView {
		private float startX = 0.0f;//初始x 
		private float startY = 0.0f;//初始Y
		
		public GameSurfaceView(Context context){ 
			super(context);
			this.setFocusable(true);
		}
		
		@Override
		public boolean onTouchEvent(MotionEvent event) { 
			return #触摸(event);
		}
	}
	@end

	@隐藏
	方法 初始化()
		rt游戏画面 = 位图.创建位图3(rlv位图.宽度,rlv位图.高度,位图配置.ARGB_8888,真)
		rt游戏画布 = 画布.创建画布(rt游戏画面)
		rt界面画面 = 位图.创建位图3(rlv位图.宽度,rlv位图.高度,位图配置.ARGB_8888,真)
		rt界面画布 = 画布.创建画布(rt游戏画面)
		游戏绘制.优先级 = 9
		界面绘制.优先级 = 9
		游戏状态 = 真
		界面状态 = 真
		订阅事件()
		游戏绘制.启动()
		界面绘制.启动()
	结束 方法

	事件 游戏绘制 : 被启动()
		循环(游戏状态)
			rt游戏画布.填充画布颜色1(填充色)
			开始绘制(rt游戏画布)
			游戏画面绘制完成 = 真
			延时(帧间隔)
		结束 循环
	结束 事件

	事件 界面绘制 : 被启动()
		循环(界面状态)
			rt界面画面 = 位图.创建位图2(rt界面画面.宽度,rt界面画面.高度,位图配置.ARGB_8888)
			rt界面画布.置位图(rt界面画面)
			变量 ui画笔 : 画笔
			ui画笔.设置argb(255,取随机数(0,255),取随机数(0,255),取随机数(0,255))
			ui画笔.设置画笔宽度(4)
			rt界面画布.绘制线条(取随机数(0,200),取随机数(0,200),取随机数(0,200),取随机数(0,200),ui画笔)
			如果 游戏画面绘制完成 则
				游戏画面绘制完成 = 假
				绘制完毕()
			结束 如果
		结束 循环
	结束 事件

	@隐藏
	方法 绘制完毕()
		变量 canvas : 画布 = 锁定画布()
		如果 canvas == 空 则
			返回
		否则
			canvas.绘制位图4(rt游戏画面,0,0,空)
			canvas.绘制位图4(rt界面画面,0,0,空)
			提交修改(canvas)
		结束 如果
	结束 方法

	方法 置帧率(目标帧率 : 整数)
		帧间隔 = 1000 / 目标帧率
	结束 方法
	
	方法 置背景填充色(颜色 : 整数)
		填充色 = 颜色
	结束 方法

	@隐藏
	方法 触摸(event : 触摸事件) : 逻辑型
		返回 真
	结束 方法

	方法 取游戏画面() : 位图
		返回 位图.创建位图(rt游戏画面)
	结束 方法

	方法 取ui画面() : 位图
		返回 位图.创建位图(rt界面画面)
	结束 方法

	方法 锁定画布() : 画布
		code return surfaceholder.lockCanvas();
	结束 方法

	方法 提交修改(canvas : 画布)
		code surfaceholder.unlockCanvasAndPost(#canvas);
	结束 方法

	方法 设置尺寸(宽度 : 整数,高度 : 整数)
		code surfaceholder.setFixedSize(#宽度, #高度);
	结束 方法

	方法 设置像素格式(格式 : 整数)
		code surfaceholder.setFormat(#格式);
	结束 方法

	方法 获取像素格式() : 整数
		code return surfaceholder.getFormat();
	结束 方法

	方法 设置画面尺寸(宽度 : 整数,高度 : 整数)
		code surfaceholder.setFixedSize(#宽度,#高度);
	结束 方法

	方法 屏幕保持常亮(是否 : 逻辑型)
		code surfaceholder.setKeepScreenOn(#是否);
	结束 方法

	方法 允许自动调整大小()
		code surfaceholder.setSizeFromLayout();
	结束 方法

	定义事件 开始绘制(canvas : 画布)
结束 类