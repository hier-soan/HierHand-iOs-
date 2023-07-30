//
//  HHUserManager.m
//  HierHand
//
//  Created by hiersoan on 2023/7/23.
//

#import "HHUserManager.h"

@interface HHUserManager() {
    NSMutableArray *userFollowArray;
    NSMutableArray *userSameCityArray;
    NSMutableArray *userFoundArray;
}

// 用于类型查询拆分
@property(nonatomic, strong) NSMutableArray<HHUserInfo *> *userInfoArray;

// 用于根据昵称寻找用户信息
@property(nonatomic, strong) NSMutableDictionary<NSString *, HHUserInfo *> *userInfoDictionary;

// 本机用户
@property(nonatomic, strong) HHRootUserInfo *rootUser;

@end

@implementation HHUserManager

+ (instancetype)sharedUserManager {
    static HHUserManager *userManager;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        userManager = [[HHUserManager alloc] initWithRandomUserAndRandomWorksAndRandCity];
    });
    return userManager;
}

- (id)initWithRandomUserAndRandomWorksAndRandCity {
    self = [self initWithRandomUserAndRandomWorks];
    if (self) {
        NSUInteger num = [_userInfoArray count];
        for (int i = 0; i < num; i++) {
            HHUserInfo *user = _userInfoArray[i];
            user.cityTag = arc4random_uniform(3);
            
            user.typeTag = arc4random_uniform(3);
        }
        
        [self refreshData];
        
        // is working
        //        for (int i = 0; i < num; i++) {
        //            HHUserInfo *user = _userInfoArray[i];
        //            NSLog(@"user = %d, tag = %lu", i, user.cityTag);
        //        }
    }
    return self;
}

- (id)initWithRandomUserAndRandomWorks {
    self = [self initWithRandomUser];
    if (self) {
        NSUInteger num = [_userInfoArray count];
        NSString *charactors = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        NSUInteger length = 3;
        
        for (int i = 0; i < num; i++) {
            NSUInteger worksNum = arc4random_uniform(40) + 10;
            for (int j = 0; j < worksNum; j++) {
                NSMutableString *worksId = [[NSMutableString alloc] initWithString:@"vw-"];
                for (int k = 0; k < length; k++) {
                    NSUInteger random = arc4random_uniform((uint32_t)[charactors length]);
                    [worksId appendFormat:@"%c", [charactors characterAtIndex:random]];
                }
                HHUserInfo *user = _userInfoArray[i];
                [user.workIdentifications addObject:worksId];
            }
        }
        
         // is working
//                HHUserInfo *user = userFollowArray[2];
//                for (int i = 0; i < [user.workIdentifications count]; i++) {
//                    NSLog(@"worksNum = %d, id = %@", i, user.workIdentifications[i]);
//                }
    }
    return self;
}

- (id)initWithRandomUser {
    self = [self init];
    if (self) {
        _userInfoArray = [[NSMutableArray alloc] init];
        _userInfoDictionary = [[NSMutableDictionary alloc] init];
        
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
            
            // 为什么这里非要mutableCopy
            userInfo.userName = [userInfo.userName mutableCopy];
            [userInfo.userName appendString:name];
            
            [_userInfoArray addObject:userInfo];
            // problem: copy 问题
            [_userInfoDictionary setObject:userInfo forKey:userInfo.userName];
        }
        
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        _rootUser = [HHRootUserInfo shareRootUser];
    }
    return self;
}

#pragma mark - public methods
+ (NSArray *)userInfoArray {
    return [HHUserManager sharedUserManager].userInfoArray;
}

- (NSUInteger)followCount {
    return [userFollowArray count];
}

- (NSUInteger)sameCityCount {
    return [userSameCityArray count];
}

- (NSUInteger)foundCount {
    return [userFoundArray count];
}

- (HHUserInfo *)UserForName:(NSString *)name {
    return [_userInfoDictionary objectForKey:name];
}

#pragma mark - private methods
- (void)refreshData {
    [self refreshFollowUser];
    [self refreshFoundUser];
    [self refreshSameCityUser];
}

- (void)refreshFollowUser {
    userFollowArray = [[NSMutableArray alloc] init];
    for (NSString *follow in _rootUser.toFollows) {
        [userFollowArray addObject:[_userInfoDictionary objectForKey:follow]];
    }
}

- (void)refreshSameCityUser {
    userSameCityArray = [[NSMutableArray alloc] init];
    for (HHUserInfo *user in _userInfoArray) {
        if (user.cityTag == _rootUser.cityTag) {
            [userSameCityArray addObject:user];
        }
    }
}

- (void)refreshFoundUser {
    userFoundArray = [[NSMutableArray alloc] init];
    for (HHUserInfo *user in _userInfoArray) {
        if (user.typeTag == _rootUser.interestTag) {
            [userFoundArray addObject:user];
        }
    }
}

- (NSArray *)getToFollowUser {
    [self refreshFollowUser];
    return userFollowArray;
}

- (NSArray *)getSameCityUser {
    [self refreshSameCityUser];
    return userSameCityArray;
}

- (NSArray *)getFoundUser {
    [self refreshFoundUser];
    return userFoundArray;
}

@end
