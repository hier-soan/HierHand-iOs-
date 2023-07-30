//
//  HHBaseAvatarElement.h
//  HierHand
//
//  Created by hiersoan on 2023/7/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HHBaseAvatarElementDelegate

- (void)avatarDidTap;

@end


@interface HHBaseAvatarElement : UIView

@property(nonatomic, strong) UIImageView *avatarView;

@property(nonatomic, weak) id<HHBaseAvatarElementDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
