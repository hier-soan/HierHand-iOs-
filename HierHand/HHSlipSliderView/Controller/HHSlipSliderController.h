//
//  HHSlipSliderMenu.h
//  HierHand
//
//  Created by hiersoan on 2023/7/30.
//

#import <UIKit/UIKit.h>
#import "HHSlipSliderView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHSlipSliderController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(nonatomic) void(^hideSlipSliderMenuFinish)(void);

@property(nonatomic) HHSlipSliderView *slipSliderView;

- (void)showSlipMenu;

@end

NS_ASSUME_NONNULL_END
