类 rl图形v2
	
结束 类



类 rl图形
	变量 原点 : rl坐标
	变量 容器 : 集合
	变量 Xmax : 单精度小数 = 0.0f
	变量 Ymax : 单精度小数 = 0.0f
	变量 Xmin : 单精度小数 = 0.0f
	变量 Ymin : 单精度小数 = 0.0f

	方法 定义(dt : 坐标容器)
		循环(i, 0, dt.长度())
			变量 temp : rl点
			temp.初始化(本对象)
			temp.x = dt.取坐标(i).x
			temp.y = dt.取坐标(i).y
			容器.添加成员(temp)
		结束 循环
		更新图形宽高()
	结束 方法
	
	方法 取中心点() : rl坐标
		变量 temp : rl坐标
		temp.set((Xmax + 数学.abs_float(Xmin)) / 2,(Ymax + 数学.abs_float(Ymin)) / 2)
		返回 temp
	结束 方法

	方法 更新图形宽高()
		循环(i, 0, 点数量())
			变量 t : rl坐标 = 取点坐标(i)
			如果 Xmax < t.x 则
				Xmax = t.x
			结束 如果
			如果 Xmin > t.x 则
				Xmin = t.x
			结束 如果
			如果 Ymax < t.y 则
				Ymax = t.y
			结束 如果
			如果 Ymin > t.y 则
				Ymin = t.y
			结束 如果
		结束 循环
	结束 方法
	
	方法 中心点修正()
		变量 temp : rl坐标
		temp.set(原点.x,原点.y)
	结束 方法

	方法 取点坐标(索引 : 整数) : rl坐标
		如果 索引 >= 点数量() 则
			变量 temp : rl点 = 容器.取成员(0)
			返回 temp.取坐标() + 原点
		否则
			变量 temp : rl点 = 容器.取成员(索引)
			返回 temp.取坐标() + 原点
		结束 如果
	结束 方法

	方法 旋转(角度 : 单精度小数)
		循环(i, 0, 点数量())
			变量 temp : rl点 = 容器.取成员(i)
			变量 kong : rl坐标
			temp.置坐标(数学.旋转(temp.取坐标(),kong,角度))
		结束 循环
	结束 方法

	方法 缩放(倍率 : 单精度小数)
	结束 方法

	方法 新增点(目标 : rl坐标)
		变量 temp : rl点
		temp.初始化(本对象)
		temp.x = 目标.x
		temp.y = 目标.y
		容器.添加成员(temp)
	结束 方法

	方法 设置点(索引 : 整数,value : rl坐标)
	结束 方法

	方法 点数量() : 整数
		返回 容器.长度
	结束 方法

	方法 是否重叠(目标 : rl图形) : 逻辑型
		返回 假
	结束 方法

	方法 绘制图形(canvas : 画布, 组件画笔 : 画笔)
		如果 点数量() <= 1 则
			返回
		结束 如果
		循环(e, 0, 点数量())
			canvas.绘制线条2(取点坐标(e),取点坐标(e + 1),组件画笔)
		结束 循环	
	结束 方法
	
	方法 裁切()
		
	结束 方法
结束 类

类 rl点
	@隐藏
	变量 位置 : rl坐标
	@隐藏
	变量 图形 : rl图形?
	方法 初始化(原始图形 : rl图形)
		图形 = 原始图形
		订阅事件()
	结束 方法
	方法 取坐标() : rl坐标
		返回 位置
	结束 方法
	方法 置坐标(目标 : rl坐标)
		位置 = 目标
	结束 方法
	属性读 x() : 单精度小数
		返回 位置.x
	结束 属性
	属性写 x(nx : 单精度小数)
		位置.x = nx
	结束 属性
	属性读 y() : 单精度小数
		返回 位置.y
	结束 属性
	属性写 y(ny : 单精度小数)
		位置.y = ny
	结束 属性
结束 类

