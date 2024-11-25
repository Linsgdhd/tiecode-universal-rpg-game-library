@导入Java("android.view.SurfaceHolder")
@导入Java("android.view.SurfaceHolder.*")
@导入Java("android.view.MotionEvent")
@导入Java("android.graphics.Canvas")
@导入Java("android.graphics.Bitmap")
@导入Java("android.graphics.Bitmap.Config")
@导入Java("android.view.SurfaceView")
@导入Java("android.content.Context")
@导入Java("android.view.Choreographer")
类 游戏画布 : 可视化组件
	@code
	Bitmap img;
	Canvas canvas;
	Canvas c;
	SurfaceHolder sur;
	boolean status = false;
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
			public void surfaceChanged (SurfaceHolder holder,
				int format, 
				int width, 
				int height){
					img.setHeight(height);
					img.setWidth(width);
					#游戏画布大小改变(width/2,height/2);
			}	
			private Choreographer.FrameCallback frameCallback = new Choreographer.FrameCallback() {
				@Override
				public void doFrame(long frameTimeNanos) {
					if(status){
						#执行绘制();
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
	 	 		 	 Choreographer.getInstance().postFrameCallback(this);
					}
				}
			};
			@Override
			public void surfaceCreated (SurfaceHolder holder){
				img=Bitmap.createBitmap(holder.getSurfaceFrame().width(),holder.getSurfaceFrame().height(),Bitmap.Config.ARGB_8888);
				canvas=new Canvas(img);
				canvas.scale(2.0f,2.0f);
				Choreographer.getInstance().postFrameCallback(frameCallback);
				#游戏画布创建完毕();
			}
			@Override
			public void surfaceDestroyed (SurfaceHolder holder){
				#游戏画布销毁();
				Choreographer.getInstance().removeFrameCallback(frameCallback);
			}
		});
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
	定义事件 游戏画布创建完毕()
	定义事件 游戏画布销毁()
	//画布大小发生变化会调用此事件，注意此事件总是在画布"创建完毕事件"被调用至少一次.
	定义事件 游戏画布大小改变(宽度:整数,高度:整数)
	定义事件 画布单击按下(x:整数,y:整数)
	定义事件 画布单击抬起(x:整数,y:整数)
	定义事件 画布按下滑动(x:整数,y:整数,滑动x距离:整数,滑动y距离:整数)
	定义事件 执行绘制()
	//通过assets文件名获得位图对象
	//8不可见，0可见，4不可见但仍然占用布局空间
	方法 启用(是否:整数)
		code getView().setVisibility(#是否);
	结束 方法
	
	方法 激活()
		code status = true;
	结束 方法
	
	方法 暂停()
		code status = false;
	结束 方法
	
	方法 目标帧率(值 : 单精度小数 = 60.0f)
		@code
		if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.LOLLIPOP) {
	 	 		SurfaceView surfaceView = getView(); // 获取你的SurfaceView或TextureView实例
		 		 surfaceView.setFrameRate(#值); // 设置目标帧率为120Hz
		}
		@end
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
	方法 获得assets文件输入流(文件名:文本):输入流
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
@导入Java("android.graphics.Paint")
@指代类("android.graphics.Paint")
类 画笔
	@静态
	常量 风格_填充:文本="FILL"
	@静态
	常量 风格_填充又空心:文本="FILL_AND_STROKE"
	@静态
	常量 风格_空心:文本="STROKE"
	@静态
	方法 创建画笔(画笔:画笔):画笔
		code return new Paint(#画笔)
	结束 方法
	//测量文本，如果测量的宽度超过最大宽度，则提前停止。 返回被测量的字符数，如果测量宽度不为空，则返回测量的实际宽度
	方法 测量字符串(内容:文本,从头开始:逻辑型,最大宽度:单精度小数,测量宽度:单精度小数[]):整数
		code return #this.breakText(#内容,#从头开始,#最大宽度,#测量宽度);
	结束 方法
	方法 获得颜色():整数
		code return #this.getColor();
	结束 方法
	方法 返回字体行间距():整数
		code return #this.getFontMetricsInt(#this.getFontMetricsInt());
	结束 方法
	方法 返回行建议间距():单精度小数
		code return #this.getFontSpacing();
	结束 方法
	方法 返回字体大小():整数
		code	return #this.getTextSize();
	结束 方法
	方法 返回字符串宽度(内容:文本,宽度:单精度小数[]):整数
		code return #this.getTextWidths(#内容,#宽度);
	结束 方法
	方法 返回字符串宽度2(内容:文本,开始:整数,中止:文本,宽度:单精度小数[]):整数
		code return #this.getTextWidths(#内容,#开始,#中止,#宽度);
	结束 方法
	方法 返回字符串宽度3(内容:文本):整数
		code return #this.measureText(#内容);
	结束 方法
	方法 返回字符串宽度4(内容:文本,开始:整数,中止:整数):整数
		code return #this.measureText(#内容,#开始,#中止);
	结束 方法
	方法 恢复默认()
		code #this.reset();
	结束 方法
	方法 设置argb(a:整数,r:整数,g:整数,b:整数)
		code #this.setARGB(#a,#r,#g,#b);
	结束 方法
	方法 设置alpha(a:整数)
		code #this.setAlpha(#a);
	结束 方法
	方法 设置颜色(颜色:整数)
		code #this.setColor(#颜色);
	结束 方法
	方法 设置文本间距(间距:单精度小数)
		code #this.setLetterSpacing(#间距);
	结束 方法
	方法 设置画笔宽度(宽度:单精度小数)
		code #this.setStrokeWidth(#宽度);
	结束 方法
	方法 设置画笔风格(风格:文本)
		code #this.setStyle(Paint.Style.valueOf(#风格));
	结束 方法
	方法 设置文本大小(大小:单精度小数)
	code #this.setTextSize(#大小);
	结束 方法
	方法 设置文字水平倾斜度(角度:单精度小数)
		code #this.setTextSkewX(#角度);
	结束 方法
结束 类
@导入Java("android.graphics.Canvas")
@指代类("android.graphics.Canvas")
类 画布
	//使用srcover porterduff模式，用指定的ARGB颜色填充整个画布的位图（仅限于当前剪辑）。
	方法 填充画布颜色3(A:整数,R:整数,G:整数,B:整数)
		code #this.drawARGB(#A,#R,#G,#B);
	结束 方法
	方法 填充画布颜色1(颜色:整数)
		code #this.drawColor(#颜色);
	结束 方法
	方法 填充画布颜色2(r:整数,g:整数,b:整数)
		code #this.drawRGB(#r,#g,#b);
	结束 方法
	/*绘制指定的位图，自动缩放/翻译以填充目标矩形。 如果源矩形不为空，则指定要绘制的位图的子集。
	画笔可以为空.源矩形可以为空.
	*/
	方法 剪辑矩形区域1(矩形:矩形):逻辑型
		code return #this.clipRect(#矩形);
	结束 方法
	方法 剪辑矩形区域2(左边:单精度小数,顶边:单精度小数,右边:单精度小数,底边:单精度小数):逻辑型
		code return #this.clipRect(#左边,#顶边,#右边,#底边);
	结束 方法
/*	方法 剪辑几何形状(几何:几何形状):逻辑型
code return #this.clipPath(#几何);
	结束 方法
	*/
	方法 绘制位图1(位图:位图对象,源矩形:矩形,目标矩形:矩形,画笔:画笔)
		code #this.drawBitmap(#位图,#源矩形,#目标矩形,#画笔);
	结束 方法
	/*
	方法 绘制位图3(位图:位图对象,变换:几何变换,画笔:画笔)
		code #this.drawBitmap(#位图,#变换,#画笔);
	结束 方法
	*/
	//画笔可以为空
	方法 绘制位图2(位图:位图对象,x:单精度小数,y:单精度小数,画笔:画笔)
		code #this.drawBitmap(#位图,#x,#y,#画笔);
	结束 方法
	方法 绘制圆(x:单精度小数,y:单精度小数,半径:单精度小数,画笔:画笔)
		code #this.drawCircle(#x,#y,#半径,#画笔);
	结束 方法
	方法 绘制线条(起始x:单精度小数,起始y:单精度小数,终点x:单精度小数,终点y:单精度小数,画笔:画笔)
		code #this.drawLine(#起始x,#起始y,#终点x,#终点y,#画笔);
	结束 方法
	方法 绘制椭圆(左边:单精度小数,顶点:单精度小数,右边:单精度小数,底边:单精度小数,画笔:画笔)
		code #this.drawOval(#左边,#顶点,#右边,#底边,#画笔);
	结束 方法
	方法 绘制点(x:单精度小数,y:单精度小数,画笔:画笔)
		code #this.drawPoint(#x,#y,#画笔);
	结束 方法
	方法 绘制矩形2(左边:单精度小数,顶点:单精度小数,右边:单精度小数,底边:单精度小数,画笔:画笔)
		code #this.drawRect(#左边,#顶点,#右边,#底边,#画笔);
	结束 方法
	方法 绘制矩形1(矩形:矩形,画笔:画笔)
		code #this.drawRect(#矩形,#画笔);
	结束 方法
	方法 绘制圆角矩形(左边:单精度小数,顶点:单精度小数,右边:单精度小数,底边:单精度小数,圆角x:单精度小数,圆角y:单精度小数,画笔:画笔)
		code #this.drawRoundRect(#左边,#顶点,#右边,#底边,#圆角x,#圆角y,#画笔);
	结束 方法
	方法 绘制文本(内容:文本,x:单精度小数,y:单精度小数,画笔:画笔)
		@code 
		android.graphics.Paint.FontMetrics fontMetrics = #画笔.getFontMetrics();
		#this.drawText(#内容,#x,#y+((fontMetrics.descent - fontMetrics.ascent) / 2 -fontMetrics.descent+((fontMetrics.bottom - fontMetrics.top)/2)),#画笔);
		@end
	结束 方法
	方法 绘制文本2(内容:文本,文本开始:整数,文本结束:整数,x:整数,y:整数,画笔:画笔)
	@code	android.graphics.Paint.FontMetrics fontMetrics = #画笔.getFontMetrics();
		#this.drawText(#内容,#文本开始,#文本结束,#x,#y+((fontMetrics.descent - fontMetrics.ascent) / 2 -fontMetrics.descent+((fontMetrics.bottom - fontMetrics.top)/2)),#画笔);
		@end
	结束 方法
	方法 返回画布密度():整数
		code return #this.getDensity();
	结束 方法
	//返回当前绘图图层的高度
	方法 返回高度():整数
		code return #this.getHeight();
	结束 方法
	//返回当前绘图图层的宽度
	方法 返回宽度():整数
		code return #this.getWidth();
	结束 方法
	方法 是否启用硬件加速():逻辑型
		code return #this.isHardwareAccelerated();
	结束 方法
	方法 保存画布():整数
		code return #this.save();
	结束 方法
	方法 恢复画布()
		code	 #this.restore();
	结束 方法
	方法 旋转2(旋转角度:单精度小数,旋转x:单精度小数,旋转y:单精度小数)
		code #this.rotate(#旋转角度,#旋转x,#旋转y);
	结束 方法
	方法 旋转1(旋转角度:单精度小数)
		code #this.rotate(#旋转角度);
	结束 方法
	/*用指定的比例预先缩放当前矩阵。
	以(0,0)为中心点，将画布长宽分别变为原来的sx,sy倍
	*/
	方法 缩放1(sx:单精度小数,sy:单精度小数)
		code #this.scale(#sx,#sy);
	结束 方法
	//以(px,py)为中心点，将画布长宽分别变为原来的sx/sy倍
	方法 缩放2(sx:单精度小数,sy:单精度小数,px:单精度小数,py:单精度小数)
		code #this.scale(#sx,#sy,#px,#py);
	结束 方法
	方法 设置画布位图密度(密度:整数)
		code #this.setDensity(#密度);
	结束 方法
	方法 平移(x:整数,y:整数)
		code #this.translate(#x,#y);
	结束 方法
结束 类