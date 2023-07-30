//
//  HHSelectedToolBar.m
//  HierHand
//
//  Created by hiersoan on 2023/7/24.
//

#import "HHSelectedToolBar.h"
#import "HHToolBarElement.h"

#define IconBoundLength     50
#define IconSpacing        10

@interface HHSelectedToolBar()

@property(nonatomic, strong) HHToolBarElement *likeButton;
    
@property(nonatomic, strong) HHToolBarElement *commentButton;
    
@property(nonatomic, strong) HHToolBarElement *collectButton;
    
@property(nonatomic, strong) HHToolBarElement *shareButton;

@end

@implementation HHSelectedToolBar

- (id)init {
    self = [super init];
    if (self) {
        
        _avatar = [[HHSelectedAvatarElement alloc] init];
        [self addSubview:_avatar];
        
        CGRect tempFrame = _avatar.frame;
        tempFrame.origin = CGPointMake(0, 0);
        _avatar.frame = tempFrame;
        
        self.frame = CGRectMake(0, 0, IconBoundLength, 4 * IconBoundLength + 4 * IconSpacing + _avatar.frame.size.height);
        
        UIFont *font = [UIFont systemFontOfSize:10];
        _likeButton = [[HHToolBarElement alloc] initWithButtonBoundLength:IconBoundLength numberTextFont:font];
        [self addSubview:_likeButton];
        _commentButton = [[HHToolBarElement alloc] initWithButtonBoundLength:IconBoundLength numberTextFont:font];
        [self addSubview:_commentButton];
        _collectButton = [[HHToolBarElement alloc] initWithButtonBoundLength:IconBoundLength numberTextFont:font];
        [self addSubview:_collectButton];
        _shareButton = [[HHToolBarElement alloc] initWithButtonBoundLength:IconBoundLength numberTextFont:font];
        [self addSubview:_shareButton];
        
        
        [_likeButton.operateButton setImage:[UIImage systemImageNamed:@"heart.fill"] forState:UIControlStateNormal];
        [_likeButton.numberLabel setText:@"点赞数"];
        _likeButton.frame = CGRectMake(0, CGRectGetMaxY(_avatar.frame), IconBoundLength, IconBoundLength);
        
       // [commentButton.imageView setImage:[UIImage systemImageNamed:@"message.fill"]];
        [_commentButton.operateButton setImage:[UIImage systemImageNamed:@"message.fill"] forState:UIControlStateNormal];
        [_commentButton.numberLabel setText:@"评论数"];
        _commentButton.frame = CGRectMake(0, CGRectGetMaxY(_likeButton.frame) + IconSpacing, IconBoundLength, IconBoundLength);
        
        [_collectButton.operateButton setImage:[UIImage systemImageNamed:@"star.fill"] forState:UIControlStateNormal];
        [_collectButton.numberLabel setText:@"收藏数"];
        _collectButton.frame = CGRectMake(0, CGRectGetMaxY(_commentButton.frame) + IconSpacing, IconBoundLength, IconBoundLength);
        
        [_shareButton.operateButton setImage:[UIImage systemImageNamed:@"arrowshape.turn.up.right.fill"] forState:UIControlStateNormal];
        [_shareButton.numberLabel setText:@"转发数"];
        _shareButton.frame = CGRectMake(0, CGRectGetMaxY(_collectButton.frame) + IconSpacing, IconBoundLength, IconBoundLength);
        
        _likeButton.delegate = self;
        _commentButton.delegate = self;
        _collectButton.delegate = self;
        _shareButton.delegate = self;
    }
    return self;
}

- (void)toolBarElementDidTap {
    NSLog(@"compoment layer get");
    [self.delegate toolBarElementDidTap:_commentButton atRow:2];
}

@end
