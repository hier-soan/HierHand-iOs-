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

@interface HHTabBarBaseController()

// 首页
@property(nonatomic) HHHomeViewController *homeViewController;

// 精选
@property(nonatomic) HHSelectedController *selectedController;

// 消息
@property(nonatomic) HHMessageController *messageController;

// 我
@property(nonatomic) HHMeController *meController;


@property(nonatomic) UINavigationController *homeNavController;

@end

@implementation HHTabBarBaseController

- (id)init {
    self = [super init];
    if (self) {
        
        _homeViewController = [[HHHomeViewController alloc] init];
        _selectedController = [[HHSelectedController alloc] init];
        _messageController = [[HHMessageController alloc] init];
        _meController = [[HHMeController alloc] init];
        
        _homeNavController = [[UINavigationController alloc] initWithRootViewController:_homeViewController];
        self.tabBar.translucent = NO;
        _homeNavController.tabBarItem = _homeViewController.tabBarItem;
        
        [self setViewControllers:@[_homeNavController, _selectedController, _messageController, _meController]];
        [self.tabBar setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

@end
