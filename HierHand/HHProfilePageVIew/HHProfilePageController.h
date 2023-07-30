//
//  HHFollowPageController.h
//  HierHand
//
//  Created by hiersoan on 2023/7/26.
//

#import <UIKit/UIKit.h>
#import "HHUserInfo.h"
#import "HHProfileFlowElement.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHProfilePageController : UIViewController

// use strong or copy ?
@property(nonatomic, strong) HHUserInfo *userInfo;

@end

NS_ASSUME_NONNULL_END
