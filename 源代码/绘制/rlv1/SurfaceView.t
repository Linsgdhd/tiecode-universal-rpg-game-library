


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
类 游戏画布 : 可视化组件
	@code
	Bitmap img;
	Canvas canvas;
	Canvas c;
	SurfaceHolder sur;
	boolean status = false;
	Choreographer choreographer = Choreographer.getInstance();
	public #<游戏画布>(android.content.Context context) {
		super(context);
	}
	//Bitmap.Config.ARGB_8888)
	@Override
	public android.view.SurfaceView onCreateView(android.content.Context context) {
		android.view.SurfaceView view = new GameViewSurface(context);
			sur = view.getHolder();
			sur.addCallback(new SurfaceHolder.Callback(){
				@Override
				public void surfaceChanged (SurfaceHolder holder,int format, int width, int height){
					img.setHeight(height);
					img.setWidth(width);
					#游戏画布大小改变(width/2,height/2);
				}
				private Choreographer.FrameCallback frameCallback = new Choreographer.FrameCallback() {
					@Override
					public void doFrame(long frameTimeNanos) {
						if(status){
							#执行绘制();
							#更新ui();
							Canvas canvas = null;
							try {
								canvas = view.getHolder().lockCanvas();
								if (canvas != null) {
									canvas.drawBitmap(img,0,0,null);
								}
	 	 		 		 } finally {
								if (canvas != null) {
									view.getHolder().unlockCanvasAndPost(canvas);
								}
							}
							// 请求下一帧
	 	 			 	 choreographer.postFrameCallback(this);
						}
					}
				};
				@Override
				public void surfaceCreated (SurfaceHolder holder){
					img=Bitmap.createBitmap(holder.getSurfaceFrame().width(),holder.getSurfaceFrame().height(),Bitmap.Config.ARGB_8888);
					canvas=new Canvas(img);
					canvas.scale(2.0f,2.0f);
					choreographer.postFrameCallback(frameCallback);
					#初始化();
				}
				@Override
				public void surfaceDestroyed (SurfaceHolder holder){
					#游戏画布销毁();
					choreographer.removeFrameCallback(frameCallback);
				}
			}
		);
		return view;
	}
	@Override
	public android.view.SurfaceView getView() {
		return (android.view.SurfaceView) view;
	}
	class GameViewSurface extends SurfaceView {
		private float startX=0.0f;//初始x 
		private float startY=0.0f;//初始Y
		public GameViewSurface(Context context){ 
			super(context);
			this.setFocusable(true);
		}
		@Override
		public boolean onTouchEvent(MotionEvent event)
		{ 
			// TODO Auto-generated method stub 
			switch (event.getAction())
			{
				case MotionEvent.ACTION_DOWN: 
					//手接触屏幕时触发
					#画布单击按下((int)(event.getX()/2),(int)(event.getY()/2));
					startX=event.getX()/2;
					startY=event.getY()/2;
					//doTouchDown(event); 
					break; 
				case MotionEvent.ACTION_MOVE: 
					//手滑动时触发 
					float touchX=event.getX()/2; 
					float touchY=event.getY()/2;
					#画布按下滑动((int)touchX,(int)touchY,(int)Math.abs(touchX-startX),(int)Math.abs(touchY-startX));
					startX=touchX;
					startY=touchY;
					//doTouchMove(event); 
					break; 
				case MotionEvent.ACTION_UP: 
					//手抬起时触发 
					#画布单击抬起((int)(event.getX()/2),(int)(event.getY()/2));
					startX=event.getX()/2;
					startY=event.getY()/2;
					break; 
				default:
					break;
			}
			return true; 
		}
	}
	@end

	变量 容器 : rl组件容器
	变量 可用 : 逻辑型 = 假

	定义事件 游戏画布创建完毕()
	定义事件 游戏画布销毁()
	//画布大小发生变化会调用此事件，注意此事件总是在画布"创建完毕事件"被调用至少一次.
	定义事件 游戏画布大小改变(宽度:整数,高度:整数)
	定义事件 画布单击按下(x:整数,y:整数)
	定义事件 画布单击抬起(x:整数,y:整数)
	定义事件 画布按下滑动(x:整数,y:整数,滑动x距离:整数,滑动y距离:整数)
	定义事件 执行绘制()

	@隐藏
	方法 初始化()
		如果 可用 则
			返回
		结束 如果
		可用 = 真
		容器.根容器 = 真
		容器.父组件 = 容器
		容器.宽度 = 获取画布().返回宽度() / 2
		容器.高度 = 获取画布().返回高度() / 2
		容器.预加载()
		提交到新线程运行()
		循环(真)
			code if(!status) continue;
			容器.数据更新()
		结束 循环
		结束提交到新线程()
		游戏画布创建完毕()
	结束 方法

	@隐藏
	方法 更新ui()
		容器.绘制(获取画布())
	结束 方法

	方法 添加组件(组件 : ui组件)
		容器.添加组件(组件)
	结束 方法

	//通过assets文件名获得位图对象
	//8不可见，0可见，4不可见但仍然占用布局空间
	方法 启用(是否:整数)
		code getView().setVisibility(#是否);
	结束 方法

	方法 激活()
		code status = true;
	结束 方法

	方法 已激活() : 逻辑型
		code return status;
	结束 方法

	方法 暂停()
		code status = false;
	结束 方法

	方法 目标帧率(环境 : 窗口管理器,目标值 : 单精度小数)
	结束 方法

	方法 返回画布矩形():矩形
		@code
		android.graphics.Rect s=sur.getSurfaceFrame();
		//s.inset(-(int)((s.right-s.left)/2),-(int)((s.bottom-s.top)/2));//width
		s.right=s.left+((s.right-s.left)/2);
		s.bottom=s.top+((s.bottom-s.top)/2);
		return s;
		@end
	结束 方法

	方法 获取画布():画布
		code return canvas;
	结束 方法

	方法 刷新游戏画布()
		@code
		c=sur.lockCanvas();
		c.drawBitmap(img,0,0,null);
		sur.unlockCanvasAndPost(c);
		@end
	结束 方法

	方法 屏幕保持常亮(是否:逻辑型)
		code sur.setKeepScreenOn(#是否);
	结束 方法

	方法 设置视图大小(宽:整数,高:整数)
		code sur.setFixedSize(#宽,#高);
	结束 方法

	//默认容器自动调整大小
	方法 允许自动调整大小()
		code sur.setSizeFromLayout();
	结束 方法

	方法 获取assets位图(文件名:文本):位图对象
		@code
		android.graphics.Bitmap i;
		android.content.res.AssetManager am = getView().getResources().getAssets();	 
		try {	 
			java.io.InputStream is = am.open(#文件名);	 
			i = android.graphics.BitmapFactory.decodeStream(is);	 
			is.close();	 
		}	 
		catch (java.io.IOException e) {	 
			e.printStackTrace();	 
			i=null;
		}	 
		return i;
		@end
	结束 方法

	方法 获得assets文件输入流(文件名 : 文本) : 输入流
		@code
		java.io.InputStream is;
		android.content.res.AssetManager am = getView().getResources().getAssets();	 
		try	 
		{	 
			is = am.open(#文件名);	 
			/*
			i = android.graphics.BitmapFactory.decodeStream(is);	 
			is.close();	 
			*/
		}	 
		catch (java.io.IOException e)	 
		{	 
			e.printStackTrace();	 
			is=null;
		}
		return is;
		@end
	结束 方法
结束 类