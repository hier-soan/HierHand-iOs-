//
//  HHSelectedController.m
//  HierHand
//
//  Created by hiersoan on 2023/7/21.
//

#import "HHSelectedController.h"

@interface HHSelectedController () {
    HHSelectedToolBar *toolBar;
}
    
@end

@implementation HHSelectedController

- (id)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"精选";
        toolBar = [[HHSelectedToolBar alloc] init];
        CGRect tempFrame = toolBar.frame;
        tempFrame.origin.x = [[UIScreen mainScreen] bounds].size.width - toolBar.frame.size.width;
        tempFrame.origin.y = 300;
        toolBar.frame = tempFrame;
        [self.view addSubview:toolBar];
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view setBackgroundColor:[UIColor blackColor]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self changeInSelectedView];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self changeInOtherView];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}

@end
