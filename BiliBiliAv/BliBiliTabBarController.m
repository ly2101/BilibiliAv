//
//  BliBiliTabBarController.m
//  BiliBiliAv
//
//  Created by 邦泰联合 on 16/2/18.
//  Copyright © 2016年 hu yagang. All rights reserved.
//

#import "BliBiliTabBarController.h"
#import "HomeController.h"
#import "AttentionController.h"
#import "FindController.h"
#import "MineController.h"
#import "BangumiPlayerController.h"
#import "UIImage+HYGColor.h"

@interface BliBiliTabBarController ()
@property (nonatomic,copy) NSMutableArray * BilibiliViewControllers;
@end

@implementation BliBiliTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = kStyleColor;
    [self createViewControllers];
}

-(void)createViewControllers
{
    HomeController * main = [[HomeController alloc] init];
    [self addViewControllersWithController:main title:@"首页" nomalIamge:[[UIImage imageNamed:@"home_home_tab~iphone"] imageWithColor:[UIColor grayColor]] selectedImage:[[UIImage imageNamed:@"home_home_tab_s~iphone"] imageWithColor:kStyleColor]];
    
    AttentionController * live = [[AttentionController alloc] init];
    [self addViewControllersWithController:live title:@"关注" nomalIamge:[[UIImage imageNamed:@"home_attention_tab~iphone"] imageWithColor:[UIColor grayColor]] selectedImage:[[UIImage imageNamed:@"home_attention_tab_s~iphone"] imageWithColor:kStyleColor]];
    
    FindController * activity = [[FindController alloc] init];
    [self addViewControllersWithController:activity title:@"发现" nomalIamge:[[UIImage imageNamed:@"home_discovery_tab~iphone"] imageWithColor:[UIColor grayColor]] selectedImage:[[UIImage imageNamed:@"home_discovery_tab_s~iphone"] imageWithColor:kStyleColor]];
    
    MineController * mine = [[MineController alloc] init];
    [self addViewControllersWithController:mine title:@"我的" nomalIamge:[[UIImage imageNamed:@"home_mine_tab~iphone"] imageWithColor:[UIColor grayColor]] selectedImage:[[UIImage imageNamed:@"home_mine_tab_s~iphone"] imageWithColor:kStyleColor]];
    
    self.viewControllers = self.BilibiliViewControllers;
}

-(void)addViewControllersWithController:(UIViewController *)controller title:(NSString *)title nomalIamge:(UIImage *)nomalImage selectedImage:(UIImage *)selectedImage
{
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:controller];
    nav.title = title;
    //[nav.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    nav.tabBarItem.image = [nomalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.BilibiliViewControllers addObject:nav];
}

-(NSMutableArray *)BilibiliViewControllers
{
    if (!_BilibiliViewControllers) {
        _BilibiliViewControllers = [NSMutableArray array];
    }
    return _BilibiliViewControllers;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return toInterfaceOrientation != UIDeviceOrientationPortraitUpsideDown;
}

- (BOOL)shouldAutorotate
{
    UINavigationController * nav = self.selectedViewController;
    UIViewController * vc = nav.topViewController;
    if ([vc isKindOfClass:[BangumiPlayerController class]]) { // 如果是这个 vc 则支持自动旋转
        return YES;
    }
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
