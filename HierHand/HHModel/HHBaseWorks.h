//
//  HHBaseWorks.h
//  HierHand
//
//  Created by hiersoan on 2023/7/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HHUserInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHBaseWorks : NSObject

@property(nonatomic) HHUserInfo *owner;

@property(nonatomic) NSString *identification;

@property(nonatomic) NSUInteger getLikeNum;

@property(nonatomic) NSUInteger commentNum;

@property(nonatomic) NSUInteger collectNum;

@property(nonatomic) NSUInteger shareNum;

@property(nonatomic) NSUInteger height;

// debug
@property(nonatomic) UIColor *backgroundColor;

- (id)initWithRandomContent;

@end

NS_ASSUME_NONNULL_END
