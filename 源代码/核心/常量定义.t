@静态
类 容器版本
	@静态
	常量 数值容器版本 : 整数 = 1
	@静态
	常量 文本容器版本 : 整数 = 1
	@静态
	常量 角色容器版本 : 整数 = 1
结束 类

@静态
类 世界状态
	@静态
	常量 就绪 : 整数 = 0
	@静态
	常量 运行 : 整数 = 1
	@静态
	常量 暂停 : 整数 = 2
	@静态
	常量 关闭 : 整数 = 3
结束 类


@静态
类 建筑类型
	@静态
	常量 商店 : 整数 = 900
	@静态
	常量 旅馆 : 整数 = 901
	@静态
	常量 入口 : 整数 = 902
	@静态
	常量 观赏 : 整数 = 903
结束 类

@静态
类 文档后缀
	@静态
	常量 角色文档 : 文本 = "rlaj"
	@静态
	常量 世界文档 : 文本 = "rlwj"
	@静态
	常量 实体文档 : 文本 = "rlej"
	@静态
	常量 技能文档 : 文本 = "rlkj"
	@静态
	常量 地图文档 : 文本 = "rlmj"
	@静态
	常量 jpg : 文本 = "jpg"
	@静态
	常量 txt : 文本 = "txt"
结束 类

@静态
类 警告类型
	@静态
	常量 解析器版本过低 : 整数 = 100
	@静态
	常量 数据不存在 : 整数 = 404
	@静态
	常量 数据解析出错 : 整数 = 300
	@静态
	常量 未知类型错误 : 整数 = 301
	@静态
	常量 序列化数据时出错 : 整数 = 302
	@静态
	常量 数值容器_指定key不存在 : 整数 = 303
结束 类


@全局类
类 文本属性id
	常量 名字 : 整数 = 2001
	常量 行为文本_攻击 : 整数 = 2002
结束 类


@全局类
类 值属性id
	@静态
	常量 经验 : 整数 = 99
	@静态
	常量 生命 : 整数 = 100
	@静态
	常量 法力 : 整数 = 101
	@静态
	常量 体力 : 整数 = 102
	@静态
	常量 智力 : 整数 = 103
	@静态
	常量 魅力 : 整数 = 104
	@静态
	常量 物伤 : 整数 = 105
	@静态
	常量 法伤 : 整数 = 106
	@静态
	常量 物穿 : 整数 = 107
	@静态
	常量 法穿 : 整数 = 108
	@静态
	常量 物抗 : 整数 = 109
	@静态
	常量 法抗 : 整数 = 110
	@静态
	常量 爆率 : 整数 = 111
	@静态
	常量 爆伤 : 整数 = 112
	@静态
	常量 幸运 : 整数 = 113
	@静态
	常量 行动 : 整数 = 114
	@静态
	常量 种族 : 整数 = 115
	@静态
	常量 饱食 : 整数 = 116
	@静态
	常量 善恶 : 整数 = 117
	@静态
	常量 自私 : 整数 = 118
	@静态
	常量 贪婪 : 整数 = 119
	@静态
	常量 固执 : 整数 = 120
	@静态
	常量 勇气 : 整数 = 121
	@静态
	常量 懒惰 : 整数 = 122
	@静态
	常量 洁净 : 整数 = 123
	@静态
	常量 愤怒 : 整数 = 124
	@静态
	常量 敏捷 : 整数 = 135
结束 类

@静态
类 职业类型
	@静态
	常量 无职 : 整数 = 0
	@静态
	常量 战士 : 整数 = 1
	@静态
	常量 剑士 : 整数 = 2
	@静态
	常量 法师 : 整数 = 3
	@静态
	常量 弓手 : 整数 = 4
	@静态
	常量 牧师 : 整数 = 5
	@静态
	常量 刺客 : 整数 = 6
结束 类

@静态
类 装备类型
	@静态
	常量 拳头 : 整数 = 99
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

类 性格tag
	常量 嫉恶如仇 : 整数 = 10
	常量 善良 : 整数 = 11
	常量 坚定 : 整数 = 12
	常量 自私 : 整数 = 13
	常量 邪恶 : 整数 = 14
	常量 摇摆不定 : 整数 = 15
	常量 无私 : 整数 = 16
	常量 冷漠 : 整数 = 17
	常量 热心 : 整数 = 18
	常量 忠诚 : 整数 = 19
	常量 愚笨 : 整数 = 20
	常量 胆小 : 整数 = 21
	常量 聪慧 : 整数 = 22
	常量 社交达人 : 整数 = 23
	常量 社恐 : 整数 = 24
	常量 懒虫 : 整数 = 25
	常量 马虎 : 整数 = 26
结束 类

类 角色行为id
	常量 攻击目标 : 整数 = 200
	常量 遭到攻击 : 整数 = 201
	常量 被治疗 : 整数 = 202
	常量 被治愈 : 整数 = 203
	常量 使用攻击技能 : 整数 = 204
	常量 使用防御技能 : 整数 = 205
	常量 使用辅助技能 : 整数 = 206
	常量 使用治疗技能 : 整数 = 207
结束 类

@静态
类 状态码
	@静态
	常量 成功 : 整数 = 200
	@静态
	常量 失败 : 整数 = 300
结束 类

@全局类
类 种族标签
	@静态
	常量 人族 : 整数 = 0
	@静态
	常量 兽族 : 整数 = 1
	@静态
	常量 妖族 : 整数 = 2
	@静态
	常量 魔族 : 整数 = 3
	@静态
	常量 神族 : 整数 = 4
	@静态
	常量 元素 : 整数 = 5
结束 类

@全局类
类 tag
	常量 玩家 : 整数 = 500
	常量 npc : 整数 = 501
	常量 敌对目标 : 整数 = 502
	常量 友方目标 : 整数 = 503
	常量 boss : 整数 = 504
结束 类