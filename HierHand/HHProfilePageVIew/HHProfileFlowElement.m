//
//  HHProfileFlowElement.m
//  HierHand
//
//  Created by hiersoan on 2023/7/26.
//

#import "HHProfileFlowElement.h"

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
        
        UIFont *boldFont = [UIFont boldSystemFontOfSize:12];
        UIFont *font = [UIFont systemFontOfSize:14];
        
        _fansNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, labelHeight)];
        [_fansNumLabel setFont:boldFont];
        _fansNumLabel.textAlignment = NSTextAlignmentCenter;
        _fansNumLabel.text = @"666.6万";
        [self addSubview:_fansNumLabel];
        
        _fansTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, labelHeight, labelWidth, labelHeight)];
        _fansTitleLabel.text = @"粉丝";
        [_fansTitleLabel setFont:font];
        _fansTitleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_fansTitleLabel];
        
        _followNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelWidth + labelSpacing, 0, labelWidth, labelHeight)];
        _followNumLabel.text = @"66";
        [_followNumLabel setFont:boldFont];
        _followNumLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_followNumLabel];
        
        _followTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelWidth + labelSpacing, labelHeight, labelWidth, labelHeight)];
        _followTitleLabel.text = @"关注";
        [_followTitleLabel setFont:font];
        _followTitleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_followTitleLabel];
        
        _getLikeNumLabel = [[UILabel alloc] initWithFrame:CGRectMake((labelWidth + labelSpacing) * 2, 0, labelWidth, labelHeight)];
        _getLikeNumLabel.text = @"6666.6万";
        [_getLikeNumLabel setFont:boldFont];
        _getLikeNumLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_getLikeNumLabel];
        
        _getLikeTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake((labelWidth + labelSpacing) * 2, labelHeight, labelWidth, labelHeight)];
        _getLikeTitleLabel.text = @"获赞";
        [_getLikeTitleLabel setFont:font];
        _getLikeTitleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_getLikeTitleLabel];
        
    }
    return self;
}

@end
