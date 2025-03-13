@指代类("android.graphics.Matrix")
类 矩阵
	@静态
	常量 变换类型_覆盖 : 整数 = 0
	@静态
	常量 变换类型_追加 : 整数 = 1
	@静态
	常量 变换类型_插入 : 整数 = 2
	
	方法 平移(x : 单精度小数,y : 单精度小数,类型 : 整数 = 1)
		假如 类型
			是 变换类型_覆盖
				code #this.setTranslate(#x, #y);
			是 变换类型_追加
				code #this.postTranslate(#x, #y);
			是 变换类型_插入
				code #this.preTranslate(#x, #y);
		结束 假如
	结束 方法
	
	方法 旋转(角度 : 单精度小数,中心点 : rl坐标,类型 : 整数 = 1)
		假如 类型
			是 变换类型_覆盖
				code #this.setRotate(#角度, #<中心点.x>, #<中心点.y>);
			是 变换类型_追加
				code #this.postRotate(#角度, #<中心点.x>, #<中心点.y>);
			是 变换类型_插入
				code #this.preRotate(#角度, #<中心点.x>, #<中心点.y>);
		结束 假如
		
	结束 方法
	
	方法 缩放(x : 单精度小数,y : 单精度小数,中心点 : rl坐标,类型 : 整数 = 1)
		假如 类型
			是 变换类型_覆盖
				code #this.setScale(#x, #y, #<中心点.x>, #<中心点.y>);
			是 变换类型_追加
				code #this.postScale(#x, #y, #<中心点.x>, #<中心点.y>);
			是 变换类型_插入
				code #this.preScale(#x, #y, #<中心点.x>, #<中心点.y>);
		结束 假如
	结束 方法
	
	方法 倾斜(x : 单精度小数,y : 单精度小数,中心点 : rl坐标,类型 : 整数 = 1)
		假如 类型
			是 变换类型_覆盖
				code #this.setSkew(#x, #y, #<中心点.x>, #<中心点.y>);
			是 变换类型_追加
				code #this.postSkew(#x, #y, #<中心点.x>, #<中心点.y>);
			是 变换类型_插入
				code #this.preSkew(#x, #y, #<中心点.x>, #<中心点.y>);
		结束 假如
	结束 方法
	
	方法 连接矩阵(a : 矩阵,b : 矩阵,类型 : 整数 = 1)
		假如 类型
			是 变换类型_覆盖
				code #this.setConcat(#a, #b);
			是 变换类型_追加
				code #this.postConcat(#a, #b);
			是 变换类型_插入
				code #this.preConcat(#a, #b);
		结束 假如
	结束 方法
	
	方法 计算反转矩阵(inverse : 矩阵)
		code #this.invert(#inverse);
	结束 方法
	
	方法 取矩阵所有值(values : 单精度小数[])
		code #this.getValues(#values);
	结束 方法
	
	方法 置矩阵所有值(values : 单精度小数[])
		code #this.setValues(#values);
	结束 方法
	
	方法 是否为单位矩阵() : 逻辑型
		code return #this.isIdentity();
	结束 方法
	
	方法 重置为单位矩阵()
		code #this.reset();
	结束 方法
	
	方法 映射点(dst : 单精度小数[],src : 单精度小数[])
		code #this.mapPoints(float[] dst, float[] src);
	结束 方法
	
	方法 映射向量(dst : 单精度小数[],src : 单精度小数[])
		code #this.mapVectors(float[] dst, float[] src);
	结束 方法
	
	方法 应用于位图(原始位图 : 位图对象) : 位图对象
		code return android.graphics.Bitmap.createBitmap(#原始位图, 0, 0, #原始位图.getWidth(), #原始位图.getHeight(), #this, true);
	结束 方法
	
	方法 应用于位图2(原始位图 : 位图) : 位图
		code return android.graphics.Bitmap.createBitmap(#原始位图, 0, 0, #原始位图.getWidth(), #原始位图.getHeight(), #this, true);
	结束 方法
结束 类

@导入Java("android.graphics.Bitmap")
@指代类("android.graphics.Bitmap")
类 位图
	@静态
	方法 从文件路径创建位图(文件路径:文本):位图
	 code return android.graphics.BitmapFactory.decodeFile(#文件路径);
	结束 方法
	
	@静态
	方法 从字节集创建位图(位图数据:字节[],偏移量:整数=0,数据长度:整数):位图
		code return android.graphics.BitmapFactory.decodeByteArray(#位图数据,#偏移量,#数据长度);
	结束 方法
	
	@静态
	方法 从输入流创建位图(位图数据:输入流):位图
		code return android.graphics.BitmapFactory.decodeStream(#位图数据);
	结束 方法
	
	@静态
	方法 创建缩放位图(源位图:位图,新宽度:整数,新高度:整数,启用双线性过滤:逻辑型):位图
		code return android.graphics.Bitmap.createScaledBitmap(#源位图,#新宽度,#新高度,#启用双线性过滤);
	结束 方法
	
	@静态
	方法 创建位图(源位图:位图):位图
		code return android.graphics.Bitmap.createBitmap(#源位图);
	结束 方法
	
	@静态
	方法 创建位图2(宽度:整数,高度:整数,配置:位图配置):位图
		code return android.graphics.Bitmap.createBitmap(#宽度,#高度,#配置);
	结束 方法
	
	@静态
	方法 创建位图3(宽度:整数,高度:整数,配置:位图配置,存在透明度:逻辑型):位图
		code return android.graphics.Bitmap.createBitmap(#宽度,#高度,#配置,#存在透明度);
	结束 方法
	
	方法 创建位图4(颜色组:整数[],宽度:整数,高度:整数,配置:位图配置):位图
		code return android.graphics.Bitmap.createBitmap(#颜色组,#宽度,#高度,#配置);
	结束 方法
	
	属性读 密度():整数
		code return #this.getDensity();
	结束 属性
	
	属性写 密度(欲设置密度:整数)
		code #this.setDensity(#欲设置密度);
	结束 属性
	
	属性写 宽度(欲设置宽度:整数)
		code #this.setWidth(#欲设置宽度);
	结束 属性
	
	属性读 宽度():整数
		code return #this.getWidth();
	结束 属性
	
	属性写 高度(欲设置高度:整数)
		code #this.setHeight(#欲设置高度);
	结束 属性
	
	属性读 高度():整数
		code return #this.getHeight();
	结束 属性
	
	属性写 配置(位图配置:位图配置)
		code #this.setConfig(#位图配置);
	结束 属性
	
	属性读 配置():位图配置
		code return #this.getConfig();
	结束 属性
	
	方法 重新配置(宽度:整数,高度:整数,配置:位图配置)
		code #this.reconfigure(#宽度,#高度,#配置);
	结束 方法
	
	方法 回收()
		code #this.recycle();
	结束 方法
	
	方法 是否已被回收():逻辑型
		code return #this.isRecycled();
	结束 方法
	
	方法 拷贝(配置:位图配置,是否可以改变:逻辑型):位图
		code return #this.copy(#配置,#是否可以改变);
	结束 方法
	
	方法 压缩输出(压缩格式:位图压缩格式,压缩质量:整数,输出流:输出流):逻辑型
		code return #this.compress(#压缩格式,#压缩质量,#输出流);
	结束 方法
	
	方法 取是否预乘位图():逻辑型
		code return #this.isPremultiplied();
	结束 方法
	
	方法 预乘位图(是否预乘位图:逻辑型)
		code #this.setPremultiplied(#是否预乘位图);
	结束 方法
	
	方法 取缩放高度(目标位图密度:整数):整数
		code return #this.getScaledHeight(#目标位图密度);
	结束 方法
	
	方法 取缩放宽度(目标位图密度:整数):整数
		code return #this.getScaledWidth(#目标位图密度);
	结束 方法
	//返回位图像素中行之间的字节数
	方法 取行字节():整数
		code return #this.getRowBytes();
	结束 方法
	//返回可用于存储此位图像素的最小字节数
	方法 取字节():整数
		code return #this.getByteCount();
	结束 方法
	//返回用于存储此位图像素的分配内存的大小
	方法 取分配字节数():整数
		code return #this.getAllocationByteCount();
	结束 方法
	
	方法 取是否存在透明值():逻辑型
		code return #this.hasAlpha();
	结束 方法
	
	方法 透明值(存在透明值:逻辑型)
		code #this.setHasAlpha(#存在透明值);
	结束 方法
	
	方法 取是否细化纹理():逻辑型
		code return #this.hasMipMap();
	结束 方法
	
	方法 细化纹理(是否细化纹理:逻辑型)
		code  #this.setHasMipMap(#是否细化纹理);
	结束 方法
	
	方法 擦除颜色(颜色:整数)
		code #this.eraseColor(#颜色);
	结束 方法
	
	方法 擦除颜色2(颜色:长整数类)
		code #this.eraseColor(#颜色);
	结束 方法
	//返回指定位置的Color
	方法 取像素(横坐标:整数,纵坐标:整数):整数
		code return #this.getPixel(#横坐标,#纵坐标);
	结束 方法
	
	方法 取透明通道():位图
		code return #this.extractAlpha();
	结束 方法
	
	方法 等同(位图对象:位图):逻辑型
		code return #this.sameAs(#位图对象);
	结束 方法
结束 类

@导入Java("android.graphics.Path")
@指代类("android.graphics.Path")
类 Path
	方法 移动(x : 单精度小数,y : 单精度小数)
		code #this.moveTo(#x, #y);
	结束 方法
	
	方法 直线(x : 单精度小数,y : 单精度小数)
		code #this.lineTo(#x, #y);
	结束 方法
	
	方法 二次贝塞尔曲线(xs : 单精度小数,ys : 单精度小数,xe : 单精度小数,ye : 单精度小数)
		code #this.quadTo(#xs, #ys, #xe, #ye);
	结束 方法
	
	方法 三次贝塞尔曲线(xs : 单精度小数,ys : 单精度小数,xi : 单精度小数,yi : 单精度小数,xe : 单精度小数,ye : 单精度小数)
		code #this.cubicTo(#xs, #ys, #xi, #yi, #xe, #ye);
	结束 方法
	
	方法 矩形(目标矩形 : 矩形,顺时针绘制 : 逻辑型 = 真)
		code #this.addRect(#目标矩形, #顺时针绘制 ? Path.Direction.CW : Path.Direction.CCW);
	结束 方法
	
	方法 圆形(x : 单精度小数, y : 单精度小数,半径 : 单精度小数,顺时针绘制 : 逻辑型 = 真)
		code #this.addCircle(#x, #y, #半径, #顺时针绘制 ? Path.Direction.CW : Path.Direction.CCW)
	结束 方法
	
	方法 闭合()
		code #this.close();
	结束 方法
	
	方法 重置()
		code #this.reset();
	结束 方法
	
	方法 清空()
		code #this.rewind();
	结束 方法
	
	方法 简化()
		code #this.simplify();
	结束 方法
	
	属性读 填充类型() : FillType
		code return #this.getFillType();
	结束 属性
	
	属性写 填充类型(类型 : FillType)
		code #this.setFillType(#类型);
	结束 属性
	
	方法 为空() : 逻辑型
		code #this.isEmpty();
	结束 方法
	
	方法 矩阵变换(value : 矩阵)
		code #this.transform(#value);
	结束 方法
结束 类

@前缀代码("final")
@禁止创建对象
@禁止继承
@指代类("android.graphics.Path.FillType")
类 FillType
	@静态
	常量 绕线规则 : FillType?
	@静态
	常量 奇偶规则 : FillType?
	@静态
	常量 反向绕线规则 : FillType?
	@静态
	常量 反向奇偶规则 : FillType?
	@code
	static {
		#绕线规则 = android.graphics.Path.FillType.WINDING;
		#奇偶规则 = android.graphics.Path.FillType.EVEN_ODD;
		#反向绕线规则 = android.graphics.Path.FillType.INVERSE_WINDING;
		#反向奇偶规则 = android.graphics.Path.FillType.INVERSE_EVEN_ODD;
	}
	@end
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
	方法 创建画笔(画笔 : 画笔) : 画笔
		code return new Paint(#画笔)
	结束 方法
	
	//测量文本，如果测量的宽度超过最大宽度，则提前停止。 返回被测量的字符数，如果测量宽度不为空，则返回测量的实际宽度
	方法 测量字符串(内容 : 文本,从头开始 : 逻辑型,最大宽度 : 单精度小数,测量宽度 : 单精度小数[]) : 整数
		code return #this.breakText(#内容,#从头开始,#最大宽度,#测量宽度);
	结束 方法
	
	方法 获得颜色() : 整数
		code return #this.getColor();
	结束 方法
	
	方法 返回字体行间距() : 整数
		code return #this.getFontMetricsInt(#this.getFontMetricsInt());
	结束 方法
	
	方法 返回行建议间距() : 单精度小数
		code return #this.getFontSpacing();
	结束 方法
	
	方法 返回字体大小() : 整数
		code return #this.getTextSize();
	结束 方法
	
	方法 返回字符串宽度(内容 : 文本,宽度 : 单精度小数[]) : 整数
		code return #this.getTextWidths(#内容,#宽度);
	结束 方法
	
	方法 返回字符串宽度2(内容 : 文本,开始 : 整数,中止 : 文本,宽度 : 单精度小数[]) : 整数
		code return #this.getTextWidths(#内容,#开始,#中止,#宽度);
	结束 方法
	
	方法 返回字符串宽度3(内容 : 文本) : 整数
		code return #this.measureText(#内容);
	结束 方法
	
	方法 返回字符串宽度4(内容 : 文本,开始 : 整数,中止 : 整数):整数
		code return #this.measureText(#内容,#开始,#中止);
	结束 方法
	
	方法 恢复默认()
		code #this.reset();
	结束 方法
	
	方法 设置argb(a : 整数,r : 整数,g : 整数,b : 整数)
		code #this.setARGB(#a,#r,#g,#b);
	结束 方法
	
	方法 设置alpha(a : 整数)
		code #this.setAlpha(#a);
	结束 方法
	
	方法 设置颜色(颜色 : 整数)
		code #this.setColor(#颜色);
	结束 方法
	
	方法 设置文本间距(间距 : 单精度小数)
		code #this.setLetterSpacing(#间距);
	结束 方法
	
	方法 设置画笔宽度(宽度 : 单精度小数)
		code #this.setStrokeWidth(#宽度);
	结束 方法
	
	方法 设置画笔风格(风格 : 文本)
		code #this.setStyle(Paint.Style.valueOf(#风格));
	结束 方法
	
	方法 设置文本大小(大小 : 单精度小数)
	code #this.setTextSize(#大小);
	结束 方法
	
	方法 设置文字水平倾斜度(角度 : 单精度小数)
		code #this.setTextSkewX(#角度);
	结束 方法
结束 类

@导入Java("android.graphics.Canvas")
@指代类("android.graphics.Canvas")
类 画布
	@静态
	方法 创建画布(img : 位图) : 画布
		code return new android.graphics.Canvas(#img);
	结束 方法
	
	方法 置位图(img : 位图)
		code #this.setBitmap(#img);
	结束 方法
	
	方法 填充画布颜色3(A:整数,R:整数,G:整数,B:整数)
		code #this.drawARGB(#A,#R,#G,#B);
	结束 方法
	
	方法 填充画布颜色1(颜色:整数)
		code #this.drawColor(#颜色);
	结束 方法
	
	方法 填充画布颜色2(r:整数,g:整数,b:整数)
		code #this.drawRGB(#r,#g,#b);
	结束 方法
	
	方法 剪辑矩形区域1(矩形:矩形) : 逻辑型
		code return #this.clipRect(#矩形);
	结束 方法
	
	方法 剪辑矩形区域2(左边:单精度小数,顶边:单精度小数,右边:单精度小数,底边:单精度小数) : 逻辑型
		code return #this.clipRect(#左边,#顶边,#右边,#底边);
	结束 方法
	
	方法 剪辑几何形状(几何 : Path) : 逻辑型
		code return #this.clipPath(#几何);
	结束 方法
	
	方法 绘制位图1(位图:位图对象,源矩形:矩形,目标矩形:矩形,笔:画笔)
		code #this.drawBitmap(#位图,#源矩形,#目标矩形,#笔);
	结束 方法
	
	方法 绘制位图2(位图:位图对象,x:单精度小数,y:单精度小数,笔:画笔)
		code #this.drawBitmap(#位图,#x,#y,#笔);
	结束 方法
	
	方法 绘制位图3(位图:位图对象,变换:Path,笔:画笔)
		code #this.drawBitmap(#位图,#变换,#笔);
	结束 方法
	
	方法 绘制位图4(bitmap : 位图,x:单精度小数,y:单精度小数,笔:画笔)
		code #this.drawBitmap(#bitmap,#x,#y,#笔);
	结束 方法
	
	方法 绘制圆(x:单精度小数,y:单精度小数,半径:单精度小数,画笔:画笔)
		code #this.drawCircle(#x,#y,#半径,#画笔);
	结束 方法
	
	方法 绘制几何图形(几何 : Path,画笔 : 画笔)
		code #this.drawPath(#几何, #画笔);
	结束 方法
	
	方法 绘制线条(起始x:单精度小数,起始y:单精度小数,终点x:单精度小数,终点y:单精度小数,画笔:画笔)
		code #this.drawLine(#起始x,#起始y,#终点x,#终点y,#画笔);
	结束 方法
	
	方法 绘制线条2(起始 : rl坐标,终点 : rl坐标,画笔:画笔)
		code #this.drawLine(#<起始.x>,#<起始.y>,#<终点.x>,#<终点.y>,#画笔);
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
		@code
		android.graphics.Paint.FontMetrics fontMetrics = #画笔.getFontMetrics();
		#this.drawText(#内容,#文本开始,#文本结束,#x,#y+((fontMetrics.descent - fontMetrics.ascent) / 2 -fontMetrics.descent+((fontMetrics.bottom - fontMetrics.top)/2)),#画笔);
		@end
	结束 方法
	
	方法 返回画布密度():整数
		code return #this.getDensity();
	结束 方法
	
	//返回当前绘图图层的高度
	方法 返回高度() : 整数
		code return #this.getHeight();
	结束 方法
	
	//返回当前绘图图层的宽度
	方法 返回宽度() : 整数
		code return #this.getWidth();
	结束 方法
	
	方法 是否启用硬件加速() : 逻辑型
		code return #this.isHardwareAccelerated();
	结束 方法
	
	方法 保存画布() : 整数
		code return #this.save();
	结束 方法
	
	方法 恢复画布()
		code #this.restore();
	结束 方法
	
	方法 旋转2(旋转角度 : 单精度小数,旋转x : 单精度小数,旋转y : 单精度小数)
		code #this.rotate(#旋转角度,#旋转x,#旋转y);
	结束 方法
	
	方法 旋转1(旋转角度 : 单精度小数)
		code #this.rotate(#旋转角度);
	结束 方法
	
	/*
	用指定的比例预先缩放当前矩阵。
	以(0,0)为中心点，将画布长宽分别变为原来的sx,sy倍
	*/
	方法 缩放1(sx : 单精度小数,sy : 单精度小数)
		code #this.scale(#sx,#sy);
	结束 方法
	
	//以(px,py)为中心点，将画布长宽分别变为原来的sx/sy倍
	方法 缩放2(sx : 单精度小数,sy : 单精度小数,px : 单精度小数,py : 单精度小数)
		code #this.scale(#sx,#sy,#px,#py);
	结束 方法
	
	方法 设置画布位图密度(密度 : 整数)
		code #this.setDensity(#密度);
	结束 方法
	
	方法 平移(x : 整数,y : 整数)
		code #this.translate(#x,#y);
	结束 方法
结束 类