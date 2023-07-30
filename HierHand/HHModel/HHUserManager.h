//
//  HHUserManager.h
//  HierHand
//
//  Created by hiersoan on 2023/7/23.
//

#import <Foundation/Foundation.h>
#import "HHRootUserInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHUserManager : NSObject

+ (NSArray *)userInfoArray;

+ (instancetype)sharedUserManager;

- (id)initWithRandomUserAndRandomWorksAndRandCity;

- (id)initWithRandomUserAndRandomWorks;

- (id)initWithRandomUser;

- (NSUInteger)followCount;

- (NSUInteger)sameCityCount;

- (NSUInteger)foundCount;

- (HHUserInfo *)UserForName:(NSString *)name;

- (NSArray *)getToFollowUser;

- (NSArray *)getSameCityUser;

- (NSArray *)getFoundUser;

@end

NS_ASSUME_NONNULL_END
