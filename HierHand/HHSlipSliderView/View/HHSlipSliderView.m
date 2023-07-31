//
//  HHSlipSliderView.m
//  HierHand
//
//  Created by hiersoan on 2023/7/27.
//

#import "HHSlipSliderView.h"
#import "HHSlipSliderCollectionLayout.h"
#import "HHSlipSliderItem.h"

#define screenSize      [[UIScreen mainScreen] bounds].size

@interface HHSlipSliderView()

@property(nonatomic) UIView *grayMask;

@property(nonatomic) UIView *slipMenu;

@property(nonatomic) UITapGestureRecognizer *tapGesture;

@end

@implementation HHSlipSliderView

- (id)init {
    self = [super init];
    if (self) {
        // 设置主view的frame，不然tapGesture不起作用
        self.frame = CGRectMake(0, 0, screenSize.width, screenSize.height);
        
        // 灰色蒙版
        _grayMask = [[UIView alloc] init];
        _grayMask.frame = CGRectMake(0, 0, screenSize.width, screenSize.height);
        _grayMask.alpha = 0.f;
        _grayMask.backgroundColor = [UIColor blackColor];
        [self addSubview:_grayMask];
        
        // 左滑菜单
        _slipMenu = [[UIView alloc] init];
        _slipMenu.frame = CGRectMake(-0.75 * screenSize.width, 0, -0.75 * screenSize.width, screenSize.height);
        _slipMenu.backgroundColor = [UIColor whiteColor];
        [self addSubview:_slipMenu];
        
        // 菜单collection view
        HHSlipSliderCollectionLayout *layout = [[HHSlipSliderCollectionLayout alloc] init];
        layout.viewWidth = self.slipMenu.frame.size.width;
        layout.numberOfCol = 3;
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [array addObject:@(3)];
        [array addObject:@(7)];
        [array addObject:@(3)];
        layout.numberOfItemsInSections = array;
        
//        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        layout.minimumLineSpacing = 5;
//        layout.minimumInteritemSpacing = 5;
//        layout.itemSize = CGSizeMake(40, 40);
//        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.slipMenu.frame collectionViewLayout:layout];
        _collectionView.frame = self.slipMenu.frame;
        [self.slipMenu addSubview:_collectionView];
        [_collectionView registerClass:[HHSlipSliderItem class] forCellWithReuseIdentifier:@"HHSlipSliderItem"];
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        // 添加点击手势识别
        _tapGesture = [[UITapGestureRecognizer alloc] init];
        [_tapGesture addTarget:self action:@selector(playHideAnimation)];
        [_grayMask addGestureRecognizer:_tapGesture];
        
        NSLog(@"slips slider view init");
    }
    return self;
}

#pragma mark - lazy load


#pragma mark - public methods
- (void)showSlipMenu {
    [self playShowAnimation];
}

#pragma mark - private methods
- (void)playShowAnimation {
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            // 显现侧滑view
            CGRect temp = weakSelf.slipMenu.frame;
            temp.origin = CGPointMake(0, 0);
            weakSelf.slipMenu.frame = temp;
            weakSelf.collectionView.frame = temp;
            
            // 灰色蒙版加深
            weakSelf.grayMask.alpha = 0.8f;
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
            weakSelf.collectionView.frame = temp;
            
            // 灰色蒙版恢复
            weakSelf.grayMask.alpha = 0.f;
        } completion:^(BOOL finish){
            if (finish) {
                [weakSelf removeFromSuperview];
                [weakSelf.delegate slipSliderViewDidDisappear];
                NSLog(@"slips slider view destory");
            }
        }];
    });
}

@end
