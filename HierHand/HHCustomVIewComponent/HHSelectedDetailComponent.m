//
//  HHSelectedDetailComponent.m
//  HierHand
//
//  Created by hiersoan on 2023/7/27.
//

#import "HHSelectedDetailComponent.h"

@interface HHSelectedDetailComponent()

@property(nonatomic) UILabel *userNameLabel;

@property(nonatomic) UILabel *worksDescriptionLabel;

@property(nonatomic) UILabel *musicLabel;

@end

@implementation HHSelectedDetailComponent

- (id)init {
    self = [super init];
    if (self) {
        CGFloat labelSpacing = 15.f;
        CGFloat edgeInsetLeft = 10.f;
        CGFloat detailComponentHeight = 170.f;
        CGFloat detailComponentOriginY = 600.f;
        
        self.frame = CGRectMake(0, detailComponentOriginY, [[UIScreen mainScreen] bounds].size.width * 0.75, detailComponentHeight);
        
        _userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(edgeInsetLeft, labelSpacing, self.frame.size.width, 30)];
        _worksDescriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(edgeInsetLeft, 2 * labelSpacing + CGRectGetMaxY(_userNameLabel.frame), self.frame.size.width, 20)];
        _musicLabel = [[UILabel alloc] initWithFrame:CGRectMake(edgeInsetLeft, 3 * labelSpacing + CGRectGetMaxY(_worksDescriptionLabel.frame), self.frame.size.width, 20)];
        
        [self addSubview:_userNameLabel];
        [self addSubview:_worksDescriptionLabel];
        [self addSubview:_musicLabel];
        
        [_userNameLabel setFont:[UIFont systemFontOfSize:20]];
        [_worksDescriptionLabel setFont:[UIFont systemFontOfSize:12]];
        [_musicLabel setFont:[UIFont systemFontOfSize:12]];
        
        [_userNameLabel setText:@"未添加用户"];
        [_worksDescriptionLabel setText:@"未添加详情"];
        [_musicLabel setText:@"未添加音乐"];
        
        [_userNameLabel setTextColor:[UIColor whiteColor]];
        [_worksDescriptionLabel setTextColor:[UIColor whiteColor]];
        [_musicLabel setTextColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)setDetailComponentWithUserName:(NSString *)name description:(NSString *)desc musicName:(NSString *) music {
    NSString *temp = [NSString stringWithFormat:@"@%@", name];
    _userNameLabel.text = [temp copy];
    _worksDescriptionLabel.text = desc;
    _musicLabel.text = music;
}

@end
