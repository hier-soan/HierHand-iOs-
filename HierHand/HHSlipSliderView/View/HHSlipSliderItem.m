//
//  HHSlipSilderItem.m
//  HierHand
//
//  Created by hiersoan on 2023/7/30.
//

#import "HHSlipSliderItem.h"

const CGFloat itemWidth = 80.f;
const CGFloat itemHeight = 80.f;
const CGFloat itemIconWidth = 50.f;
const CGFloat itemIconHeight = 50.f;
const CGFloat titleFontSize = 12.f;

@interface HHSlipSliderItem()

@property(nonatomic) UIImageView *icon;

@property(nonatomic) UILabel *title;

@end

@implementation HHSlipSliderItem

- (id)init {
    self = [super init];
    if (self) {
        // 初始化frame
        self.frame = CGRectMake(0, 0, itemWidth, itemHeight);
        self.backgroundColor = [UIColor whiteColor];
        
        // 初始化点击手势识别
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] init];
        [tapGesture addTarget:self action:@selector(userTapItem)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

#pragma mark - lazy load
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.frame = CGRectMake(0, 0, itemIconWidth, itemHeight);
        [_icon setImage:[UIImage systemImageNamed:@"list.bullet.rectangle.portrait"]];
        [self addSubview:_icon];
    }
    return _icon;
}

- (UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] init];
        [_title setText:@"默认标题"];
        [_title setFont:[UIFont systemFontOfSize:titleFontSize]];
        [self addSubview:_title];
    }
    return _title;
}

#pragma mark - public methods


#pragma mark - private methods

- (void)userTapItem {
    
}

@end
