//
//  HHSlipSliderView.h
//  HierHand
//
//  Created by hiersoan on 2023/7/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHSlipSliderView : UIView

+ (void)showSlipMenu;

- (void)setCollectionViewDelegate:(UIViewController<UICollectionViewDelegate, UICollectionViewDataSource> *)controller;

@end

NS_ASSUME_NONNULL_END
