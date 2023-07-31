//
//  HHSlipRootUserComponent.m
//  HierHand
//
//  Created by hiersoan on 2023/7/30.
//

#import "HHSlipRootUserComponent.h"

#define itemSpacing         10

#define rootUserComponentWidth    150
#define rootUserComponentHeight   50

#define userIconWidth       50
#define userIconHeight      50

#define userNameWidth       100
#define userNameHeight      50

#define userNameFontSize    16

@interface HHSlipRootUserComponent()

@property(nonatomic) UIImageView *userIcon;

@property(nonatomic) UILabel *userName;

@end

@implementation HHSlipRootUserComponent

- (id)init {
    self = [super init];
    if (self) {
        // 初始化自身大小
        self.frame = CGRectMake(0, 0, rootUserComponentWidth, rootUserComponentHeight);
        
        // 测试
        [self.userIcon setImage:[UIImage systemImageNamed:@"person"]];
        [self.userName setText:@"本机用户"];
        
        // 添加点击手势识别
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] init];
        if (self.showUserDetial) {
            [tapGesture addTarget:self action:@selector(showUserDetial)];
        }
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

#pragma mark - lazy load
// 初始化图像视图
- (UIImageView *)userIcon {
    if (!_userIcon) {
        _userIcon = [[UIImageView alloc] init];
        _userIcon.frame = CGRectMake(0, 0, userIconWidth, userIconHeight);
        [self addSubview:_userIcon];
    }
    return _userIcon;
}

// 初始化用户名称
- (UILabel *)userName {
    if (!_userName) {
        _userName = [[UILabel alloc] init];
        _userName.frame = CGRectMake(CGRectGetMaxX(_userIcon.frame) + itemSpacing, 0, userNameWidth, userNameHeight);
        [_userName setFont:[UIFont systemFontOfSize:userNameFontSize]];
        [self addSubview:_userName];
    }
    return _userName;
}

#pragma mark - public methods

- (void)setComponentImageName:(NSString *)image {
    [_userIcon setImage:[UIImage imageNamed:image]];
}

- (void)setComponentTitle:(NSString *)title {
    [_userName setText:title];
}

- (void)setComponentImageName:(NSString *)image title:(NSString *)title {
    [self setComponentImageName:image];
    [self setComponentTitle:title];
}


#pragma mark - private methods


@end
