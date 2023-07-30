//
//  HHSlipSliderView.m
//  HierHand
//
//  Created by hiersoan on 2023/7/27.
//

#import "HHSlipSliderView.h"

static HHSlipSliderView *staticSlipSiderView = nil;

@interface HHSlipSliderView()

@property(nonatomic) UIView *grayMask;

@property(nonatomic) UIView *slipMenu;

@end

@implementation HHSlipSliderView

- (id)init {
    self = [super init];
    if (self) {
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        
        // 设置主view的frame，不然tapGesture不起作用
        self.frame = CGRectMake(0, 0, screenSize.width, screenSize.height);
        
        // 灰色蒙版
        _grayMask = [[UIView alloc] init];
        _grayMask.frame = CGRectMake(0, 0, screenSize.width, screenSize.height);
        _grayMask.alpha = 0.f;
        _grayMask.backgroundColor = [UIColor grayColor];
        [self addSubview:_grayMask];
        
        // 左滑菜单
        _slipMenu = [[UIView alloc] init];
        _slipMenu.frame = CGRectMake(-0.75 * screenSize.width, 0, -0.75 * screenSize.width, screenSize.height);
        _slipMenu.backgroundColor = [UIColor whiteColor];
        [self addSubview:_slipMenu];
        
        // 添加点击手势识别
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] init];
        [tapGesture addTarget:self action:@selector(playHideAnimation)];
        [_grayMask addGestureRecognizer:tapGesture];
        
        // 菜单初始化
    }
    return self;
}

#pragma mark - public methods
+ (void)showSlipMenu {
    staticSlipSiderView = [[HHSlipSliderView alloc] init];
    [staticSlipSiderView playShowAnimation];
}

#pragma mark - private methods
- (void)playShowAnimation {
    [[[UIApplication sharedApplication] keyWindow] addSubview:staticSlipSiderView];
    
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            // 显现侧滑view
            CGRect temp = weakSelf.slipMenu.frame;
            temp.origin = CGPointMake(0, 0);
            weakSelf.slipMenu.frame = temp;
            
            // 灰色蒙版加深
            weakSelf.grayMask.alpha = 0.6f;
        } completion:^(BOOL finish){
            
        }];
    });
}

- (void)playHideAnimation {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            // 隐藏侧滑view
            CGRect temp = weakSelf.slipMenu.frame;
            temp.origin = CGPointMake(-0.75 * [[UIScreen mainScreen] bounds].size.width, 0);
            weakSelf.slipMenu.frame = temp;
            
            // 灰色蒙版恢复
            weakSelf.grayMask.alpha = 0.f;
        } completion:^(BOOL finish){
            if (finish) {
                [staticSlipSiderView removeFromSuperview];
                staticSlipSiderView = nil;
            }
        }];
    });
}
@end
