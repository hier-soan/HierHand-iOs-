//
//  HHHomeViewController.h
//  HierHand
//
//  Created by hiersoan on 2023/7/21.
//

#import <UIKit/UIKit.h>
#import "HHBaseViewController.h"
#import "HHUserManager.h"
#import "HHFlowTightlyLayout.h"
#import "HHSlipSliderController.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, HHNavBarState) {
    HHNavFollowButtonClick,     // 关注
    HHNavFoundButtonClick,
    HHNavCityButtonClick
};

@interface HHHomeViewController : HHBaseViewController <UICollectionViewDelegate, UICollectionViewDataSource, HHFlowTightlyLayouDelegate,  HHSlipSliderViewDelegate>

@end

NS_ASSUME_NONNULL_END
