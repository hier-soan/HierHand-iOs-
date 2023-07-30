//
//  HHVideoPlayerHelper.m
//  HierHand
//
//  Created by hiersoan on 2023/7/27.
//

#import "HHVideoPlayerHelper.h"

@interface HHVideoPlayerHelper()

@property(nonatomic) AVPlayerItem *playerItem;

@property(nonatomic) AVPlayer *player;

@property(nonatomic) AVPlayerLayer *playerLayer;


@end

@implementation HHVideoPlayerHelper

- (id)init {
    self = [super init];
    if (self) {
        NSURL *playUrl = [NSURL URLWithString:@"file:///Users/hiersoan/video.mp4"];
        self.playerItem = [AVPlayerItem playerItemWithURL:playUrl];
        //如果要切换视频需要调AVPlayer的replaceCurrentItemWithPlayerItem:方法
        self.player = [AVPlayer playerWithPlayerItem:_playerItem];
        self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    }
    return self;
}

- (void)playVideoOnView:(UIView *)view{
    self.playerLayer.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    [view.layer addSublayer:self.playerLayer];
    [self.player play];
}

- (void)suspendVideo {
    [self.player pause];
}

- (void)continueVideo {
    [self.player play];
}
@end
