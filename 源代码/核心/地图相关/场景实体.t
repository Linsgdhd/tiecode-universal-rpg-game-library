类 格子
	变量 容器 : 场景?
	变量 背景图片 : 位图对象?
	变量 背景颜色 : 整数
	变量 虚空 : 逻辑型
	变量 位置 : rl坐标
	变量 row : 整数
	变量 col : 整数
	方法 初始化(data : JSON对象,ic : 场景)
		容器 = ic
		row = data.取整数("y")
		col = data.取整数("x")
		位置.x = data.取整数("x") * 容器.网格大小
		位置.y = data.取整数("y") * 容器.网格大小
		背景图片 = 位图对象.创建缩放位图(ic.数据管理.取位图(data.取文本("img")),ic.网格大小,ic.网格大小,真)
	结束 方法
	@虚拟事件
	方法 初始化补充(data : JSON对象)
	结束 方法
	方法 被点击() : 格子
		返回 本对象
	结束 方法
结束 类

类 场景实体
	变量 容器 : 场景?
	变量 类型 : 整数
	变量 用户数据 : 对象
	变量 位图序列 : 位图容器
	变量 计数 : 计数器
	变量 位置 : rl坐标
	变量 row : 整数
	变量 col : 整数
	方法 取位图() : 位图对象
		返回 位图序列.访问()
	结束 方法
	方法 初始化(data : JSON对象,ic : 场景)
		订阅事件()
		容器 = ic
		类型 = data.取整数("type")
		计数.最大计数 = data.取整数("tick")
		row = data.取整数("y")
		col = data.取整数("x")
		位置.x = data.取整数("x") * 容器.网格大小
		位置.y = data.取整数("y") * 容器.网格大小
		变量 tempjil : JSON数组 = data.取JSON数组("imgList")
		循环(i, 0, tempjil.长度)
			位图序列.添加(位图对象.创建缩放位图(ic.数据管理.取位图(tempjil.取文本(i)),ic.网格大小,ic.网格大小,真))
		结束 循环
	结束 方法
	事件 计数 : 触发()
		位图序列.下一张()
	结束 事件
结束 类

类 角色场景实体
结束 类