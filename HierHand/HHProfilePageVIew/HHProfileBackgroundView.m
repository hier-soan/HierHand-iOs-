//
//  HHProfileBackgroundView.m
//  HierHand
//
//  Created by hiersoan on 2023/7/26.
//

#import "HHProfileBackgroundView.h"

@interface HHProfileBackgroundView()

@property(nonatomic) UIImageView *background;

@end

@implementation HHProfileBackgroundView

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

#pragma mark - lazy load
- (UIImageView *)background {
    if (!_background) {
        _background = [[UIImageView alloc] init];
        [_background setImage:[UIImage imageNamed:@"background-image.jpg"]];
        _background.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 200);
        
        [self addSubview:_background];
    }
    return _background;
}

@end
