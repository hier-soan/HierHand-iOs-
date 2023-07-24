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
@property(nonatomic) BOOL isFollow;
@property(nonatomic) BOOL isSameCity;

@end

NS_ASSUME_NONNULL_END
