类 rl空间信息
	变量 位置 : rl坐标
	变量 向量 : rl坐标
	变量 图形 : rl图形描述
	方法 取中心坐标() : rl坐标
		变量 temp : rl坐标
		temp.x = 位置.x + 图形.width  / 2
		temp.y = 位置.y + 图形.height / 2
		返回 temp
	结束 方法
	方法 合并向量()
		位置 = 位置 + 向量
	结束 方法
	@运算符重载
	方法 *(倍率 : 单精度小数) : rl空间信息
		变量 temp : rl空间信息
		temp.位置 = 位置
		temp.图形.width = 图形.width * 倍率
		temp.图形.height = 图形.height * 倍率
		返回 temp
	结束 方法
	@运算符重载
	方法 /(倍率 : 单精度小数) : rl空间信息
		变量 temp : rl空间信息
		temp.位置 = 位置
		temp.图形.width = 图形.width / 倍率
		temp.图形.height = 图形.height / 倍率
		返回 temp
	结束 方法
	@运算符重载
	方法 +(值 : rl空间信息) : rl空间信息
		变量 temp : rl空间信息
		temp.位置 = 位置 + 值.位置
		temp.图形 = 图形
		返回 temp
	结束 方法
	@运算符重载
	方法 -(值 : rl空间信息) : rl空间信息
		变量 temp : rl空间信息
		temp.位置 = 位置 - 值.位置
		temp.图形 = 图形
		返回 temp
	结束 方法
结束 类

类 rl坐标
	变量 x : 单精度小数 = 0.0f
	变量 y : 单精度小数 = 0.0f
	方法 set(nx : 单精度小数,ny : 单精度小数)
		x = nx
		y = ny
	结束 方法
	@运算符重载
	方法 +(值 : rl坐标) : rl坐标
		变量 temp : rl坐标
		temp.x = x + 值.x
		temp.y = y + 值.y
		返回 temp
	结束 方法
	@运算符重载
	方法 -(值 : rl坐标) : rl坐标
		变量 temp : rl坐标
		temp.x = x - 值.x
		temp.y = y - 值.y
		返回 temp
	结束 方法
	@运算符重载
	方法 /(值 : 单精度小数) : rl坐标
		变量 temp : rl坐标
		temp.x = x / 值
		temp.y = y / 值
		返回 temp
	结束 方法
	@运算符重载
	方法 *(值 : 单精度小数) : rl坐标
		变量 temp : rl坐标
		temp.x = x * 值
		temp.y = y * 值
		返回 temp
	结束 方法
	方法 到文本() : 文本
		返回 "x : " + x.到整数().到文本() + " y : " + y.到整数().到文本()
	结束 方法
结束 类

类 rl图形描述
	变量 width : 单精度小数 = 0.0f
	变量 height : 单精度小数 = 0.0f
	变量 shape : rlshape
结束 类

@前缀代码("final")
@禁止继承
@常量类型(整数)
@需求值类型(整数)
类 rlshape
	@静态
	常量 rectangle : rlshape = 0
	@静态
	常量 roundness : rlshape = 1
结束 类

类 rl绘制信息
	
结束 类