# 3D-touch-Home-screen-quick-actions

     3D touch-Home Screen Quick Actions的简单封装

    1.将BTForceTouch.h，BTForceTouch.m拖入工程中；
    2. AppDelegate.h中导入头文件BTForceTouch.h，并实现其代理方法：(复制即可)
```Objective-C
 - (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
 {
[[BTForceTouch sharedInstance] handlePerformActionForShortcutItem:shortcutItem];
 }
```
    3.在工程中创建并初始化对象，实现其点击事件，示例如下：（或下载demo查看）
```Objective-C
     [[BTForceTouch sharedInstance] initWithTitleArray:@[@"11111",@"22222"] subTitleArray:@[@"11111",@"22222",@"22222"] iconArray:@[@"Employee-plan_btn_se@2x",@"Employee-plan_btn_se@2x",@"Employee-plan_btn_se@2x"]];

     [BTForceTouch sharedInstance].performedIndex = ^(NSInteger index) {
        if (index == 0) {
            self.view.backgroundColor = [UIColor yellowColor];
        }else{
            self.view.backgroundColor = [UIColor orangeColor];
        }
    };
```
