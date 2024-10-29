类 数据管理器
	变量 ccq : 文本到文本哈希表
	方法 初始化(存档名称 : 文本 = "new test")
		ccq.添加项目(路径定义.根路径,取存储卡路径() + "/CrowRoam/re/" + 存档名称 + "/")
		ccq.添加项目(路径定义.图片路径,ccq.取项目("根路径") + "image/")
		ccq.添加项目(路径定义.角色路径,ccq.取项目("根路径") + "role/")
		ccq.添加项目(路径定义.地图路径,ccq.取项目("根路径") + "map/")
		ccq.添加项目(路径定义.技能路径,ccq.取项目("根路径") + "skill/")
		ccq.添加项目(路径定义.道具路径,ccq.取项目("根路径") + "prop/")
		ccq.添加项目(路径定义.建筑路径,ccq.取项目("根路径") + "unit/")
		@code
		for (String key : #ccq.keySet()) {
			try {
				java.io.File directory = new java.io.File(#ccq.get(key));
				if (directory.exists() && directory.isDirectory()) {
				} else {
					if (directory.mkdirs()) {
					} else {
						#错误("初始化失败，路径：" + directory.getPath() + "创建失败!");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		@end
	结束 方法
	方法 取目录路径(目录名 : 文本) : 文本
		返回 ccq.取项目(目录名)
	结束 方法
	定义事件 错误(内容 : 文本)
结束 类

@静态
类 路径定义
	@静态
	常量 根路径 : 文本 = "根路径"
	@静态
	常量 图片路径 : 文本 = "图片资源"
	@静态
	常量 角色路径 : 文本 = "角色资源"
	@静态
	常量 地图路径 : 文本 = "地图资源"
	@静态
	常量 技能路径 : 文本 = "技能资源"
	@静态
	常量 道具路径 : 文本 = "道具资源"
	@静态
	常量 建筑路径 : 文本 = "建筑资源"
结束 类