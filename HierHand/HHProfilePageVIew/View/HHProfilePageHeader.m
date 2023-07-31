//
//  HHProfilePageHeader.m
//  HierHand
//
//  Created by hiersoan on 2023/7/31.
//

#import "HHProfilePageHeader.h"
#import "HHProfileBackgroundView.h"
#import "HHProfileFlowElement.h"

#define AvatarLength    100

@interface HHProfilePageHeader()

@property(nonatomic, strong) UIImageView *avatar;

@property(nonatomic) HHProfileBackgroundView *background;

@property(nonatomic) HHProfileFlowElement *flowElement;

@property(nonatomic) UILabel *userName;

@property(nonatomic) UILabel *userId;

@property(nonatomic) UILabel *userDescription;

@property(nonatomic) UILabel *userOtherInfo;

@property(nonatomic) UIButton *followButton;

@property(nonatomic) UIButton *messageButton;

@property(nonatomic) UIButton *otherButton;

@end

@implementation HHProfilePageHeader

- (id)init {
    self = [super init];
    if (self) {
        _background = [[HHProfileBackgroundView alloc] init];
        [self addSubview:_background];
        
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        
        _avatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"avatar.jpg"]];
        _avatar.frame = CGRectMake(20, 170, AvatarLength, AvatarLength);
        [self setAvatarCornorBorderWidth:3];
        [self addSubview:_avatar];
        
        _flowElement = [[HHProfileFlowElement alloc] init];
        CGRect temp = _flowElement.frame;
        temp.origin = CGPointMake(140, 210);
        _flowElement.frame = temp;
        [self addSubview:_flowElement];
        
        _userName = [[UILabel alloc] init];
        [_userName setFont:[UIFont boldSystemFontOfSize:20]];
        [_userName setText:@"默认用户"];
        _userName.frame = CGRectMake(15, CGRectGetMaxY(_avatar.frame), screenSize.width, 30);
        [self addSubview:_userName];
        
        _userId = [[UILabel alloc] init];
        [_userId setFont:[UIFont systemFontOfSize:10]];
        [_userId setText:@"嗨手号：11111111"];
        _userId.frame = CGRectMake(15, CGRectGetMaxY(_userName.frame), screenSize.width, 20);
        [self addSubview:_userId];
        
        _userDescription = [[UILabel alloc] init];
        [_userDescription setFont:[UIFont systemFontOfSize:14]];
        [_userDescription setText:@"这是一段描述"];
        _userDescription.frame = CGRectMake(10, CGRectGetMaxY(_userId.frame), screenSize.width, 60);  // 后期这里动态根据文本调整高度
        [self addSubview:_userDescription];
        
        _userOtherInfo = [[UILabel alloc] init];
        [_userOtherInfo setFont:[UIFont systemFontOfSize:12]];
        [_userOtherInfo setText:@"其他信息"];
        _userOtherInfo.frame = CGRectMake(15, CGRectGetMaxY(_userDescription.frame), screenSize.width, 20);
        [self addSubview:_userOtherInfo];
        
        _followButton = [[UIButton alloc] init];
        _followButton.frame = CGRectMake(15, CGRectGetMaxY(_userOtherInfo.frame), screenSize.width - 140, 40);
        _followButton.backgroundColor = [UIColor colorWithRed:1 green:0.2 blue:0.2 alpha:1];
        [_followButton setTitle:@"+ 关注" forState:UIControlStateNormal];
        [_followButton.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
        [_followButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setButton:_followButton CornorRadius:20 borderWidth:0.7];
        [self addSubview:_followButton];
        
        _messageButton = [[UIButton alloc] init];
        [_messageButton setImage:[UIImage systemImageNamed:@"paperplane"] forState:UIControlStateNormal];
        [_messageButton setTintColor:[UIColor blackColor]];
        _messageButton.frame = CGRectMake(CGRectGetMaxX(_followButton.frame), CGRectGetMaxY(_userOtherInfo.frame), 40, 40);
        [self setButton:_messageButton CornorRadius:20 borderWidth:0.7];
        _messageButton.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
        [self addSubview:_messageButton];
        
        _otherButton = [[UIButton alloc] init];
        [_otherButton setImage:[UIImage systemImageNamed:@"ellipsis.circle"] forState:UIControlStateNormal];
        [_otherButton setTintColor:[UIColor blackColor]];
        _otherButton.frame = CGRectMake(CGRectGetMaxX(_messageButton.frame), CGRectGetMaxY(_userOtherInfo.frame), 40, 40);
        [self setButton:_otherButton CornorRadius:20 borderWidth:0.7];
        _otherButton.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
        [self addSubview:_otherButton];
        
        self.frame = CGRectMake(0, 0, screenSize.width, CGRectGetMaxY(_followButton.frame));
    }
    return self;
}



#pragma mark - private methods
- (void)setAvatarCornorBorderWidth:(NSUInteger)width {
    _avatar.layer.cornerRadius = AvatarLength / 2;
    _avatar.layer.borderWidth = width;
    _avatar.layer.borderColor = [UIColor whiteColor].CGColor;
    _avatar.layer.masksToBounds = YES;
}

- (void)setButton:(UIButton *)button CornorRadius:(CGFloat)radius borderWidth:(CGFloat)width {
    button.layer.cornerRadius = radius;
    button.layer.borderWidth = width;
    button.layer.borderColor = [UIColor clearColor].CGColor;
    button.layer.masksToBounds = YES;
}

@end
