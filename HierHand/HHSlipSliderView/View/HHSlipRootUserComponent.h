//
//  HHSlipRootUserComponent.h
//  HierHand
//
//  Created by hiersoan on 2023/7/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHSlipRootUserComponent : UIView

@property(nonatomic, weak) void(^showUserDetial)(void);

- (void)setComponentImageName:(NSString *)image;

- (void)setComponentTitle:(NSString *)title;

- (void)setComponentImageName:(NSString *)image title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
