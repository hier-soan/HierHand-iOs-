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

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, HHNavBarState) {
    HHNavFollowButtonClick,
    HHNavFoundButtonClick,
    HHNavCityButtonClick
};

@interface HHHomeViewController : HHBaseViewController <UICollectionViewDelegate, UICollectionViewDataSource, HHFlowTightlyLayouDelegate>

@end

NS_ASSUME_NONNULL_END
