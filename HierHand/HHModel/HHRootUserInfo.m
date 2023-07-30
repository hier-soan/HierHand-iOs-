//
//  HHRootUserInfo.m
//  HierHand
//
//  Created by hiersoan on 2023/7/26.
//

#import "HHRootUserInfo.h"

@implementation HHRootUserInfo

// 初始化本机用户
- (id)init {
    self = [super init];
    if (self) {
        self.userName = [@"Hier_Soan" mutableCopy];
        self.userIconImageName = @"avatar.jpg";
        self.cityTag = 1;
        self.typeTag = 1;
        self.interestTag = 1;
    }
    return self;
}

+ (instancetype)shareRootUser {
    static HHRootUserInfo *rootUser;
    dispatch_once_t token;
    dispatch_once(&token, ^{
        rootUser = [[HHRootUserInfo alloc] init];
    });
    return rootUser;
}

@end
