类 rl空间信息
	变量 位置 : rl坐标
	变量 向量 : rl坐标
	变量 大小 : rl高宽
	方法 合并向量()
		位置 = 位置 + 向量
	结束 方法
	@运算符重载
	方法 *(倍率 : 单精度小数) : rl空间信息
		变量 temp : rl空间信息
		temp.位置 = 位置
		temp.大小.width = 大小.width * 倍率
		temp.大小.height = 大小.height * 倍率
		返回 temp
	结束 方法
	@运算符重载
	方法 +(值 : rl空间信息) : rl空间信息
		变量 temp : rl空间信息
		temp.位置 = 位置 + 值.位置
		temp.大小 = 大小
		返回 temp
	结束 方法
	@运算符重载
	方法 -(值 : rl空间信息) : rl空间信息
		变量 temp : rl空间信息
		temp.位置 = 位置 - 值.位置
		temp.大小 = 大小
		返回 temp
	结束 方法
结束 类

类 rl坐标
	变量 x : 单精度小数
	变量 y : 单精度小数
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
结束 类

类 rl高宽
	变量 width : 单精度小数 = 0.0f
	变量 height : 单精度小数 = 0.0f
结束 类