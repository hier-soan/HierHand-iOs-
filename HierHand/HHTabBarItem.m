//
//  HHTabBarItem.m
//  HierHand
//
//  Created by hiersoan on 2023/7/21.
//

#import "HHTabBarItem.h"

@implementation HHTabBarItem

- (id)initWithTitle:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag {
    self = [super initWithTitle:title image:image tag:tag];
    if (self) {
        
    }
    return self;
}

- (id)initWithLabelText:(NSString *)text textColor:(UIColor *)color font:(UIFont *)font {
    self = [super initWithTitle:nil image:nil tag:0];
    if (self) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = color;
        _titleLabel.font = font;
        
        
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
