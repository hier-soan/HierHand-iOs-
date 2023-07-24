//
//  HHBaseWorks.h
//  HierHand
//
//  Created by hiersoan on 2023/7/23.
//

#import <Foundation/Foundation.h>
#import "HHUserInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHBaseWorks : NSObject

@property(nonatomic, strong) HHUserInfo *userInfo;

- (id)initWithUserInfo:(HHUserInfo *)userInfo;

@end

NS_ASSUME_NONNULL_END
