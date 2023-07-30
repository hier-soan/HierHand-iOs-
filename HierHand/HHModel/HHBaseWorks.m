//
//  HHBaseWorks.m
//  HierHand
//
//  Created by hiersoan on 2023/7/23.
//

#import "HHBaseWorks.h"

@implementation HHBaseWorks

- (id)initWithRandomContent {
    self = [self init];
    if (self) {
        _owner = [[HHUserInfo alloc] init];
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        _getLikeNum = 0;
        _commentNum = 0;
        _collectNum = 0;
        _shareNum = 0;
    }
    return self;
}

@end
