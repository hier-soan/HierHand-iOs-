//
//  HHMeController.m
//  HierHand
//
//  Created by hiersoan on 2023/7/21.
//

#import "HHMeController.h"

@interface HHMeController ()

@end

@implementation HHMeController

- (id)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"我";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blueColor]];
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
