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

@property(nonatomic) HHWorksManager *worksManager;

@property(nonatomic) HHBaseWorks *worksInfo;

@end

@implementation HHHomeDoubleCollectionViewCell

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 基本UI控件初始化
        _overviewImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_overviewImageView];
        _iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconImageView];
        _userNameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_userNameLabel];
        _userNameLabel.font = [UIFont systemFontOfSize:12];
        
        // collection view cell的外观设置
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        // 用户信息初始化
        _userInfo = [[HHUserInfo alloc] init];
        
        _worksManager = [HHWorksManager sharedManager];
        
      //  [self setCellLayout];
        
        [self setCornerRadius:7.0f boardWidth:0.7f];
    }
    return self;
}

#pragma mark - life cycle
- (void)prepareForReuse {
    [super prepareForReuse];
//    [self setCellLayout];
//    NSLog(@"cell height is = %d", _userInfo.height);
}

#pragma mark - private methods
//- (void)setCellLayout {
//    int overviewHeight = (int)_userInfo.height - 30;
//    int cellWidth = ([[UIScreen mainScreen] bounds].size.width - 50) / 2;
//    _overviewImageView.frame = CGRectMake(5, 5, cellWidth, overviewHeight);
//    _iconImageView.image = [UIImage systemImageNamed:_userInfo.userIconImageName];
//    _iconImageView.frame = CGRectMake(5, overviewHeight + 5, 25, 25);
//    _userNameLabel.frame = CGRectMake(CGRectGetMaxX(_iconImageView.frame), CGRectGetMinY(_iconImageView.frame), cellWidth - _iconImageView.frame.size.width, 20);
//}
- (void)setCellLayout {
    NSUInteger overviewHeight = _worksInfo.height - 30;
    NSUInteger cellWidth = ([[UIScreen mainScreen] bounds].size.width - 50) / 2;
    _overviewImageView.frame = CGRectMake(5, 5, cellWidth, overviewHeight);
    _iconImageView.image = [UIImage systemImageNamed:_userInfo.userIconImageName];
    _iconImageView.frame = CGRectMake(5, overviewHeight + 5, 25, 25);
    _userNameLabel.frame = CGRectMake(CGRectGetMaxX(_iconImageView.frame), CGRectGetMinY(_iconImageView.frame), cellWidth - _iconImageView.frame.size.width, 20);
}

- (void)setCellStateWorksInfo:(HHBaseWorks *)works {
    _worksInfo = works;
    _userInfo = works.owner;
    _userNameLabel.text = _userInfo.userName;
    [self setCellLayout];
}


- (void)setCellShowType:(HHNavBarState) state {
    [_overviewImageView setBackgroundColor:_worksInfo.backgroundColor];
}

- (void)setCornerRadius:(CGFloat)radius boardWidth:(CGFloat)width {
    self.layer.cornerRadius = radius;
    self.contentView.layer.cornerRadius = radius;
    self.contentView.layer.borderWidth = width;
    self.contentView.layer.borderColor = [UIColor clearColor].CGColor;
    self.contentView.layer.masksToBounds = YES;
}

@end
