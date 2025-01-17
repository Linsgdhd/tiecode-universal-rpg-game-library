类 剧本解析器
	变量 剧本 : JSON对象?
	变量 索引 : 整数
	@隐藏
	常量 ticks : 文本 = "ticks"
	@隐藏
	常量 type : 文本 = "type"
	方法 初始化剧本(data : JSON对象)
		剧本 = data
		索引 = 0
	结束 方法
	方法 步进()
		如果 剧本 != 空 则
			变量 teml : JSON数组 = 剧本.取JSON数组(ticks)
			变量 temo : JSON对象 = teml.取JSON对象(索引)
			触发(temo.取整数(type),temo)
			如果 索引 > teml.长度 则
				播放完毕()
			否则
				自增(索引)
			结束 如果
		结束 如果
	结束 方法
	定义事件 播放完毕()
	定义事件 触发(type : 整数,value : JSON对象)
结束 类

@静态
类 剧本常量定义
	@静态
	常量 普通台词 : 整数 = 0
	@静态
	常量 战斗事件 : 整数 = 1
	@静态
	常量 选择事件 : 整数 = 2
结束 类