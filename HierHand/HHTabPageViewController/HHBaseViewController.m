//
//  HHBaseViewController.m
//  HierHand
//
//  Created by hiersoan on 2023/7/21.
//

#import "HHBaseViewController.h"

@interface HHBaseViewController ()

@end

@implementation HHBaseViewController

- (id)init {
    self = [super init];
    if (self) {
        _hTabBarItem = [[HHTabBarItem alloc] init];
        
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"default" image:nil tag:0];
        [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:20], NSFontAttributeName, nil] forState:UIControlStateNormal];
        [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:20], NSFontAttributeName, nil] forState:UIControlStateSelected];
        self.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -10);
    }
    return self;
}

- (void)changeInSelectedView {
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:20], NSFontAttributeName, nil] forState:UIControlStateNormal];
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:20], NSFontAttributeName, nil] forState:UIControlStateSelected];
    [self.tabBarController.tabBar setBackgroundColor:[UIColor blackColor]];
}

- (void)changeInOtherView {
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:20], NSFontAttributeName, nil] forState:UIControlStateNormal];
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:20], NSFontAttributeName, nil] forState:UIControlStateSelected];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor whiteColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
