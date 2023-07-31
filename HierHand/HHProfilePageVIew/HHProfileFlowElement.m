//
//  HHProfileFlowElement.m
//  HierHand
//
//  Created by hiersoan on 2023/7/26.
//

#import "HHProfileFlowElement.h"

#define boldFontSize    12
#define fontSize        14

const CGFloat labelHeight = 20.0f;
const CGFloat labelWidth = 70.0f;
const CGFloat labelSpacing = 5.0f;

@interface HHProfileFlowElement()

@property(nonatomic) UILabel *fansNumLabel;

@property(nonatomic) UILabel *fansTitleLabel;

@property(nonatomic) UILabel *followNumLabel;

@property(nonatomic) UILabel *followTitleLabel;

@property(nonatomic) UILabel *getLikeNumLabel;

@property(nonatomic) UILabel *getLikeTitleLabel;

@end

@implementation HHProfileFlowElement

- (id)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, 3 * labelWidth + 4 * labelSpacing, 2 * labelHeight);
        
    }
    return self;
}

#pragma mark - lazy load
// 粉丝数量
- (UILabel *)fansNumLabel {
    if (!_fansNumLabel) {
        _fansNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, labelHeight)];
        [_fansNumLabel setFont:[UIFont boldSystemFontOfSize:boldFontSize]];
        _fansNumLabel.textAlignment = NSTextAlignmentCenter;
        _fansNumLabel.text = @"666.6万";
        [self addSubview:_fansNumLabel];
    }
    return _fansNumLabel;
}

// 粉丝标题
- (UILabel *)fansTitleLabel {
    if (!_fansTitleLabel) {
        _fansTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, labelHeight, labelWidth, labelHeight)];
        _fansTitleLabel.text = @"粉丝";
        [_fansTitleLabel setFont:[UIFont systemFontOfSize:fontSize]];
        _fansTitleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_fansTitleLabel];
    }
    return _fansTitleLabel;
}

// 关注数量
- (UILabel *)followNumLabel {
    if (!_followNumLabel) {
        _followNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelWidth + labelSpacing, 0, labelWidth, labelHeight)];
        _followNumLabel.text = @"66";
        [_followNumLabel setFont:[UIFont boldSystemFontOfSize:boldFontSize]];
        _followNumLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_followNumLabel];
    }
    return _followNumLabel;
}

// 关注标题
- (UILabel *)followTitleLabel {
    if (!_followTitleLabel) {
        _followTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelWidth + labelSpacing, labelHeight, labelWidth, labelHeight)];
        _followTitleLabel.text = @"关注";
        [_followTitleLabel setFont:[UIFont systemFontOfSize:fontSize]];
        _followTitleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_followTitleLabel];
    }
    return _followTitleLabel;
}

- (UILabel *)getLikeNumLabel {
    if (!_getLikeNumLabel) {
        _getLikeNumLabel = [[UILabel alloc] initWithFrame:CGRectMake((labelWidth + labelSpacing) * 2, 0, labelWidth, labelHeight)];
        _getLikeNumLabel.text = @"6666.6万";
        [_getLikeNumLabel setFont:[UIFont boldSystemFontOfSize:boldFontSize]];
        _getLikeNumLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_getLikeNumLabel];
    }
    return _getLikeNumLabel;
}

- (UILabel *)getLikeTitleLabel {
    if (!_getLikeTitleLabel) {
        _getLikeTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake((labelWidth + labelSpacing) * 2, labelHeight, labelWidth, labelHeight)];
        _getLikeTitleLabel.text = @"获赞";
        [_getLikeTitleLabel setFont:[UIFont systemFontOfSize:fontSize]];
        _getLikeTitleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_getLikeTitleLabel];
    }
    return _getLikeTitleLabel;
}
@end
