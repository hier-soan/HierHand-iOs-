//
//  HHBaseAvatarElement.m
//  HierHand
//
//  Created by hiersoan on 2023/7/25.
//

#import "HHBaseAvatarElement.h"

@implementation HHBaseAvatarElement

- (id)init {
    self = [super init];
    if (self) {
//        NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"[_avatarView(%d)]", 50] options:0 metrics:nil views:NSDictionaryOfVariableBindings(_avatarView)];
//        [_avatarView addConstraints:constraints];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(avatarDidTap)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

#pragma mark - lazy load
- (UIImageView *)avatarView {
    if (!_avatarView) {
        _avatarView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"avatar.jpg"]];
        _avatarView.frame = CGRectMake(0, 0, 50, 50);
        self.frame = _avatarView.frame;
        [self setAvatarCornerLayer];
        [self addSubview:_avatarView];
    }
    return _avatarView;
}

#pragma mark - private methods
- (void)setAvatarCornerLayer {
    _avatarView.layer.cornerRadius = 25.0f;
    _avatarView.layer.borderWidth = 2.0f;
    _avatarView.layer.borderColor = [UIColor whiteColor].CGColor;
    _avatarView.layer.masksToBounds = YES;
}

- (void)avatarDidTap {
    
    // problem: 调用不了respondToSelector
    [self.delegate avatarDidTap];
}

@end
