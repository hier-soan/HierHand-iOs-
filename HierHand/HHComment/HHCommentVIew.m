//
//  HHCommentVIew.m
//  HierHand
//
//  Created by hiersoan on 2023/7/26.
//

#import "HHCommentView.h"

@implementation HHCommentView

- (id)init {
    self = [super init];
    if (self) {
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        self.frame = CGRectMake(0, 0, screenBounds.size.width, screenBounds.size.height * 0.6);
        
        // layer
        self.layer.cornerRadius = 10.0f;
        self.layer.borderWidth = 0.7;
        self.layer.borderColor = [UIColor clearColor].CGColor;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end
