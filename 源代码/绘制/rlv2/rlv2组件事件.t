@指代类("android.view.MotionEvent")
类 rlv2触摸事件 : 输入事件
结束 类

@指代类("android.view.KeyEvent")
类 rlv2按键事件 : 输入事件
	属性读 动作() : 按键动作
		code return #this.getAction();
	结束 属性
	属性读 按键代码() : 整数
		code return #this.getKeyCode();
	结束 属性
结束 类

类 rlv2组件生命周期管理
	定义事件 即将创建()
	定义事件 创建完毕()
	定义事件 被销毁()
结束 类