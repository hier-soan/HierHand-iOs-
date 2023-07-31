//
//  HHSlipSliderSectionHeaderCollectionReusableView.m
//  HierHand
//
//  Created by hiersoan on 2023/7/31.
//

#import "HHSlipSliderSectionHeaderCollectionReusableView.h"

#define headerTitleFontSize     14

@implementation HHSlipSliderSectionHeaderCollectionReusableView

// 懒加载
- (UILabel *)headerTitle {
    if (!_headerTitle) {
        _headerTitle = [[UILabel alloc] init];
        [_headerTitle setText:@"default section header"];
        [_headerTitle setFont:[UIFont systemFontOfSize:headerTitleFontSize]];
        [self addSubview:_headerTitle];
    }
    return _headerTitle;
}

@end
