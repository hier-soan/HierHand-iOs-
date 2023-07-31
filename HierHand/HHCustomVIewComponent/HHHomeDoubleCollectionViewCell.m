//
//  HHHomeDoubleCollectionViewCell.m
//  HierHand
//
//  Created by hiersoan on 2023/7/23.
//

#import "HHHomeDoubleCollectionViewCell.h"

@interface HHHomeDoubleCollectionViewCell()

@property(nonatomic) UIImageView *overviewImageView;

@property(nonatomic) UIImageView *iconImageView;

@property(nonatomic) UILabel *userNameLabel;

@property(nonatomic) HHUserInfo *userInfo;

@property(nonatomic) HHWorksManager *worksManager;

@property(nonatomic) HHBaseWorks *worksInfo;

@end

@implementation HHHomeDoubleCollectionViewCell

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // collection view cell的外观设置
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setCornerRadius:7.0f boardWidth:0.7f];
        
        //  [self setCellLayout];
        _overviewImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_overviewImageView];
        
        _iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconImageView];
        
        _userNameLabel = [[UILabel alloc] init];
        _userNameLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_userNameLabel];
    }
    return self;
}

#pragma mark - lazy load

// 用户信息
- (HHUserInfo *)userInfo {
    if (!_userInfo) {
        _userInfo = [[HHUserInfo alloc] init];
    }
    return _userInfo;
}

#pragma mark - life cycle
- (void)prepareForReuse {
    [super prepareForReuse];
}

#pragma mark - private methods

- (void)setCellLayout {
    NSUInteger overviewHeight = self.worksInfo.height - 30;
    NSUInteger cellWidth = ([[UIScreen mainScreen] bounds].size.width - 50) / 2;
    self.overviewImageView.frame = CGRectMake(5, 5, cellWidth, overviewHeight);
    self.iconImageView.image = [UIImage systemImageNamed:self.userInfo.userIconImageName];
    self.iconImageView.frame = CGRectMake(5, overviewHeight + 5, 25, 25);
    self.userNameLabel.frame = CGRectMake(CGRectGetMaxX(self.iconImageView.frame), CGRectGetMinY(self.iconImageView.frame), cellWidth - self.iconImageView.frame.size.width, 20);
}

- (void)setCellStateWorksInfo:(HHBaseWorks *)works {
    self.worksInfo = works;
    self.userInfo = works.owner;
    self.userNameLabel.text = self.userInfo.userName;
    [self setCellLayout];
}


- (void)setCellShowType:(HHNavBarState) state {
    [self.overviewImageView setBackgroundColor:self.worksInfo.backgroundColor];
}

- (void)setCornerRadius:(CGFloat)radius boardWidth:(CGFloat)width {
    self.layer.cornerRadius = radius;
    self.contentView.layer.cornerRadius = radius;
    self.contentView.layer.borderWidth = width;
    self.contentView.layer.borderColor = [UIColor clearColor].CGColor;
    self.contentView.layer.masksToBounds = YES;
}

@end
