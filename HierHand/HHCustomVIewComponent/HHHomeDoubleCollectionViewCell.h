//
//  HHHomeDoubleCollectionViewCell.h
//  HierHand
//
//  Created by hiersoan on 2023/7/23.
//

#import <UIKit/UIKit.h>
#import "HHUserInfo.h"
#import "HHHomeViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHHomeDoubleCollectionViewCell : UICollectionViewCell

@property(nonatomic)NSInteger _height;

- (void)setCellStateUserInfo:(HHUserInfo *)userInfo;

- (void)setCellLayout;

- (void)setCellShowType:(HHNavBarState) state;

@end

NS_ASSUME_NONNULL_END
