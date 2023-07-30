//
//  HHUserInfo.h
//  HierHand
//
//  Created by hiersoan on 2023/7/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHUserInfo : NSObject

@property(nonatomic) NSMutableString *userName;

@property(nonatomic, copy) NSString *userIconImageName;

@property(nonatomic) NSUInteger height;

@property(nonatomic) NSUInteger cityTag;

// 用户所属品类
@property(nonatomic) NSUInteger typeTag;

// 用户感兴趣品类
@property(nonatomic) NSUInteger interestTag;

@property(nonatomic) NSMutableArray<NSString *> *workIdentifications;

@property(nonatomic) NSUInteger fansNum;

@property(nonatomic) NSUInteger followNum;

@property(nonatomic) NSUInteger getLikeNum;


@property(nonatomic, strong) NSMutableSet<NSString *> *toFollows;

@property(nonatomic, strong) NSMutableSet<NSString *> *fans;

- (void)addToFollows:(NSString *)userName;

- (void)removeToFollows:(NSString *)userName;

- (void)addFans:(NSString *)userName;

- (void)removeFans:(NSString *)userName;

@end

NS_ASSUME_NONNULL_END
