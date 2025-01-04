@静态
类 数学
	@静态
	方法 min_float(v1 : 单精度小数,v2 : 单精度小数) : 单精度小数
		如果 v1 > v2 则
			返回 v2
		否则
			返回 v1
		结束 如果
	结束 方法
	
	@静态
	方法 abs_float(v : 单精度小数) : 单精度小数
		如果 v < 0 则
			返回 0 - v
		否则
			返回 v - 0
		结束 如果
	结束 方法
	
	@静态
	方法 exp_float(v : 单精度小数) : 单精度小数
		code return (float)Math.exp(#v);
	结束 方法
	
	@静态
	方法 cos_float(v : 单精度小数) : 单精度小数
		code return (float)Math.cos(#v);
	结束 方法
	
	@静态
	方法 sin_float(v : 单精度小数) : 单精度小数
		code return (float)Math.sin(#v);
	结束 方法
	
	@静态
	方法 floor(v : 单精度小数) : 单精度小数
		code return (float)Math.floor(#v);
	结束 方法
	
	@静态
	方法 两点相距(c1 : rl坐标,c2 : rl坐标) : 单精度小数
		变量 dx : 单精度小数 = c1.x - c2.x
		变量 dy : 单精度小数 = c1.y - c2.y
		code return (float)Math.sqrt(#dx * #dx + #dy * #dy);
	结束 方法
	
	@静态
	方法 多边形旋转()
		
	结束 方法
	
	@静态
	方法 旋转(旋转点 : rl坐标,中心点 : rl坐标,角度 : 单精度小数) : rl坐标
		变量 ren : rl坐标
		变量 rel : rl坐标 = 旋转点 - 中心点
		变量 cosTheta : 单精度小数 = cos_float(角度)
		变量 sinTheta : 单精度小数 = sin_float(角度)
		变量 xRelRotated : 单精度小数 = rel.x * cosTheta - rel.y * sinTheta
		变量 yRelRotated : 单精度小数 = rel.x * sinTheta + rel.y * cosTheta
		ren.set(xRelRotated + 中心点.x,yRelRotated + 中心点.y)
		返回 ren
	结束 方法
	
	@静态
	方法 旋转矩形(v : 矩形,角度 : 单精度小数) : 矩形点位置信息
		变量 cc : rl坐标
		cc.set(v.精确中心横坐标(),v.精确中心纵坐标())
		变量 ad : rl坐标
		变量 bd : rl坐标
		变量 cd : rl坐标
		变量 dd : rl坐标
		ad.set(v.左,v.上)
		bd.set(v.右,v.上)
		cd.set(v.右,v.下)
		dd.set(v.左,v.下)
		变量 rt : 矩形点位置信息
		rt.xs = 旋转(ad,cc,角度).x
		rt.ys = 旋转(ad,cc,角度).y
		rt.xe = 旋转(cd,cc,角度).x
		rt.ye = 旋转(cd,cc,角度).y
		返回 rt
	结束 方法
结束 类


类 矩形点位置信息
	变量 xs : 单精度小数 = 0.0f
	变量 ys : 单精度小数 = 0.0f
	变量 xe : 单精度小数 = 0.0f
	变量 ye : 单精度小数 = 0.0f
结束 类

类 曲线
	变量 类型 : 曲线类型?
	变量 起始值 : 单精度小数 = 0.0f
	变量 结束值 : 单精度小数 = 0.0f
	变量 播放中 : 逻辑型 = 假
	变量 打断 : 逻辑型 = 假
	变量 陡度 : 单精度小数 = 0.0f
	变量 方向 : 整数 = 0
	变量 差值 : 单精度小数 = 0.0f
	变量 播放线程 : 线程
	
	方法 定义(start : 单精度小数,end : 单精度小数,type : 曲线类型,曲线陡度 : 单精度小数 = 10.0f)
		如果 播放中 则
			打断 = 真
		结束 如果
		类型 = type
		起始值 = start
		结束值 = end
		陡度 = 曲线陡度
		差值 = 结束值 - 起始值
		如果 起始值 > 结束值 则
			方向 = -1
		否则
			方向 = 1
		结束 如果
		播放()
	结束 方法
	
	方法 播放()
		提交到新线程运行()
		播放中 = 真
		如果 类型 == 曲线类型.快慢 则
			变量 i : 单精度小数 = 0.0f
			循环(i < 100.0f)
				// 数学.abs_float(差值).到整数()
				延时(4)
				如果 打断 则
					打断 = 假
					退出循环
				否则
					输出值(起始值 + (1 - 数学.exp_float((0 - i) / 10.0f)) * 差值)
				结束 如果
				i = i + 0.2f
			结束 循环
		结束 如果
		播放中 = 假
		播放完毕()
		结束提交到新线程()
	结束 方法
	
	定义事件 输出值(value : 单精度小数)
	定义事件 播放完毕()
结束 类

@前缀代码("final")
@禁止创建对象
@禁止继承
@常量类型(整数)
@需求值类型(整数)
类 曲线类型
	@静态
	常量 快慢快 : 曲线类型?
	@静态
	常量 慢快慢 : 曲线类型?
	@静态
	常量 快慢 : 曲线类型?
	@静态
	常量 慢快 : 曲线类型?
	@静态
	常量 平滑 : 曲线类型?
	@code
	static {
		#快慢快 = 0;
		#慢快慢 = 1;
		#快慢 = 2;
		#慢快 = 3;
		#平滑 = 4;
	}
	@end
结束 类