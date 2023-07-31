//
//  HHFollowPageController.m
//  HierHand
//
//  Created by hiersoan on 2023/7/26.
//

#import "HHProfilePageController.h"
#import "HHProfileBackgroundView.h"

const CGFloat AvatarLength = 100;

@interface HHProfilePageController ()

@property(nonatomic, strong) UIImageView *avatar;

@property(nonatomic, strong) HHProfileFlowElement *flowElement;

@property(nonatomic) HHProfileBackgroundView *backgroundView;

@end

@implementation HHProfilePageController

- (id)init {
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

#pragma mark - lazy load
// 背景板
- (HHProfileBackgroundView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[HHProfileBackgroundView alloc] init];
        [self.view addSubview:_backgroundView];
    }
    return _backgroundView;
}

// 头像
- (UIImageView *)avatar {
    if (!_avatar) {
        _avatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"avatar.jpg"]];
        _avatar.frame = CGRectMake(30, 170, AvatarLength, AvatarLength);
        [self setAvatarCornorBorderWidth:3];
        [self.view addSubview:_avatar];
    }
    return _avatar;
}

// 流量信息
- (HHProfileFlowElement *)flowElement {
    if (_flowElement) {
        _flowElement = [[HHProfileFlowElement alloc] init];
        CGRect temp = _flowElement.frame;
        temp.origin = CGPointMake(140, 210);
        _flowElement.frame = temp;
        [self.view addSubview:_flowElement];
    }
    return _flowElement;
}

#pragma mark - life cycle

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - private method

- (void)setAvatarCornorBorderWidth:(NSUInteger)width {
    _avatar.layer.cornerRadius = AvatarLength / 2;
    _avatar.layer.borderWidth = width;
    _avatar.layer.borderColor = [UIColor whiteColor].CGColor;
    _avatar.layer.masksToBounds = YES;
}

@end
