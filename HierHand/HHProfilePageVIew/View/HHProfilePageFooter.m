//
//  HHProfilePageFooter.m
//  HierHand
//
//  Created by hiersoan on 2023/8/1.
//

#import "HHProfilePageFooter.h"

@interface HHProfilePageFooter()

@property(nonatomic) UIButton *worksButton;

@property(nonatomic) UIButton *trendsButton;

@property(nonatomic) UIButton *getAtButton;

@end

@implementation HHProfilePageFooter

- (id)init {
    self = [super init];
    if (self) {
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        
        self.frame = CGRectMake(0, 0, screenSize.width, 50);
        self.backgroundColor = [UIColor whiteColor];
        
        CGFloat buttonWidth = screenSize.width / 3;
        
        _worksButton = [[UIButton alloc] init];
        _worksButton.frame = CGRectMake(0, 0, buttonWidth, 50);
        [_worksButton setTitle:@"作品" forState:UIControlStateNormal];
        [_worksButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
        [_worksButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:_worksButton];
        
        _trendsButton = [[UIButton alloc] init];
        [_trendsButton setTitle:@"动态" forState:UIControlStateNormal];
        _trendsButton.frame = CGRectMake(CGRectGetMaxX(_worksButton.frame), 0, buttonWidth, 50);
        [_trendsButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
        [_trendsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:_trendsButton];
        
        _getAtButton = [[UIButton alloc] init];
        [_getAtButton setTitle:@"被@" forState:UIControlStateNormal];
        _getAtButton.frame = CGRectMake(CGRectGetMaxX(_trendsButton.frame), 0, buttonWidth, 50);
        [_getAtButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
        [_getAtButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:_getAtButton];
        
      //  self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

@end
