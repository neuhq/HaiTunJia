//
//  AppDelegate.m
//  HaiTunJia
//
//  Created by 李哲 on 15/9/26.
//  Copyright © 2015年 李哲. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "LeveyTabBarController.h"
#import "SearchController.h"
#import "UpLoadPhotoController.h"
#import "MessageController.h"
#import "UserController.h"
@interface AppDelegate ()

@property(nonatomic,strong) NSMutableArray *navigationArray;

@property(nonatomic,strong) LeveyTabBarController *leveyTabBarController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // 1.创建window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor blackColor];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self setRootNavigationController];
    NSArray *imageArr = [self setTabBarImage];
    _leveyTabBarController = [[LeveyTabBarController alloc] initWithViewControllers:self.navigationArray imageArray:imageArr];
    _leveyTabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    [_leveyTabBarController setTabBarTransparent:YES];
    [self.window addSubview:_leveyTabBarController.view];
    self.window.rootViewController = _leveyTabBarController;
    [self.window makeKeyAndVisible];

    return YES;
}

-(NSArray *)setTabBarImage
{
    NSMutableDictionary *imgDic1 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic1 setObject:[UIImage imageNamed:@"tab_home_normal"] forKey:@"Default"];
    [imgDic1 setObject:[UIImage imageNamed:@"tab_home_active"] forKey:@"Highlighted"];
    [imgDic1 setObject:[UIImage imageNamed:@"tab_home_active"] forKey:@"Seleted"];
    NSMutableDictionary *imgDic2 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic2 setObject:[UIImage imageNamed:@"tab_search_normal"] forKey:@"Default"];
    [imgDic2 setObject:[UIImage imageNamed:@"tab_search_active"] forKey:@"Highlighted"];
    [imgDic2 setObject:[UIImage imageNamed:@"tab_search_active"] forKey:@"Seleted"];
    NSMutableDictionary *imgDic3 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic3 setObject:[UIImage imageNamed:@"tab_camera_normal"] forKey:@"Default"];
    [imgDic3 setObject:[UIImage imageNamed:@"tab_camera_normal"] forKey:@"Highlighted"];
    [imgDic3 setObject:[UIImage imageNamed:@"tab_camera_normal"] forKey:@"Seleted"];
    NSMutableDictionary *imgDic4 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic4 setObject:[UIImage imageNamed:@"tab_message_normal"] forKey:@"Default"];
    [imgDic4 setObject:[UIImage imageNamed:@"tab_message_active"] forKey:@"Highlighted"];
    [imgDic4 setObject:[UIImage imageNamed:@"tab_message_active"] forKey:@"Seleted"];
    NSMutableDictionary *imgDic5 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic5 setObject:[UIImage imageNamed:@"tab_personal_normal"] forKey:@"Default"];
    [imgDic5 setObject:[UIImage imageNamed:@"tab_personal_active"] forKey:@"Highlighted"];
    [imgDic5 setObject:[UIImage imageNamed:@"tab_personal_active"] forKey:@"Seleted"];

    NSArray *array = [NSArray arrayWithObjects:imgDic1,imgDic2,imgDic3,imgDic4, imgDic5, nil];
    return array;
}
-(void)setRootNavigationController
{
    HomeViewController *home = [[HomeViewController alloc]init];
    SearchController *search = [[SearchController alloc]init];
    UpLoadPhotoController *upload = [[UpLoadPhotoController alloc]init];
    MessageController *message = [[MessageController alloc]init];
    UserController *user = [[UserController alloc]init];
    NSArray *array = [NSArray arrayWithObjects:home,search,upload,message,user, nil];
    if(!self.navigationArray)
        self.navigationArray = [[NSMutableArray alloc]init];
    for(UIViewController *vc in array)
    {
        UINavigationController *navigation = [[UINavigationController alloc]initWithRootViewController:vc];
        [self.navigationArray addObject:navigation];
    }
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
