@导入Java("org.json.*")
类 数值容器
	@隐藏
	变量 容器 : 整数到整数哈希表
	方法 取容器() : 整数到整数哈希表
		返回 容器
	结束 方法
	方法 添加(id : 整数,值 : 整数)
		容器.添加项目(id.到对象(),值.到对象())
	结束 方法
	方法 删除(id : 整数)
		容器.删除项目(id.到对象())
	结束 方法
	方法 取(id : 整数) : 数值pack
		如果 是否存在(id) 则
			返回 生成器.数值pack(状态码.成功,容器.取项目(id.到对象()).到基本类型())
		否则
			警告(5,警告类型.数值容器_指定key不存在)
			返回 生成器.数值pack(状态码.失败,0)
		结束 如果
	结束 方法
	方法 是否存在(id : 整数) : 逻辑型
		返回 容器.是否存在(id.到对象())
	结束 方法
	@运算符重载
	方法 [](id : 整数) : 数值pack
		返回 取(id)
	结束 方法
	@运算符重载
	方法 []=(id : 整数,值 : 整数)
		如果 是否存在(id) 则
			变量 更新前 : 整数 = 容器[id.到对象()].到基本类型()
			容器[id.到对象()] = 值.到对象()
			值更新(id,更新前,值)
		否则
			警告(5,警告类型.数值容器_指定key不存在)
		结束 如果
	结束 方法
	方法 加法(id : 整数,值 : 整数)
		如果 是否存在(id) 则
			变量 更新前 : 整数 = 容器.取项目(id.到对象()).到基本类型()
			变量 合并值 : 整数 = 更新前 + 值
			容器[id.到对象()] = 合并值.到对象()
			值更新(id,更新前,合并值)
		否则
			添加(id,值)
			值更新(id,0,值)
		结束 如果
	结束 方法
	方法 减法(id : 整数,值 : 整数)
		如果 是否存在(id) 则
			变量 更新前 : 整数 = 容器.取项目(id.到对象()).到基本类型()
			变量 合并值 : 整数 = 更新前 - 值
			容器[id.到对象()] = 合并值.到对象()
			值更新(id,更新前,合并值)
		否则
			警告(5,警告类型.数值容器_指定key不存在)
		结束 如果
	结束 方法
	方法 清空()
		容器.清空()
	结束 方法
	方法 合并(目标 : 数值容器) : 数值容器
		变量 temp : 数值容器
		变量 a : JSON数组 = 序列化().取JSON数组("data")
		变量 b : JSON数组 = 目标.序列化().取JSON数组("data")
		循环(i, 0, a.长度)
			变量 tema : JSON对象 = a.取JSON对象(i)
			temp.添加(tema.取整数("key"),tema.取整数("value"))
		结束 循环
		循环(e, 0, b.长度)
			变量 temb : JSON对象 = b.取JSON对象(e)
			如果 temp.是否存在(temb.取整数("key")) 则
				temp.加法(temb.取整数("key"),temb.取整数("value"))
			否则
				temp.添加(temb.取整数("key"),temb.取整数("value"))
			结束 如果
		结束 循环
		返回 temp
	结束 方法
	方法 合并2(目标 : 数值容器) : 数值容器
		变量 temp : 数值容器
		变量 目标容器 : 整数到整数哈希表 = 目标.取容器()
		@code
		for (Integer key : #容器.keySet()) {
			#<temp.加法>(key,(int)(#容器.get(key)));
		}
		for (Integer key : #目标容器.keySet()) {
			#<temp.加法>(key,(int)(#目标容器.get(key)));
		}
		@end
		返回 temp
	结束 方法
	方法 乘法(值 : 单精度小数) : 数值容器
		变量 temp : 数值容器
		@code
		for (Integer key : #容器.keySet()) {
			#<temp.添加>(key,(int)(#容器.get(key) * (#值 + 1)));
		}
		@end
		返回 temp
	结束 方法
	方法 实例化(data : JSON数组)
		清空()
		循环(i, 0, data.长度)
			变量 temp : JSON对象 = data.取JSON对象(i)
			添加(temp.取整数("id"),temp.取整数("value"))
		结束 循环
	结束 方法
	方法 序列化() : JSON对象
		变量 temp : JSON对象 = "{}"
		变量 data : JSON数组 = "[]"
		temp.置入("version",1)
		temp.置入("time",取当前时间戳())
		@code
		for (Integer key : #容器.keySet()) {
			try {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("id", key);
				jsonObject.put("value", #容器.get(key));
				#data.put(jsonObject);
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
		@end
		temp.置入("data",data)
		返回 temp
	结束 方法
	属性读 长度() : 整数
		返回 容器.长度
	结束 属性
	定义事件 值更新(id : 整数,更新前 : 整数,更新后 : 整数)
	定义事件 警告(严重等级 : 整数,类型 : 整数)
结束 类

类 索引数值容器
	变量 容器 : 整数集合
	方法 添加(value : 整数)
		容器.添加成员(value.到对象())
	结束 方法
	方法 删除(索引 : 整数)
		容器.删除成员(索引)
	结束 方法
	方法 清空()
		容器.清空()
	结束 方法
	方法 获取(索引 : 整数) : 整数
		容器.取成员(索引).到基本类型()
	结束 方法
	方法 是否存在(value : 整数) : 逻辑型
		返回 容器.是否存在(value.到对象())
	结束 方法
	方法 实例化(data : JSON数组)
		清空()
		循环(i, 0, data.长度)
			添加(data.取整数(i))
		结束 循环
	结束 方法
	方法 序列化() : JSON对象
		变量 temp : JSON对象 = "{}"
		变量 temo : JSON数组 = "[]"
		循环(i, 0, 长度())
			temo.置入(容器.取成员(i).到基本类型())
		结束 循环
		temp.置入("data",temo)
		返回 temp
	结束 方法
	属性读 长度() : 整数
		返回 容器.长度
	结束 属性
结束 类

@导入Java("org.json.*")
类 文本容器
	@隐藏
	变量 容器 : 整数到文本哈希表
	方法 添加(id : 整数,值 : 文本)
		容器.添加项目(id.到对象(),值)
	结束 方法
	方法 删除(id : 整数)
		容器.删除项目(id.到对象())
	结束 方法
	方法 取(id : 整数) : 文本
		如果 是否存在(id) 则
			返回 容器.取项目(id.到对象())
		否则
			警告(5,警告类型.数值容器_指定key不存在)
			返回 "nav"
		结束 如果
	结束 方法
	方法 是否存在(id : 整数) : 逻辑型
		返回 容器.是否存在(id.到对象())
	结束 方法
	@运算符重载
	方法 [](id : 整数) : 文本
		返回 取(id)
	结束 方法
	@运算符重载
	方法 []=(id : 整数,值 : 文本)
		如果 是否存在(id) 则
			容器[id.到对象()] = 值
			值更新(id,值)
		否则
			警告(5,警告类型.数值容器_指定key不存在)
		结束 如果
	结束 方法
	方法 清空()
		容器.清空()
	结束 方法
	方法 实例化(data : JSON数组)
		清空()
		循环(i, 0, data.长度)
			变量 temp : JSON对象 = data.取JSON对象(i)
			添加(temp.取整数("id"),temp.取文本("value"))
		结束 循环
	结束 方法
	方法 序列化() : JSON对象
		变量 temp : JSON对象 = "{}"
		变量 data : JSON数组 = "[]"
		temp.置入("type","文本容器")
		temp.置入("version",容器版本.文本容器版本)
		temp.置入("time",取当前时间戳())
		@code
		for (Integer key : #容器.keySet()) {
			try {
				JSONObject jsonObject = new JSONObject();
				// 向JSONObject中添加键值对
				jsonObject.put("id", key);
				jsonObject.put("value", #容器.get(key));
				#data.put(jsonObject);
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
		@end
		temp.置入("data",data)
		返回 temp
	结束 方法
	属性读 长度() : 整数
		返回 容器.长度
	结束 属性
	定义事件 值更新(id : 整数,值 : 文本)
	定义事件 警告(严重等级 : 整数,类型 : 整数)
结束 类

类 技能容器
	方法 实例化(值 : JSON数组)
	结束 方法
	方法 序列化() : JSON对象
		变量 temp : JSON对象 = "{}"
		返回 temp
	结束 方法
结束 类

类 位图容器
	方法 实例化(值 : JSON对象) : 位图容器
		返回 本对象
	结束 方法
	方法 序列化() : JSON对象
		变量 temp : JSON对象 = "{}"
		返回 temp
	结束 方法
结束 类

类 坐标容器
	方法 实例化(值 : JSON对象)
	结束 方法
	方法 序列化() : JSON对象
		变量 temp : JSON对象 = "{}"
		返回 temp
	结束 方法
结束 类

类 建筑容器
	变量 容器 : 集合
	方法 实例化(值 : JSON对象)
	结束 方法
	方法 序列化() : JSON对象
		变量 temp : JSON对象 = "{}"
		返回 temp
	结束 方法
	方法 长度() : 整数
		返回 容器.长度
	结束 方法
结束 类

类 地板容器
	变量 容器 : 地板[]?
	变量 依附 : 场景?
	方法 实例化(值 : JSON对象,sc : 场景)
		依附 = sc
		变量 数组 : JSON数组 = 值.取JSON数组("floor")
		变量 temp : 地板[依附.宽度 * 依附.高度]
		容器 = temp
		如果 数组.长度 != 取数组长度(容器) 则
			警告("地板数量与场景大小不匹配！")
		否则
			循环(i, 0, 数组.长度)
				变量 tr : 地板
			结束 循环
		结束 如果
	结束 方法
	方法 序列化() : JSON对象
		变量 temp : JSON对象 = "{}"
		返回 temp
	结束 方法
	方法 取目标地板(x : 整数,y : 整数)
		
	结束 方法
	方法 长度() : 整数
		返回 取数组长度(容器)
	结束 方法
	定义事件 警告(内容 : 文本)
结束 类

类 场景角色容器
	变量 容器 : 集合
	方法 实例化(值 : JSON对象)
	结束 方法
	方法 序列化() : JSON对象
		变量 temp : JSON对象 = "{}"
		返回 temp
	结束 方法
	方法 长度() : 整数
		返回 容器.长度
	结束 方法
结束 类

类 场景容器
	方法 实例化(值 : JSON对象)
	结束 方法
	方法 序列化() : JSON对象
		变量 temp : JSON对象 = "{}"
		返回 temp
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

类 角色容器
	// 存储角色uid
	变量 索引 : 整数集合
	变量 容器 : 集合
	变量 计数器 : 整数
	方法 重置计数器()
		计数器 = 0
	结束 方法
	方法 清空()
		重置计数器()
		容器.清空()
		索引.清空()
	结束 方法
	方法 读取完毕() : 逻辑型
		返回 计数器 >= 容器.长度
	结束 方法
	方法 下一个() : 角色
		变量 temp : 角色 = 容器.取成员(计数器)
		自增(计数器)
		返回 temp
	结束 方法
	方法 添加(值 : 角色)
		容器.添加成员(值)
		索引.添加成员(值.id.到对象())
	结束 方法
	方法 删除(值 : 角色)
		容器.删除成员2(值)
		索引.删除成员2(值.id.到对象())
	结束 方法
	方法 获取(角色id : 整数) : 角色
		变量 temp : 角色 = 容器.取成员(索引.寻找成员(角色id.到对象()))
		返回 temp
	结束 方法
	@运算符重载
	方法 [](索引 : 整数) : 角色
		变量 temp : 角色 = 容器.取成员(索引)
		返回 temp
	结束 方法
	方法 是否存在(角色id : 整数) : 逻辑型
		返回 索引.是否存在(角色id.到对象())
	结束 方法
	方法 长度() : 整数
		返回 容器.长度
	结束 方法
	方法 序列化() : JSON对象
		变量 jo角色容器 : JSON对象 = "{}"
		变量 jo角色列表 : JSON数组 = "[]"
		jo角色容器.置入("type","角色容器")
		jo角色容器.置入("version",容器版本.角色容器版本)
		jo角色容器.置入("time",取当前时间戳())
		循环(i, 0, 容器.长度)
			变量 temp : 角色 = 容器.取成员(i)
			变量 json : JSON对象 = temp.序列化()
			jo角色列表.置入(json)
		结束 循环
		jo角色容器.置入("data",jo角色列表)
		返回 jo角色容器
	结束 方法
	方法 实例化(data : JSON对象)
	结束 方法
结束 类

类 羁绊容器
	变量 索引 : 整数集合
	变量 容器 : 集合
	方法 添加(值 : 羁绊)
		容器.添加成员(值)
		索引.添加成员(值.id.到对象())
	结束 方法
	方法 删除(值 : 羁绊)
		容器.删除成员2(值)
		索引.删除成员2(值.id.到对象())
	结束 方法
	方法 取(角色id : 整数) : 羁绊
		变量 temp : 羁绊 = 容器.取成员(索引.寻找成员(角色id.到对象()))
		返回 temp
	结束 方法
	方法 是否存在(角色id : 整数) : 逻辑型
		返回 索引.是否存在(角色id.到对象())
	结束 方法
	方法 序列化() : JSON对象
		变量 temp : JSON对象 = "{}"
		返回 temp
	结束 方法
	方法 实例化(value : JSON数组)
		
	结束 方法
	方法 长度() : 整数
		返回 容器.长度
	结束 方法
结束 类


类 角色pack
	变量 状态码 : 整数
	变量 uid : 整数
	变量 value : 角色
结束 类

类 数值pack
	变量 状态码 : 整数
	变量 值 : 整数
结束 类

类 文本pack
	变量 状态码 : 整数
	变量 值 : 文本
结束 类

类 可序列化数据
	变量 容器 : 集合
	
结束 类

类 Page
	变量 数据类型 : 整数
结束 类