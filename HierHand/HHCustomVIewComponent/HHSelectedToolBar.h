//
//  HHSelectedToolBar.h
//  HierHand
//
//  Created by hiersoan on 2023/7/24.
//

#import <UIKit/UIKit.h>
#import "HHSelectedAvatarElement.h"
#import "HHToolBarElement.h"

@protocol HHToolBarViewDelegate

- (void)toolBarElementDidTap:( HHToolBarElement * _Nonnull )element atRow:(NSUInteger) row;

@end

NS_ASSUME_NONNULL_BEGIN

@interface HHSelectedToolBar : UIView <HHToolBarElementDelegate>

@property(nonatomic, strong) HHSelectedAvatarElement *avatar;

@property(nonatomic, weak) id<HHToolBarViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
