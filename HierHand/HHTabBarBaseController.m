//
//  HHTabBarBaseController.m
//  HierHand
//
//  Created by hiersoan on 2023/7/21.
//

#import "HHTabBarBaseController.h"
#import "HHHomeViewController.h"
#import "HHSelectedController.h"
#import "HHMessageController.h"
#import "HHMeController.h"

@interface HHTabBarBaseController () {
    HHHomeViewController *homeViewController;
    HHSelectedController *selectedController;
    HHMessageController *messageController;
    HHMeController *meController;
    UINavigationController *test;
}

@end

@implementation HHTabBarBaseController

- (id)init {
    self = [super init];
    if (self) {
        
        homeViewController = [[HHHomeViewController alloc] init];
        selectedController = [[HHSelectedController alloc] init];
        messageController = [[HHMessageController alloc] init];
        meController = [[HHMeController alloc] init];
        
        test = [[UINavigationController alloc] initWithRootViewController:homeViewController];
        self.tabBar.translucent = NO;
        test.tabBarItem = homeViewController.tabBarItem;
        
        [self setViewControllers:@[test, selectedController, messageController, meController]];
        [self.tabBar setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
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
