//
//  HHTabBarItem.h
//  HierHand
//
//  Created by hiersoan on 2023/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHTabBarItem : UITabBarItem

@property(nonatomic, strong) UILabel *titleLabel;

- (id)initWithLabelText:(NSString *)text textColor:(UIColor *)color font:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
