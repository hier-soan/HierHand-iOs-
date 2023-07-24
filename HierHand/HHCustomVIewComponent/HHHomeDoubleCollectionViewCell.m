//
//  HHHomeDoubleCollectionViewCell.m
//  HierHand
//
//  Created by hiersoan on 2023/7/23.
//

#import "HHHomeDoubleCollectionViewCell.h"

@interface HHHomeDoubleCollectionViewCell () {
    UIImageView *_overviewImageView;
    UIImageView *_iconImageView;
    UILabel *_userNameLabel;
    
    HHUserInfo *_userInfo;
}

@end

@implementation HHHomeDoubleCollectionViewCell

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _overviewImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_overviewImageView];
        _iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconImageView];
        _userNameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_userNameLabel];
        _userNameLabel.font = [UIFont systemFontOfSize:12];
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _userInfo = [[HHUserInfo alloc] init];
        
        [self setCellLayout];
        
    }
    return self;
}

- (void)setCellLayout {
    int overviewHeight = (int)_userInfo.height - 30;
    int cellWidth = ([[UIScreen mainScreen] bounds].size.width - 50) / 2;
    _overviewImageView.frame = CGRectMake(5, 5, cellWidth, overviewHeight);
    _iconImageView.image = [UIImage systemImageNamed:_userInfo.userIconImageName];
    _iconImageView.frame = CGRectMake(5, overviewHeight + 5, 25, 25);
    _userNameLabel.frame = CGRectMake(CGRectGetMaxX(_iconImageView.frame), CGRectGetMinY(_iconImageView.frame), cellWidth - _iconImageView.frame.size.width, 20);
}


- (void)setCellStateUserInfo:(HHUserInfo *)info {
    _userInfo = info;
    _userNameLabel.text = _userInfo.userName;
    [self setCellLayout];
}

- (void)setCellShowType:(HHNavBarState) state {
    if (state == HHNavCityButtonClick) {
        _overviewImageView.backgroundColor = [UIColor greenColor];
    } else if (state == HHNavFoundButtonClick) {
        _overviewImageView.backgroundColor = [UIColor blueColor];
    }
    
    if (state == HHNavFollowButtonClick) {
        _overviewImageView.backgroundColor = [UIColor orangeColor];
    }
}

- (void)prepareForReuse {
    [super prepareForReuse];
//    [self setCellLayout];
//    NSLog(@"cell height is = %d", _userInfo.height);
}

@end
