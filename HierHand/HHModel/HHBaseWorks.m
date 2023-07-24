//
//  HHBaseWorks.m
//  HierHand
//
//  Created by hiersoan on 2023/7/23.
//

#import "HHBaseWorks.h"

@implementation HHBaseWorks

- (id)initWithUserInfo:(HHUserInfo *)userInfo {
    self = [super init];
    if (self) {
        _userInfo = userInfo;
    }
    return self;
}

@end
