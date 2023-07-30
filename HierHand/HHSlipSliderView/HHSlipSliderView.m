//
//  HHSlipSliderView.m
//  HierHand
//
//  Created by hiersoan on 2023/7/27.
//

#import "HHSlipSliderView.h"

@interface HHSlipSliderView()

@end

@implementation HHSlipSliderView

- (id)init {
    self = [super init];
    if (self) {
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        
        self.frame = CGRectMake(-0.75 * screenSize.width, 0, screenSize.width * 0.75, screenSize.height);
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 10.0;
        self.layer.masksToBounds  = YES;
        
        // 从左侧小窗返回
        UITapGestureRecognizer *tapGestureRecongizer = [[UITapGestureRecognizer alloc] init];
        [tapGestureRecongizer addTarget:self action:@selector(<#selector#>)];
    }
    return self;
}

@end
