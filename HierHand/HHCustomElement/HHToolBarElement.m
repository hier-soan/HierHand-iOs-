//
//  HHToolBarElement.m
//  HierHand
//
//  Created by hiersoan on 2023/7/24.
//

#import "HHToolBarElement.h"

@implementation HHToolBarElement

- (id)initWithButtonBoundLength:(NSUInteger)length numberTextFont:(UIFont *)font {
    self = [super init];
    if (self) {
        _operateButton = [[UIButton alloc] init];
        _operateButton.frame = CGRectMake(0, 0, length, length);
        [_operateButton setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:_operateButton];
        
        _numberLabel = [[UILabel alloc] init];
        
        [_numberLabel setFont:font];
        _numberLabel.frame = CGRectMake(0, length, length, 10);
        [_numberLabel setTextColor:[UIColor whiteColor]];
        [_numberLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_numberLabel];
    }
    return self;
}

@end
