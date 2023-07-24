//
//  HHFlowTightlyLayout.h
//  HierHand
//
//  Created by hiersoan on 2023/7/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



@protocol HHFlowTightlyLayouDelegate

@optional

// problem
- (CGFloat)HeightForItemWithIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)width;

@end

typedef NS_ENUM(NSInteger, HHNavBarState);

@interface HHFlowTightlyLayout : UICollectionViewLayout

@property(nonatomic, weak) id<HHFlowTightlyLayouDelegate> delegate;

@property(nonatomic) NSUInteger numberOfFollowItems;
@property(nonatomic) NSUInteger numberOfFoundItems;
@property(nonatomic) NSUInteger numberOfSameCityItems;

@property(nonatomic) CGFloat itemWidth;

@property(nonatomic) HHNavBarState navBarState;

@end

NS_ASSUME_NONNULL_END
