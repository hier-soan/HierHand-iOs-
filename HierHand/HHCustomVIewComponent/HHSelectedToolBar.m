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
        
    }
    return self;
}

#pragma mark - lazy load
// 头像
- (HHSelectedAvatarElement *)avatar {
    if (!_avatar) {
        _avatar = [[HHSelectedAvatarElement alloc] init];
        
        CGRect tempFrame = _avatar.frame;
        tempFrame.origin = CGPointMake(0, 0);
        _avatar.frame = tempFrame;
        
        self.frame = CGRectMake(0, 0, IconBoundLength, 4 * IconBoundLength + 4 * IconSpacing + _avatar.frame.size.height);
        
        [self addSubview:_avatar];
    }
    return _avatar;
}

// 点赞
- (HHToolBarElement *)likeButton {
    if (!_likeButton) {
        _likeButton = [[HHToolBarElement alloc] initWithButtonBoundLength:IconBoundLength numberTextFont:[UIFont systemFontOfSize:10]];
        [_likeButton.operateButton setImage:[UIImage systemImageNamed:@"heart.fill"] forState:UIControlStateNormal];
        [_likeButton.numberLabel setText:@"点赞数"];
        _likeButton.frame = CGRectMake(0, CGRectGetMaxY(_avatar.frame), IconBoundLength, IconBoundLength);
        _likeButton.delegate = self;
        
        [self addSubview:_likeButton];
    }
    return _likeButton;
}

// 评论
- (HHToolBarElement *)commentButton {
    if (!_commentButton) {
        _commentButton = [[HHToolBarElement alloc] initWithButtonBoundLength:IconBoundLength numberTextFont:[UIFont systemFontOfSize:10]];
        // [commentButton.imageView setImage:[UIImage systemImageNamed:@"message.fill"]];
         [_commentButton.operateButton setImage:[UIImage systemImageNamed:@"message.fill"] forState:UIControlStateNormal];
         [_commentButton.numberLabel setText:@"评论数"];
         _commentButton.frame = CGRectMake(0, CGRectGetMaxY(_likeButton.frame) + IconSpacing, IconBoundLength, IconBoundLength);
        _commentButton.delegate = self;
        
        [self addSubview:_commentButton];
    }
    return _commentButton;
}

// 收藏
- (HHToolBarElement *)collectButton {
    if (!_collectButton) {
        _collectButton = [[HHToolBarElement alloc] initWithButtonBoundLength:IconBoundLength numberTextFont:[UIFont systemFontOfSize:10]];
        [_collectButton.operateButton setImage:[UIImage systemImageNamed:@"star.fill"] forState:UIControlStateNormal];
        [_collectButton.numberLabel setText:@"收藏数"];
        _collectButton.frame = CGRectMake(0, CGRectGetMaxY(_commentButton.frame) + IconSpacing, IconBoundLength, IconBoundLength);
        _collectButton.delegate = self;
        
        [self addSubview:_collectButton];
    }
    return _collectButton;
}

// 分享
- (HHToolBarElement *)shareButton {
    if (!_shareButton) {
        _shareButton = [[HHToolBarElement alloc] initWithButtonBoundLength:IconBoundLength numberTextFont:[UIFont systemFontOfSize:10]];
        [_shareButton.operateButton setImage:[UIImage systemImageNamed:@"arrowshape.turn.up.right.fill"] forState:UIControlStateNormal];
        [_shareButton.numberLabel setText:@"转发数"];
        _shareButton.frame = CGRectMake(0, CGRectGetMaxY(_collectButton.frame) + IconSpacing, IconBoundLength, IconBoundLength);
        _shareButton.delegate = self;
        
        [self addSubview:_shareButton];
    }
    return _shareButton;
}

- (void)toolBarElementDidTap {
    NSLog(@"compoment layer get");
    [self.delegate toolBarElementDidTap:_commentButton atRow:2];
}

@end
