类 装备 : 实体
	变量 类型 : 整数
	变量 品质 : 整数
	变量 耐久 : 整数
	
	事件 装备 : 序列化补充(value : JSON对象)
		
	结束 事件
	
	事件 装备 : 实例化补充(value : JSON对象)
		标签.添加(tags.装备)
	结束 事件
结束 类

@静态
类 装备类型
	@静态
	常量 nav : 整数 = 99
	@静态
	常量 单手剑 : 整数 = 100
	@静态
	常量 双手剑 : 整数 = 101
	@静态
	常量 法杖 : 整数 = 102
	@静态
	常量 短柄法杖 : 整数 = 103
	@静态
	常量 弓箭 : 整数 = 104
	@静态
	常量 匕首 : 整数 = 105
	@静态
	常量 胸甲 : 整数 = 200
	@静态
	常量 裤子 : 整数 = 201
	@静态
	常量 鞋子 : 整数 = 202
	@静态
	常量 手套 : 整数 = 203
	@静态
	常量 手臂 : 整数 = 204
	@静态
	常量 单手盾 : 整数 = 300
	@静态
	常量 双手盾 : 整数 = 301
结束 类

类 装备插槽
	变量 头部 : 装备
	变量 面部 : 装备
	变量 左手 : 装备
	变量 右手 : 装备
	变量 身体 : 装备
	变量 腿部 : 装备
	变量 脚部 : 装备
	变量 背部 : 装备
	变量 饰品槽_左手 : 装备
	变量 饰品槽_右手 : 装备
	变量 饰品槽_颈部 : 装备
	变量 饰品槽_头顶 : 装备
	变量 饰品槽_左腿 : 装备
	变量 饰品槽_右腿 : 装备
	变量 饰品槽_左脚 : 装备
	变量 饰品槽_右脚 : 装备
	方法 实例化()
		
	结束 方法
	方法 序列化()
		
	结束 方法
结束 类

类 装备容器
	变量 容器 : 集合
	方法 添加()
	结束 方法
	方法 实例化(值 : JSON数组)
	结束 方法
	方法 序列化() : JSON对象
		变量 temp : JSON对象 = "{}"
		返回 temp
	结束 方法
结束 类