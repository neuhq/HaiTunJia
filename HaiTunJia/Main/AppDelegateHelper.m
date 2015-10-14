
#import "AppDelegateHelper.h"
#import "PhotoAlbumViewController.h"
#import "HotCategoryViewController.h"
#import "MessageIndexViewController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "HomeViewController.h"
#import "UserViewController.h"
@interface AppDelegateHelper ()

@end

@implementation AppDelegateHelper

+(NSArray *)setTabBarImage
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

+(NSMutableArray *)setRootNavigationController
{
    HomeViewController *home = [[HomeViewController alloc]init];
    HotCategoryViewController *hot = [[HotCategoryViewController alloc]init];
    PhotoAlbumViewController *photo = [PhotoAlbumViewController sharedManager];
    photo.isHidenLeftButton = YES;
    MessageIndexViewController *message = [[MessageIndexViewController alloc]init];
    UserViewController *user = [[UserViewController alloc]init];
    NSArray *array = [NSArray arrayWithObjects:home,hot,photo,message, user,nil];
    NSMutableArray *mutArray= [[NSMutableArray alloc]init];
    for(UIViewController *vc in array)
    {
        UINavigationController *navigation = [[UINavigationController alloc]initWithRootViewController:vc];
        navigation.fd_fullscreenPopGestureRecognizer.enabled = YES;
        [mutArray addObject:navigation];
    }
    return mutArray;
    
}

@end
