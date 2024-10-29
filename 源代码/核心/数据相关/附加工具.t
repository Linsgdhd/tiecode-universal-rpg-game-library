@全局类
类 生成器
	@静态
	方法 空实体() : 实体
		变量 temp : 实体
		temp.实例化(空战斗属性().序列化())
		返回 temp
	结束 方法

	@静态
	方法 空技能() : 技能
		变量 temp : 技能
		变量 jsonSkill = [[
		{
			"id":0,
			"name":"爱来自生成器",
			"type":100,
			"target":12,
			"description":"消耗[need]，削弱目标物理防御，并造成[[from:105]*0.8]点伤害，自身回复实际伤害的20%",
			"unconditional":false,
			"need":[
				{
					"id":102,
					"value":30
				}
			],
			"to":[
				{
					"id":109,
					"arit":"-[to:109]*0.1",
					"min":0
				},
				{
					"id":100,
					"arit":"-([from:105]*0.8-([to:109]-[from:107]*0.8))",
					"min":5
				},
				{
					"id":101,
					"arit":"-50"
					"min":0
				}
			],
			"from":[
				{
					"id":100,
					"arit":"+[sf:dd]*0.2"
				}
			],
			"subjoin":-1,
			"loop":0
		}
		]]
		返回 temp
	结束 方法

	@静态
	方法 空技能列表() : 技能容器
		变量 temp : 技能容器
		返回 temp
	结束 方法

	@静态
	方法 空角色(种族 : 整数,性别 : 逻辑型) : 角色
		变量 temp : 角色
		temp.id = 0
		temp.名字 = "alaya"
		temp.等级 = 100
		temp.种族 = 种族
		temp.战斗属性 = 指定种族战斗属性(种族,性别)
		temp.成长属性 = 指定种族成长属性(种族,性别)
		temp.附加属性 = 空附加属性()
		temp.技能列表 = 空技能列表()
		temp.装备列表 = 空装备列表()
		temp.实例化(temp.序列化())
		返回 temp
	结束 方法

	@静态
	方法 空羁绊(id : 整数) : 羁绊
		变量 temp : 羁绊
		temp.id = id
		temp.相遇次数 = 0
		temp.交互次数 = 0
		temp.交战次数 = 0
		temp.作战次数 = 0
		temp.敌对 = 假
		temp.好感度 = 0
		temp.信任度 = 0
		temp.熟悉度 = 0
		返回 temp
	结束 方法

	@静态
	方法 空装备() : 装备
		变量 temp : 装备
		temp.类型 = 装备类型.单手剑
		temp.id = 0
		temp.名字 = "生成器之刃"
		temp.等级 = 99
		temp.战斗属性 = 空战斗属性()
		temp.成长属性 = 空成长属性()
		temp.技能列表 = 空技能列表()
		//temp.实例化(temp.序列化())
		返回 temp
	结束 方法

	@静态
	方法 空附加属性() : 数值容器
		变量 temp : 数值容器
		temp.添加(值属性id.善恶,0)
		temp.添加(值属性id.自私,0)
		temp.添加(值属性id.贪婪,0)
		temp.添加(值属性id.固执,0)
		temp.添加(值属性id.勇气,0)
		temp.添加(值属性id.懒惰,0)
		temp.添加(值属性id.洁净,0)
		返回 temp
	结束 方法

	@静态
	方法 空战斗属性() : 数值容器
		变量 temp : 数值容器
		temp.添加(值属性id.生命,100)
		temp.添加(值属性id.法力,0)
		temp.添加(值属性id.体力,0)
		temp.添加(值属性id.智力,0)
		temp.添加(值属性id.魅力,0)
		temp.添加(值属性id.物伤,0)
		temp.添加(值属性id.法伤,0)
		temp.添加(值属性id.物穿,0)
		temp.添加(值属性id.法穿,0)
		temp.添加(值属性id.物抗,0)
		temp.添加(值属性id.法抗,0)
		temp.添加(值属性id.爆率,0)
		temp.添加(值属性id.爆伤,0)
		temp.添加(值属性id.幸运,0)
		temp.添加(值属性id.敏捷,0)
		返回 temp
	结束 方法

	@静态
	方法 空装备列表() : 装备容器
		变量 temp : 装备容器
		返回 temp
	结束 方法

	@静态
	方法 空成长属性() : 数值容器
		变量 temp : 数值容器
		temp.添加(值属性id.生命,10)
		temp.添加(值属性id.法力,10)
		temp.添加(值属性id.体力,2)
		temp.添加(值属性id.智力,2)
		temp.添加(值属性id.魅力,2)
		temp.添加(值属性id.物伤,8)
		temp.添加(值属性id.法伤,8)
		temp.添加(值属性id.物穿,0)
		temp.添加(值属性id.法穿,0)
		temp.添加(值属性id.物抗,2)
		temp.添加(值属性id.法抗,2)
		temp.添加(值属性id.爆率,0)
		temp.添加(值属性id.爆伤,0)
		temp.添加(值属性id.幸运,1)
		返回 temp
	结束 方法

	@静态
	方法 data(key : 整数,value : 整数) : 数值pack
		变量 t : 数值pack
		t.状态码 = key
		t.值 = value
		返回 t
	结束 方法

	@静态
	方法 data2(key : 整数,value : 文本) : 文本pack
		变量 t : 文本pack
		t.状态码 = key
		t.值 = value
		返回 t
	结束 方法

	@静态
	方法 数值pack(s : 整数,value : 整数) : 数值pack
		变量 t : 数值pack
		t.状态码 = s
		t.值 = value
		返回 t
	结束 方法

	方法 指定装备成长属性(类型 : 整数) : 数值容器
		变量 temp : 数值容器
		假如 类型
			是 装备类型.单手剑
				temp.添加(值属性id.生命,0)
				temp.添加(值属性id.法力,0)
				temp.添加(值属性id.体力,0)
				temp.添加(值属性id.智力,0)
				temp.添加(值属性id.魅力,0)
				temp.添加(值属性id.物伤,8)
				temp.添加(值属性id.法伤,0)
				temp.添加(值属性id.物穿,2)
				temp.添加(值属性id.法穿,0)
				temp.添加(值属性id.物抗,2)
				temp.添加(值属性id.法抗,0)
				temp.添加(值属性id.爆率,0)
				temp.添加(值属性id.爆伤,2)
				temp.添加(值属性id.幸运,0)
				temp.添加(值属性id.敏捷,0)
			是 装备类型.双手剑
				temp.添加(值属性id.生命,0)
				temp.添加(值属性id.法力,0)
				temp.添加(值属性id.体力,0)
				temp.添加(值属性id.智力,0)
				temp.添加(值属性id.魅力,0)
				temp.添加(值属性id.物伤,12)
				temp.添加(值属性id.法伤,0)
				temp.添加(值属性id.物穿,3)
				temp.添加(值属性id.法穿,0)
				temp.添加(值属性id.物抗,3)
				temp.添加(值属性id.法抗,0)
				temp.添加(值属性id.爆率,0)
				temp.添加(值属性id.爆伤,4)
				temp.添加(值属性id.幸运,0)
				temp.添加(值属性id.敏捷,0)
			是 装备类型.法杖
				temp.添加(值属性id.生命,0)
				temp.添加(值属性id.法力,0)
				temp.添加(值属性id.体力,0)
				temp.添加(值属性id.智力,0)
				temp.添加(值属性id.魅力,0)
				temp.添加(值属性id.物伤,1)
				temp.添加(值属性id.法伤,4)
				temp.添加(值属性id.物穿,0)
				temp.添加(值属性id.法穿,2)
				temp.添加(值属性id.物抗,1)
				temp.添加(值属性id.法抗,0)
				temp.添加(值属性id.爆率,0)
				temp.添加(值属性id.爆伤,2)
				temp.添加(值属性id.幸运,0)
				temp.添加(值属性id.敏捷,0)
			是 装备类型.短柄法杖
				temp.添加(值属性id.生命,0)
				temp.添加(值属性id.法力,0)
				temp.添加(值属性id.体力,0)
				temp.添加(值属性id.智力,0)
				temp.添加(值属性id.魅力,0)
				temp.添加(值属性id.物伤,1)
				temp.添加(值属性id.法伤,3)
				temp.添加(值属性id.物穿,0)
				temp.添加(值属性id.法穿,2)
				temp.添加(值属性id.物抗,1)
				temp.添加(值属性id.法抗,0)
				temp.添加(值属性id.爆率,0)
				temp.添加(值属性id.爆伤,2)
				temp.添加(值属性id.幸运,0)
				temp.添加(值属性id.敏捷,0)
			是 装备类型.弓箭
				temp.添加(值属性id.生命,0)
				temp.添加(值属性id.法力,0)
				temp.添加(值属性id.体力,0)
				temp.添加(值属性id.智力,0)
				temp.添加(值属性id.魅力,0)
				temp.添加(值属性id.物伤,6)
				temp.添加(值属性id.法伤,0)
				temp.添加(值属性id.物穿,3)
				temp.添加(值属性id.法穿,0)
				temp.添加(值属性id.物抗,0)
				temp.添加(值属性id.法抗,0)
				temp.添加(值属性id.爆率,0)
				temp.添加(值属性id.爆伤,2)
				temp.添加(值属性id.幸运,0)
				temp.添加(值属性id.敏捷,0)
		结束 假如
	结束 方法

	@静态
	方法 指定种族成长属性(种族 : 整数,性别 : 逻辑型) : 数值容器
		变量 temp : 数值容器
		假如 种族
			是 种族标签.人族
				如果 性别 则
					temp.添加(值属性id.生命,11)
					temp.添加(值属性id.法力,6)
					temp.添加(值属性id.体力,3)
					temp.添加(值属性id.智力,4)
					temp.添加(值属性id.魅力,3)
					temp.添加(值属性id.物伤,5)
					temp.添加(值属性id.法伤,2)
					temp.添加(值属性id.物穿,0)
					temp.添加(值属性id.法穿,0)
					temp.添加(值属性id.物抗,4)
					temp.添加(值属性id.法抗,3)
					temp.添加(值属性id.爆率,0)
					temp.添加(值属性id.爆伤,0)
					temp.添加(值属性id.幸运,0)
					temp.添加(值属性id.敏捷,3)
				否则
					temp.添加(值属性id.生命,9)
					temp.添加(值属性id.法力,7)
					temp.添加(值属性id.体力,2)
					temp.添加(值属性id.智力,5)
					temp.添加(值属性id.魅力,5)
					temp.添加(值属性id.物伤,3)
					temp.添加(值属性id.法伤,3)
					temp.添加(值属性id.物穿,0)
					temp.添加(值属性id.法穿,0)
					temp.添加(值属性id.物抗,2)
					temp.添加(值属性id.法抗,1)
					temp.添加(值属性id.爆率,0)
					temp.添加(值属性id.爆伤,0)
					temp.添加(值属性id.幸运,0)
					temp.添加(值属性id.敏捷,4)
				结束 如果
			是 种族标签.兽族
				如果 性别 则
					temp.添加(值属性id.生命,14)
					temp.添加(值属性id.法力,5)
					temp.添加(值属性id.体力,5)
					temp.添加(值属性id.智力,3)
					temp.添加(值属性id.魅力,2)
					temp.添加(值属性id.物伤,6)
					temp.添加(值属性id.法伤,2)
					temp.添加(值属性id.物穿,0)
					temp.添加(值属性id.法穿,0)
					temp.添加(值属性id.物抗,5)
					temp.添加(值属性id.法抗,3)
					temp.添加(值属性id.爆率,0)
					temp.添加(值属性id.爆伤,0)
					temp.添加(值属性id.幸运,0)
					temp.添加(值属性id.敏捷,4)
				否则
					temp.添加(值属性id.生命,12)
					temp.添加(值属性id.法力,5)
					temp.添加(值属性id.体力,4)
					temp.添加(值属性id.智力,4)
					temp.添加(值属性id.魅力,5)
					temp.添加(值属性id.物伤,5)
					temp.添加(值属性id.法伤,3)
					temp.添加(值属性id.物穿,0)
					temp.添加(值属性id.法穿,0)
					temp.添加(值属性id.物抗,4)
					temp.添加(值属性id.法抗,3)
					temp.添加(值属性id.爆率,0)
					temp.添加(值属性id.爆伤,0)
					temp.添加(值属性id.幸运,0)
					temp.添加(值属性id.敏捷,3)
				结束 如果
			是 种族标签.妖族
				如果 性别 则
					temp.添加(值属性id.生命,10)
					temp.添加(值属性id.法力,8)
					temp.添加(值属性id.体力,2)
					temp.添加(值属性id.智力,4)
					temp.添加(值属性id.魅力,4)
					temp.添加(值属性id.物伤,2)
					temp.添加(值属性id.法伤,5)
					temp.添加(值属性id.物穿,0)
					temp.添加(值属性id.法穿,1)
					temp.添加(值属性id.物抗,2)
					temp.添加(值属性id.法抗,5)
					temp.添加(值属性id.爆率,0)
					temp.添加(值属性id.爆伤,0)
					temp.添加(值属性id.幸运,0)
					temp.添加(值属性id.敏捷,3)
				否则
					temp.添加(值属性id.生命,9)
					temp.添加(值属性id.法力,8)
					temp.添加(值属性id.体力,2)
					temp.添加(值属性id.智力,4)
					temp.添加(值属性id.魅力,6)
					temp.添加(值属性id.物伤,2)
					temp.添加(值属性id.法伤,5)
					temp.添加(值属性id.物穿,0)
					temp.添加(值属性id.法穿,1)
					temp.添加(值属性id.物抗,2)
					temp.添加(值属性id.法抗,5)
					temp.添加(值属性id.爆率,0)
					temp.添加(值属性id.爆伤,0)
					temp.添加(值属性id.幸运,0)
					temp.添加(值属性id.敏捷,3)
				结束 如果
			是 种族标签.魔族
				如果 性别 则
					temp.添加(值属性id.生命,20)
					temp.添加(值属性id.法力,10)
					temp.添加(值属性id.体力,4)
					temp.添加(值属性id.智力,6)
					temp.添加(值属性id.魅力,5)
					temp.添加(值属性id.物伤,7)
					temp.添加(值属性id.法伤,7)
					temp.添加(值属性id.物穿,1)
					temp.添加(值属性id.法穿,1)
					temp.添加(值属性id.物抗,5)
					temp.添加(值属性id.法抗,5)
					temp.添加(值属性id.爆率,0)
					temp.添加(值属性id.爆伤,0)
					temp.添加(值属性id.幸运,0)
					temp.添加(值属性id.敏捷,3)
				否则
					temp.添加(值属性id.生命,15)
					temp.添加(值属性id.法力,12)
					temp.添加(值属性id.体力,4)
					temp.添加(值属性id.智力,6)
					temp.添加(值属性id.魅力,7)
					temp.添加(值属性id.物伤,7)
					temp.添加(值属性id.法伤,7)
					temp.添加(值属性id.物穿,1)
					temp.添加(值属性id.法穿,1)
					temp.添加(值属性id.物抗,4)
					temp.添加(值属性id.法抗,4)
					temp.添加(值属性id.爆率,0)
					temp.添加(值属性id.爆伤,0)
					temp.添加(值属性id.幸运,0)
					temp.添加(值属性id.敏捷,3)
				结束 如果
			是 种族标签.神族
				如果 性别 则
					temp.添加(值属性id.生命,40)
					temp.添加(值属性id.法力,20)
					temp.添加(值属性id.体力,8)
					temp.添加(值属性id.智力,8)
					temp.添加(值属性id.魅力,4)
					temp.添加(值属性id.物伤,2)
					temp.添加(值属性id.法伤,18)
					temp.添加(值属性id.物穿,0)
					temp.添加(值属性id.法穿,3)
					temp.添加(值属性id.物抗,5)
					temp.添加(值属性id.法抗,8)
					temp.添加(值属性id.爆率,0)
					temp.添加(值属性id.爆伤,2)
					temp.添加(值属性id.幸运,0)
					temp.添加(值属性id.敏捷,4)
				否则
					temp.添加(值属性id.生命,38)
					temp.添加(值属性id.法力,20)
					temp.添加(值属性id.体力,8)
					temp.添加(值属性id.智力,8)
					temp.添加(值属性id.魅力,5)
					temp.添加(值属性id.物伤,2)
					temp.添加(值属性id.法伤,18)
					temp.添加(值属性id.物穿,0)
					temp.添加(值属性id.法穿,3)
					temp.添加(值属性id.物抗,5)
					temp.添加(值属性id.法抗,7)
					temp.添加(值属性id.爆率,0)
					temp.添加(值属性id.爆伤,2)
					temp.添加(值属性id.幸运,0)
					temp.添加(值属性id.敏捷,3)
				结束 如果
			是 种族标签.元素
				temp.添加(值属性id.生命,4)
				temp.添加(值属性id.法力,20)
				temp.添加(值属性id.体力,0)
				temp.添加(值属性id.智力,2)
				temp.添加(值属性id.魅力,2)
				temp.添加(值属性id.物伤,1)
				temp.添加(值属性id.法伤,9)
				temp.添加(值属性id.物穿,0)
				temp.添加(值属性id.法穿,0)
				temp.添加(值属性id.物抗,0)
				temp.添加(值属性id.法抗,10)
				temp.添加(值属性id.爆率,0)
				temp.添加(值属性id.爆伤,0)
				temp.添加(值属性id.幸运,1)
				temp.添加(值属性id.敏捷,2)
		结束 假如
		返回 temp
	结束 方法

	@静态
	方法 指定种族战斗属性(种族 : 整数,性别 : 逻辑型) : 数值容器
		变量 temp : 数值容器
		假如 种族
			是 种族标签.人族
				如果 性别 则
					temp.添加(值属性id.生命,140)
					temp.添加(值属性id.法力,50)
					temp.添加(值属性id.体力,70)
					temp.添加(值属性id.智力,40)
					temp.添加(值属性id.魅力,10)
					temp.添加(值属性id.物伤,20)
					temp.添加(值属性id.法伤,10)
					temp.添加(值属性id.物穿,0)
					temp.添加(值属性id.法穿,0)
					temp.添加(值属性id.物抗,10)
					temp.添加(值属性id.法抗,4)
					temp.添加(值属性id.爆率,0)
					temp.添加(值属性id.爆伤,0)
					temp.添加(值属性id.幸运,0)
					temp.添加(值属性id.敏捷,28)
				否则
					temp.添加(值属性id.生命,120)
					temp.添加(值属性id.法力,60)
					temp.添加(值属性id.体力,60)
					temp.添加(值属性id.智力,36)
					temp.添加(值属性id.魅力,14)
					temp.添加(值属性id.物伤,16)
					temp.添加(值属性id.法伤,10)
					temp.添加(值属性id.物穿,0)
					temp.添加(值属性id.法穿,0)
					temp.添加(值属性id.物抗,8)
					temp.添加(值属性id.法抗,4)
					temp.添加(值属性id.爆率,0)
					temp.添加(值属性id.爆伤,0)
					temp.添加(值属性id.幸运,0)
					temp.添加(值属性id.敏捷,22)
				结束 如果
			是 种族标签.兽族
				如果 性别 则
					temp.添加(值属性id.生命,200)
					temp.添加(值属性id.法力,60)
					temp.添加(值属性id.体力,80)
					temp.添加(值属性id.智力,3)
					temp.添加(值属性id.魅力,2)
					temp.添加(值属性id.物伤,6)
					temp.添加(值属性id.法伤,2)
					temp.添加(值属性id.物穿,0)
					temp.添加(值属性id.法穿,0)
					temp.添加(值属性id.物抗,5)
					temp.添加(值属性id.法抗,3)
					temp.添加(值属性id.爆率,0)
					temp.添加(值属性id.爆伤,0)
					temp.添加(值属性id.幸运,0)
					temp.添加(值属性id.敏捷,34)
				否则
					temp.添加(值属性id.生命,180)
					temp.添加(值属性id.法力,60)
					temp.添加(值属性id.体力,65)
					temp.添加(值属性id.智力,4)
					temp.添加(值属性id.魅力,5)
					temp.添加(值属性id.物伤,5)
					temp.添加(值属性id.法伤,3)
					temp.添加(值属性id.物穿,0)
					temp.添加(值属性id.法穿,0)
					temp.添加(值属性id.物抗,4)
					temp.添加(值属性id.法抗,3)
					temp.添加(值属性id.爆率,0)
					temp.添加(值属性id.爆伤,0)
					temp.添加(值属性id.幸运,0)
					temp.添加(值属性id.敏捷,36)
				结束 如果
			是 种族标签.妖族
				如果 性别 则
					temp.添加(值属性id.生命,100)
					temp.添加(值属性id.法力,8)
					temp.添加(值属性id.体力,2)
					temp.添加(值属性id.智力,4)
					temp.添加(值属性id.魅力,4)
					temp.添加(值属性id.物伤,2)
					temp.添加(值属性id.法伤,5)
					temp.添加(值属性id.物穿,0)
					temp.添加(值属性id.法穿,1)
					temp.添加(值属性id.物抗,2)
					temp.添加(值属性id.法抗,5)
					temp.添加(值属性id.爆率,0)
					temp.添加(值属性id.爆伤,0)
					temp.添加(值属性id.幸运,0)
					temp.添加(值属性id.敏捷,21)
				否则
					temp.添加(值属性id.生命,90)
					temp.添加(值属性id.法力,8)
					temp.添加(值属性id.体力,2)
					temp.添加(值属性id.智力,4)
					temp.添加(值属性id.魅力,6)
					temp.添加(值属性id.物伤,2)
					temp.添加(值属性id.法伤,5)
					temp.添加(值属性id.物穿,0)
					temp.添加(值属性id.法穿,1)
					temp.添加(值属性id.物抗,2)
					temp.添加(值属性id.法抗,5)
					temp.添加(值属性id.爆率,0)
					temp.添加(值属性id.爆伤,0)
					temp.添加(值属性id.幸运,0)
					temp.添加(值属性id.敏捷,21)
				结束 如果
			是 种族标签.魔族
				如果 性别 则
					temp.添加(值属性id.生命,302)
					temp.添加(值属性id.法力,10)
					temp.添加(值属性id.体力,4)
					temp.添加(值属性id.智力,6)
					temp.添加(值属性id.魅力,5)
					temp.添加(值属性id.物伤,7)
					temp.添加(值属性id.法伤,7)
					temp.添加(值属性id.物穿,1)
					temp.添加(值属性id.法穿,1)
					temp.添加(值属性id.物抗,5)
					temp.添加(值属性id.法抗,5)
					temp.添加(值属性id.爆率,0)
					temp.添加(值属性id.爆伤,0)
					temp.添加(值属性id.幸运,0)
					temp.添加(值属性id.敏捷,16)
				否则
					temp.添加(值属性id.生命,298)
					temp.添加(值属性id.法力,12)
					temp.添加(值属性id.体力,4)
					temp.添加(值属性id.智力,6)
					temp.添加(值属性id.魅力,7)
					temp.添加(值属性id.物伤,7)
					temp.添加(值属性id.法伤,7)
					temp.添加(值属性id.物穿,1)
					temp.添加(值属性id.法穿,1)
					temp.添加(值属性id.物抗,4)
					temp.添加(值属性id.法抗,4)
					temp.添加(值属性id.爆率,0)
					temp.添加(值属性id.爆伤,0)
					temp.添加(值属性id.幸运,0)
					temp.添加(值属性id.敏捷,24)
				结束 如果
			是 种族标签.神族
				如果 性别 则
					temp.添加(值属性id.生命,1000)
					temp.添加(值属性id.法力,20)
					temp.添加(值属性id.体力,8)
					temp.添加(值属性id.智力,8)
					temp.添加(值属性id.魅力,4)
					temp.添加(值属性id.物伤,2)
					temp.添加(值属性id.法伤,14)
					temp.添加(值属性id.物穿,0)
					temp.添加(值属性id.法穿,2)
					temp.添加(值属性id.物抗,5)
					temp.添加(值属性id.法抗,8)
					temp.添加(值属性id.爆率,0)
					temp.添加(值属性id.爆伤,2)
					temp.添加(值属性id.幸运,0)
					temp.添加(值属性id.敏捷,10)
				否则
					temp.添加(值属性id.生命,960)
					temp.添加(值属性id.法力,20)
					temp.添加(值属性id.体力,8)
					temp.添加(值属性id.智力,8)
					temp.添加(值属性id.魅力,5)
					temp.添加(值属性id.物伤,2)
					temp.添加(值属性id.法伤,15)
					temp.添加(值属性id.物穿,0)
					temp.添加(值属性id.法穿,3)
					temp.添加(值属性id.物抗,5)
					temp.添加(值属性id.法抗,7)
					temp.添加(值属性id.爆率,0)
					temp.添加(值属性id.爆伤,0)
					temp.添加(值属性id.幸运,0)
					temp.添加(值属性id.敏捷,10)
				结束 如果
			是 种族标签.元素
				temp.添加(值属性id.生命,40)
				temp.添加(值属性id.法力,20)
				temp.添加(值属性id.体力,0)
				temp.添加(值属性id.智力,2)
				temp.添加(值属性id.魅力,2)
				temp.添加(值属性id.物伤,1)
				temp.添加(值属性id.法伤,9)
				temp.添加(值属性id.物穿,0)
				temp.添加(值属性id.法穿,0)
				temp.添加(值属性id.物抗,0)
				temp.添加(值属性id.法抗,10)
				temp.添加(值属性id.爆率,0)
				temp.添加(值属性id.爆伤,0)
				temp.添加(值属性id.幸运,1)
				temp.添加(值属性id.敏捷,20)
		结束 假如
		返回 temp
	结束 方法
结束 类