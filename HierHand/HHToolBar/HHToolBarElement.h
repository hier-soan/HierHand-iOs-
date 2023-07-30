//
//  HHToolBarElement.h
//  HierHand
//
//  Created by hiersoan on 2023/7/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HHToolBarElementDelegate

- (void)toolBarElementDidTap;

@end

@interface HHToolBarElement : UIView

- (id)initWithButtonBoundLength:(NSUInteger)length numberTextFont:(UIFont *)font;

@property(nonatomic) UILabel *numberLabel;

@property(nonatomic) UIButton *operateButton;

@property(nonatomic, weak) id<HHToolBarElementDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