@指代类("android.graphics.Matrix")
类 矩阵
	方法 旋转(角度 : 单精度小数,中心点 : rl坐标)
		code #this.postRotate(#角度, #<中心点.x>, #<中心点.y>);
	结束 方法
	方法 缩放(x : 单精度小数,y : 单精度小数,中心点 : rl坐标)
		code #this.postScale(#x, #y, #<中心点.x>, #<中心点.y>);
	结束 方法
	方法 倾斜(x : 单精度小数,y : 单精度小数,中心点 : rl坐标)
		code #this.postSkew(#x, #y, #<中心点.x>, #<中心点.y>);
	结束 方法
	方法 应用于位图(原始位图 : 位图对象) : 位图对象
		code return android.graphics.Bitmap.createBitmap(#原始位图, 0, 0, #原始位图.getWidth(), #原始位图.getHeight(), this, true);
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
	方法 圆形(x : 单精度小数, y : 单精度小数 , 半径 : 单精度小数,顺时针绘制 : 逻辑型 = 真)
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
		code setFillType(#类型);
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

@指代类("java.awt.image.BufferedImage")
类 缓冲图像
	@静态
	方法 创建缓冲图像(路径 : 文本) : 缓冲图像
		@code
		java.io.File inputFile = new java.io.File(#路径);
		return javax.imageio.ImageIO.read(imputFile);
		@end
	结束 方法
结束 类

@指代类("java.awt.Graphics2D")
类 二维图形环境
	方法 绘制形状()
	结束 方法
	方法 填充形状()
	结束 方法
结束 类



/*

在中文环境中，`android.graphics.Path.FillType` 枚举定义的四种填充类型可以翻译为如下：

1. **Path.FillType.WINDING** - **绕线规则**（或**非零环绕规则**）：
   - 该规则根据路径的方向和交点的累计值来决定是否填充。如果累计值不是0，则填充；如果是0，则不填充。

2. **Path.FillType.EVEN_ODD** - **奇偶规则**（或**交替规则**）：
   - 根据从一个点到无限远的射线与路径相交次数的奇偶性来决定是否填充。如果交点数是奇数，则填充；如果是偶数，则不填充。

3. **Path.FillType.INVERSE_WINDING** - **反向绕线规则**（或**反向非零环绕规则**）：
   - 这是绕线规则的反转版本，原本应该填充的区域不填充，而原本不应该填充的区域则进行填充。

4. **Path.FillType.INVERSE_EVEN_ODD** - **反向奇偶规则**（或**反向交替规则**）：
   - 这是奇偶规则的反转版本，原本应该填充的区域不填充，而原本不应该填充的区域则进行填充。

这些术语在中国的图形编程社区中被广泛使用，特别是在涉及到 Android 或其他支持 `Path` 类及其填充规则的平台时。选择合适的中文术语取决于具体的上下文和个人偏好，但上述提供的翻译是比较常见的说法。


import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;


import android.graphics.Path;

// 定义一个多边形路径
Path polygonPath = new Path();
polygonPath.moveTo(50, 50);
polygonPath.lineTo(150, 50);
polygonPath.lineTo(200, 100);
polygonPath.lineTo(150, 150);
polygonPath.lineTo(50, 150);
polygonPath.close(); // 闭合路径
public class BitmapCropper {

    public static BufferedImage cropImage(BufferedImage source, int x, int y, int width, int height) {
        // 创建一个新的BufferedImage对象，用于保存裁切后的图像
        BufferedImage croppedImage = source.getSubimage(x, y, width, height);
        return croppedImage;
    }

    public static void main(String[] args) {
        try {
            // 读取原始图像
            File inputFile = new File("path/to/your/image.png");
            BufferedImage originalImage = ImageIO.read(inputFile);

            // 定义裁切区域的坐标和尺寸
            int x = 50; // 裁切区域的起始x坐标
            int y = 50; // 裁切区域的起始y坐标
            int width = 200; // 裁切区域的宽度
            int height = 200; // 裁切区域的高度

            // 裁切图像
            BufferedImage croppedImage = cropImage(originalImage, x, y, width, height);

            // 保存裁切后的图像到文件
            File outputFile = new File("path/to/save/cropped-image.png");
            ImageIO.write(croppedImage, "png", outputFile);

            System.out.println("图像裁切完成并已保存。");

        } catch (IOException e) {
            System.out.println("发生错误: " + e.getMessage());
        }
    }
}

import javax.swing.*;
import java.awt.*;
import java.awt.geom.Ellipse2D;
import java.awt.geom.GeneralPath;
import java.awt.geom.Line2D;
import java.awt.geom.Rectangle2D;

public class DrawingExample extends JPanel {

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        
        // 将 Graphics 转换为 Graphics2D 以访问高级绘图功能
        Graphics2D g2d = (Graphics2D) g;

        // 设置抗锯齿以提高绘图质量
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

        // 设置绘制颜色
        g2d.setColor(Color.BLUE);

        // 绘制矩形
        Rectangle2D rect = new Rectangle2D.Double(50, 50, 100, 100);
        g2d.draw(rect); // 绘制矩形轮廓
        g2d.fill(rect); // 填充矩形

        // 设置绘制颜色
        g2d.setColor(Color.RED);

        // 绘制椭圆
        Ellipse2D ellipse = new Ellipse2D.Double(200, 50, 100, 50);
        g2d.draw(ellipse); // 绘制椭圆轮廓
        g2d.fill(ellipse); // 填充椭圆

        // 设置绘制颜色
        g2d.setColor(Color.GREEN);

        // 绘制直线
        Line2D line = new Line2D.Double(50, 200, 300, 200);
        g2d.draw(line);

        // 设置绘制颜色
        g2d.setColor(Color.MAGENTA);

        // 绘制多边形（不规则形状）
        GeneralPath polygon = new GeneralPath();
        polygon.moveTo(100, 250);
        polygon.lineTo(150, 300);
        polygon.lineTo(200, 250);
        polygon.lineTo(175, 200);
        polygon.closePath();
        g2d.draw(polygon); // 绘制多边形轮廓
        g2d.fill(polygon); // 填充多边形

        // 设置绘制颜色
        g2d.setColor(Color.BLACK);

        // 绘制文本
        g2d.drawString("Hello, Graphics2D!", 50, 350);

        // 清理资源
        g2d.dispose(); // 不是必须的，因为 g2d 是从参数 g 派生出来的
    }

    public static void main(String[] args) {
        // 创建 JFrame 窗口
        JFrame frame = new JFrame("Graphics2D Drawing Example");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 400);
        frame.add(new DrawingExample());
        frame.setVisible(true);
    }
}


import android.graphics.Bitmap;
import android.graphics.Matrix;

public Bitmap rotateBitmap(Bitmap source, float angle) {
    // 创建一个 Matrix 对象
    Matrix matrix = new Matrix();
    
    // 定义旋转中心点（通常是图像的中心）
    int centerX = source.getWidth() / 2;
    int centerY = source.getHeight() / 2;
    
    // 设置旋转角度和中心点
    matrix.postRotate(angle, centerX, centerY);
    
    // 创建并返回旋转后的 Bitmap
    return Bitmap.createBitmap(source, 0, 0, source.getWidth(), source.getHeight(), matrix, true);
}

android.graphics.Matrix


import android.graphics.Bitmap;
import android.graphics.Matrix;

public Bitmap transformBitmap(Bitmap source, float rotation, float scaleX, float scaleY, float skewX, float skewY) {
    // 创建一个新的 Matrix 对象
    Matrix matrix = new Matrix();

    // 定义旋转中心点（通常是图像的中心）
    int centerX = source.getWidth() / 2;
    int centerY = source.getHeight() / 2;

    // 设置旋转
    matrix.postRotate(rotation, centerX, centerY);

    // 设置缩放
    matrix.postScale(scaleX, scaleY, centerX, centerY);

    // 设置倾斜
    matrix.postSkew(skewX, skewY, centerX, centerY);

    // 创建并返回变换后的 Bitmap
    return Bitmap.createBitmap(source, 0, 0, source.getWidth(), source.getHeight(), matrix, true);
}

*/