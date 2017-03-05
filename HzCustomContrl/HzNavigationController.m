//
//  HzNavigationController.m
//  First
//
//  Created by nhz on 15/11/25.
//  Copyright © 2015年 nhz. All rights reserved.
//

#import "HzNavigationController.h"
#import <objc/runtime.h>
#import "UIColor+Extension.h"
#import "LYSingle.h"
#import "NHZ.h"

@interface HzNavigationController ()

@end

@implementation HzNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(void)initialize{
    [self setNavigationBarTheme];
    [self setNavigationItemTheme];
    
}

- (UIView *)overlay
{    return objc_getAssociatedObject(self, &overlayKey);
    
//    [[self.navigationBar  subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
//        if ([obj isKindOfClass:NSClassFromString(@"UINavigationItemView")]) {
//            obj.alpha = alpha;
//            *stop = YES;
//        }
//    }];
    
}
static char overlayKey;
- (void)setOverlay:(UIView *)overlay
{
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hz_setBackgroundColor:(UIColor *)backgroundColor
{    if (!self.overlay) {
        [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self.navigationBar setShadowImage:[UIImage new]];        // insert an overlay into the view hierarchy
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 64)];
        [self.navigationBar insertSubview:self.overlay atIndex:0];
    }
    self.overlay.backgroundColor = backgroundColor;
}
+ (void)setNavigationBarTheme{
    UINavigationBar * appearcance = [UINavigationBar appearance];
    NSMutableDictionary * textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18.5];
    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    [appearcance setTitleTextAttributes:textAttrs];
//    [appearcance setBackgroundColor:[UIColor blueColor]];
//    [appearcance setTintColor:[UIColor blueColor]];
    [appearcance setBarTintColor:[UIColor colorWithHexString:@"#2bc7c6"]];

}
+ (void)setNavigationItemTheme{
    UIBarButtonItem * appearcance = [UIBarButtonItem appearance];
    
    NSMutableDictionary * textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    [appearcance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary * highTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    highTextAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [appearcance setTitleTextAttributes:highTextAttrs forState:UIControlStateHighlighted];
    
    NSMutableDictionary * disableTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [appearcance setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count > 0) {
        
        UIButton *leftBtn = [[UIButton alloc] init];
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"fh"] forState:UIControlStateNormal];
        [leftBtn addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        leftBtn.frame = CGRectMake(0, 0,12, 17);
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
        
        // 不是栈底控制器, 需要添加左边和右边按钮
        // 1.设置左边按钮 viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"fh" highlightedImage:@"fh" target:self action:@selector(back)];
        // 2.设置右边按钮 viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_more" highlightedImage:@"navigationbar_more_highlighted" target:self action:@selector(more)];
        
        [[LYSingle sharedSingle].tabBarController hiddenTabBar];
    }
    
    [super pushViewController:viewController animated:animated];
    
}
-(void)leftButtonClick:(UIButton *)btn{
    [self popViewControllerAnimated:YES];
}


@end
