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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
