//
//  HHSelectedToolBar.m
//  HierHand
//
//  Created by hiersoan on 2023/7/24.
//

#import "HHSelectedToolBar.h"
#import "HHToolBarElement.h"

#define IconBoundLength     80
#define IconSpacing        10

@interface HHSelectedToolBar() {
    HHToolBarElement *likeButton;
    HHToolBarElement *commentButton;
    HHToolBarElement *collectButton;
    HHToolBarElement *shareButton;
}

@end

@implementation HHSelectedToolBar

- (id)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, IconBoundLength, 4 * IconBoundLength + 3 * IconSpacing);
        
        UIFont *font = [UIFont systemFontOfSize:10];
        likeButton = [[HHToolBarElement alloc] initWithButtonBoundLength:IconBoundLength numberTextFont:font];
        [self addSubview:likeButton];
        commentButton = [[HHToolBarElement alloc] initWithButtonBoundLength:IconBoundLength numberTextFont:font];
        [self addSubview:commentButton];
        collectButton = [[HHToolBarElement alloc] initWithButtonBoundLength:IconBoundLength numberTextFont:font];
        [self addSubview:collectButton];
        shareButton = [[HHToolBarElement alloc] initWithButtonBoundLength:IconBoundLength numberTextFont:font];
        [self addSubview:shareButton];
        
        [likeButton.operateButton setImage:[UIImage systemImageNamed:@"heart.fill"] forState:UIControlStateNormal];
        [likeButton.numberLabel setText:@"点赞数"];
        likeButton.frame = CGRectMake(0, 0, IconBoundLength, IconBoundLength);
        
       // [commentButton.imageView setImage:[UIImage systemImageNamed:@"message.fill"]];
        [commentButton.operateButton setImage:[UIImage systemImageNamed:@"message.fill"] forState:UIControlStateNormal];
        [commentButton.numberLabel setText:@"评论数"];
        commentButton.frame = CGRectMake(0, CGRectGetMaxY(likeButton.frame) + IconSpacing, IconBoundLength, IconBoundLength);
        
        [collectButton.operateButton setImage:[UIImage systemImageNamed:@"star.fill"] forState:UIControlStateNormal];
        [collectButton.numberLabel setText:@"收藏数"];
        collectButton.frame = CGRectMake(0, CGRectGetMaxY(commentButton.frame) + IconSpacing, IconBoundLength, IconBoundLength);
        
        [shareButton.operateButton setImage:[UIImage systemImageNamed:@"arrowshape.turn.up.right.fill"] forState:UIControlStateNormal];
        [shareButton.numberLabel setText:@"转发数"];
        shareButton.frame = CGRectMake(0, CGRectGetMaxY(collectButton.frame) + IconSpacing, IconBoundLength, IconBoundLength);
    }
    return self;
}

@end
