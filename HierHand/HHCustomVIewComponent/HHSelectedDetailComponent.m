//
//  HHSelectedDetailComponent.m
//  HierHand
//
//  Created by hiersoan on 2023/7/27.
//

#import "HHSelectedDetailComponent.h"

#define labelSpacing    15
#define edgeInsetLeft   10
#define detailComponentHeight   170
#define detailComponentOriginY  600

@interface HHSelectedDetailComponent()

@property(nonatomic) UILabel *userNameLabel;

@property(nonatomic) UILabel *worksDescriptionLabel;

@property(nonatomic) UILabel *musicLabel;

@end

@implementation HHSelectedDetailComponent

- (id)init {
    self = [super init];
    if (self) {
        
        self.frame = CGRectMake(0, detailComponentOriginY, [[UIScreen mainScreen] bounds].size.width * 0.75, detailComponentHeight);
    
    }
    return self;
}

#pragma mark - lazy load
// 用户名
- (UILabel *)_userNameLabel {
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(edgeInsetLeft, labelSpacing, self.frame.size.width, 30)];
        [_userNameLabel setFont:[UIFont systemFontOfSize:20]];
        [_userNameLabel setText:@"未添加用户"];
        [_userNameLabel setTextColor:[UIColor whiteColor]];
        [self addSubview:_userNameLabel];
    }
    return _userNameLabel;
}

// 用户作品描述
- (UILabel *)worksDescriptionLabel {
    if (!_worksDescriptionLabel) {
        _worksDescriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(edgeInsetLeft, 2 * labelSpacing + CGRectGetMaxY(_userNameLabel.frame), self.frame.size.width, 20)];
        [_worksDescriptionLabel setFont:[UIFont systemFontOfSize:12]];
        [_worksDescriptionLabel setText:@"未添加详情"];
        [_worksDescriptionLabel setTextColor:[UIColor whiteColor]];
        [self addSubview:_worksDescriptionLabel];
    }
    return _worksDescriptionLabel;
}

// 作品音乐
- (UILabel *)musicLabel {
    if (!_musicLabel) {
        _musicLabel = [[UILabel alloc] initWithFrame:CGRectMake(edgeInsetLeft, 3 * labelSpacing + CGRectGetMaxY(_worksDescriptionLabel.frame), self.frame.size.width, 20)];
        [_musicLabel setFont:[UIFont systemFontOfSize:12]];
        [_musicLabel setText:@"未添加音乐"];
        [_musicLabel setTextColor:[UIColor whiteColor]];
        [self addSubview:_musicLabel];
    }
    return _musicLabel;
}

#pragma mark - public methods
- (void)setDetailComponentWithUserName:(NSString *)name description:(NSString *)desc musicName:(NSString *) music {
    NSString *temp = [NSString stringWithFormat:@"@%@", name];
    _userNameLabel.text = [temp copy];
    _worksDescriptionLabel.text = desc;
    _musicLabel.text = music;
}

@end
