//
//  HHSlipSliderCollectionLayout.h
//  HierHand
//
//  Created by hiersoan on 2023/7/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHSlipSliderCollectionLayout : UICollectionViewLayout

@property(nonatomic) NSUInteger viewWidth;

@property(nonatomic) NSUInteger numberOfCol;

@property(nonatomic) NSMutableArray *numberOfItemsInSections;

- (NSMutableArray *)numberOfItemsInSections;

@end

NS_ASSUME_NONNULL_END
