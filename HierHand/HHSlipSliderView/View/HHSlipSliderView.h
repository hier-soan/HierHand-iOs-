//
//  HHSlipSliderView.h
//  HierHand
//
//  Created by hiersoan on 2023/7/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class HHSlipSliderView;

@protocol HHSlipSliderViewDelegate

- (void)slipSliderViewDidDisappear;

@end

@interface HHSlipSliderView : UIView

@property(nonatomic) UICollectionView *collectionView;

@property(nonatomic) id<HHSlipSliderViewDelegate> delegate;

- (void)showSlipMenu;

@end

NS_ASSUME_NONNULL_END
