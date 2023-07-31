//
//  HHSelectedAvatarElement.m
//  HierHand
//
//  Created by hiersoan on 2023/7/25.
//

#import "HHSelectedAvatarElement.h"

#define HHSelectedFollowButtonWidth       25
#define HHSelectedFollowButtonHeight      15

@implementation HHSelectedAvatarElement

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - lazy load
- (UIButton *)followButton {
    if (!_followButton) {
        _followButton = [[UIButton alloc] init];
        
        CGFloat buttonX = CGRectGetMaxX(self.avatarView.frame) / 2 -(HHSelectedFollowButtonWidth / 2);
        CGFloat buttonY = CGRectGetMaxY(self.avatarView.frame) -(HHSelectedFollowButtonHeight / 2) - 3;
        _followButton.frame = CGRectMake(buttonX, buttonY, HHSelectedFollowButtonWidth, HHSelectedFollowButtonHeight);
        
        [_followButton setImage:[UIImage systemImageNamed:@"plus"] forState:UIControlStateNormal];
        [_followButton setImage:[UIImage systemImageNamed:@"checkmark"] forState:UIControlStateSelected];
        
        [_followButton.imageView setTintColor:[UIColor whiteColor]];
        _followButton.backgroundColor = [UIColor colorWithRed:1 green:0.2 blue:0.2 alpha:1];
        [_followButton addTarget:self action:@selector(followButtonTap) forControlEvents:UIControlEventTouchUpInside];
        
        // 设置圆角
        _followButton.layer.cornerRadius = 7.0f;
        _followButton.layer.borderWidth = 0.5f;
        _followButton.layer.borderColor = [UIColor clearColor].CGColor;
        _followButton.layer.masksToBounds = NO;
        
        //        // no working
        //        CGRect tempFrame = _followButton.imageView.frame;
        //        tempFrame.size = CGSizeMake(tempFrame.size.width * 0.75, tempFrame.size.height * 0.75);
        //        _followButton.imageView.frame = tempFrame;
        
        [self addSubview:_followButton];
    }
    return _followButton;
}

- (void)followButtonTap {
    if (_followButton.isSelected) {
        [_followButton setSelected:NO];
    } else {
        [_followButton setSelected:YES];
    }
}

@end
