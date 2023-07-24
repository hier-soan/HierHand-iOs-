//
//  HHUserManager.m
//  HierHand
//
//  Created by hiersoan on 2023/7/23.
//

#import "HHUserManager.h"
#import "HHUserInfo.h"

@interface HHUserManager() {
    NSMutableArray *userFollowArray;
    NSMutableArray *userSameCityArray;
    NSMutableArray *userFoundArray;
}

@property(nonatomic, strong, readwrite)NSMutableArray *userInfoArray;

@end

@implementation HHUserManager

- (id)initWithRandomUser {
    self = [super init];
    if (self) {
        _userInfoArray = [[NSMutableArray alloc] init];
        userFollowArray = [[NSMutableArray alloc] init];
        userSameCityArray = [[NSMutableArray alloc] init];
        userFoundArray = [[NSMutableArray alloc] init];
        
        NSString *charactors = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        NSUInteger length = 8;
        
        for (int i = 0; i < 100; i++) {
            HHUserInfo *userInfo = [[HHUserInfo alloc] init];
            NSMutableString *name = [NSMutableString stringWithCapacity:length];
            for (int j = 0; j < length; j++) {
                NSUInteger random = arc4random_uniform((uint32_t)[charactors length]);
                [name appendFormat:@"%c", [charactors characterAtIndex:random]];
            }
            userInfo.isFollow = arc4random_uniform(2) - 1;
            userInfo.isSameCity = arc4random_uniform(2) - 1;
            
            // 为什么这里非要mutableCopy
            userInfo.userName = [userInfo.userName mutableCopy];
            [userInfo.userName appendString:name];
            
            [_userInfoArray addObject:userInfo];
            
            if (userInfo.isFollow == YES) {
                [userFollowArray addObject:userInfo];
            }
            if (userInfo.isSameCity == YES) {
                [userSameCityArray addObject:userInfo];
            }
            if (!userInfo.isSameCity && !userInfo.isFollow) {
                [userFoundArray addObject:userInfo];
            }
        }
        
    }
    return self;
}

- (NSArray *)userInfoArray {
    return _userInfoArray;
}

- (NSUInteger)followCount {
    NSUInteger count = 0;
    for (int i = 0; i < [_userInfoArray count]; i++) {
        HHUserInfo *temp = _userInfoArray[i];
        if (temp.isFollow == YES) {
            count++;
        }
    }
    return count;
}

- (NSUInteger)sameCityCount {
    NSUInteger count = 0;
    for (int i = 0; i < [_userInfoArray count]; i++) {
        HHUserInfo *temp = _userInfoArray[i];
        if (temp.isSameCity == YES) {
            count++;
        }
    }
    return count;
}

- (NSArray *)followUser {
    return userFollowArray;
}

- (NSArray *)foundUser {
    return userFoundArray;
}

- (NSArray *)sameCityUser {
    return userSameCityArray;
}

@end
