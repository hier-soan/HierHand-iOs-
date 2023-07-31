//
//  HHSlipSilderItem.h
//  HierHand
//
//  Created by hiersoan on 2023/7/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHSlipSliderItem : UICollectionViewCell

// 后续优化
@property(nonatomic) void(^showDetailView)(void);

@end

NS_ASSUME_NONNULL_END
