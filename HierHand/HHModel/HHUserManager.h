//
//  HHUserManager.h
//  HierHand
//
//  Created by hiersoan on 2023/7/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHUserManager : NSObject

- (NSArray *)userInfoArray;

- (id)initWithRandomUser;

- (NSUInteger)followCount;

- (NSUInteger)sameCityCount;

- (NSArray *)followUser;

- (NSArray *)foundUser;

- (NSArray *)sameCityUser;

@end

NS_ASSUME_NONNULL_END
