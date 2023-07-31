//
//  HHSlipSliderView.m
//  HierHand
//
//  Created by hiersoan on 2023/7/27.
//

#import "HHSlipSliderView.h"
#import "HHSlipSliderCollectionLayout.h"

#define screenSize      [[UIScreen mainScreen] bounds].size

static HHSlipSliderView *staticSlipSiderView = nil;

@interface HHSlipSliderView()

@property(nonatomic) UIView *grayMask;

@property(nonatomic) UIView *slipMenu;

@property(nonatomic) UICollectionView *collectionView;

@end

@implementation HHSlipSliderView

- (id)init {
    self = [super init];
    if (self) {
        // 设置主view的frame，不然tapGesture不起作用
        self.frame = CGRectMake(0, 0, screenSize.width, screenSize.height);
        
        // 添加点击手势识别
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] init];
        [tapGesture addTarget:self action:@selector(playHideAnimation)];
        [_grayMask addGestureRecognizer:tapGesture];
    }
    return self;
}

#pragma mark - lazy load
// 灰色蒙版
- (UIView *)grayMask {
    if (!_grayMask) {
        _grayMask = [[UIView alloc] init];
        _grayMask.frame = CGRectMake(0, 0, screenSize.width, screenSize.height);
        _grayMask.alpha = 0.f;
        _grayMask.backgroundColor = [UIColor grayColor];
        [self addSubview:_grayMask];
    }
    return _grayMask;
}

// 左滑菜单
- (UIView *)slipMenu {
    if (!_slipMenu) {
        _slipMenu = [[UIView alloc] init];
        _slipMenu.frame = CGRectMake(-0.75 * screenSize.width, 0, -0.75 * screenSize.width, screenSize.height);
        _slipMenu.backgroundColor = [UIColor whiteColor];
        [self addSubview:_slipMenu];
    }
    return _slipMenu;
}

// 菜单collection view
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        HHSlipSliderCollectionLayout *layout = [[HHSlipSliderCollectionLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:layout];
        [self.slipMenu addSubview:_collectionView];
    }
    return _collectionView;
}

#pragma mark - public methods
+ (void)showSlipMenu {
    staticSlipSiderView = [[HHSlipSliderView alloc] init];
    [staticSlipSiderView playShowAnimation];
}

- (void)setCollectionViewDelegate:(UIViewController<UICollectionViewDelegate, UICollectionViewDataSource> *)controller {
    _collectionView.delegate = controller;
    _collectionView.dataSource = controller;
//           [_collectionView registerClass:[HHSlipSliderItem class] forCellWithReuseIdentifier:@"HHSlipSliderItem"];
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
