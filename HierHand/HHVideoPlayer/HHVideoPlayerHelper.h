//
//  HHVideoPlayerHelper.h
//  HierHand
//
//  Created by hiersoan on 2023/7/27.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHVideoPlayerHelper : NSObject

- (void)playVideoOnView:(UIView *)view;

- (void)suspendVideo;

- (void)continueVideo;

@end

NS_ASSUME_NONNULL_END
