//
//  HHBaseViewController.h
//  HierHand
//
//  Created by hiersoan on 2023/7/21.
//

#import <UIKit/UIKit.h>
#import "HHTabBarItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHBaseViewController : UIViewController

@property(nonatomic, strong) HHTabBarItem *hTabBarItem;

- (void)changeInSelectedView;

- (void)changeInOtherView;

@end

NS_ASSUME_NONNULL_END
