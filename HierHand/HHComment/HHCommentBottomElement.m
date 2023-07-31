//
//  HHCommentBottomElement.m
//  HierHand
//
//  Created by hiersoan on 2023/7/24.
//

#import "HHCommentBottomElement.h"

@implementation HHCommentBottomElement

- (id)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        self.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 30);
        
        _commentField = [[UITextField alloc] init];
        _commentField.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
        NSAttributedString *placeHolderAttributed = [[NSAttributedString alloc] initWithString:@"发条友善的评论吧～" attributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1]}];
        _commentField.attributedPlaceholder = placeHolderAttributed;
        _commentField.frame = self.frame;
        [_commentField setBorderStyle:UITextBorderStyleRoundedRect];
        
        [self addSubview:_commentField];
    }
    return self;
}

#pragma mark - lazy load


@end
