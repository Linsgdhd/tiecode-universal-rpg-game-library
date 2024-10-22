类 数据管理器
	变量 ccq : 文本到文本哈希表
	方法 初始化(存档名称 : 文本 = "")
		ccq.添加项目("根路径",取存储卡路径() + "/CrowRoam/re/" + 存档名称)
		ccq.添加项目("图片资源",ccq.取项目("根路径") + "image/")
		ccq.添加项目("角色资源",ccq.取项目("根路径") + "role/")
		ccq.添加项目("地图资源",ccq.取项目("根路径") + "map/")
		ccq.添加项目("技能资源",ccq.取项目("根路径") + "skill/")
		ccq.添加项目("道具资源",ccq.取项目("根路径") + "prop/")
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
	方法 取目录(目录名 : 文本) : 文本
		返回 ccq.取项目(目录名)
	结束 方法
	方法 取场景() : 场景容器
		变量 temp : 场景容器
		返回 temp
	结束 方法
	方法 取角色() : 角色容器
		变量 temp : 角色容器
		返回 temp
	结束 方法
	方法 取位图() : 位图容器
		变量 temp : 位图容器
		返回 temp
	结束 方法
	定义事件 错误(内容 : 文本)
结束 类