//
//  HHUserInfo.m
//  HierHand
//
//  Created by hiersoan on 2023/7/23.
//

#import "HHUserInfo.h"

@interface HHUserInfo()

@end

@implementation HHUserInfo

- (id)init {
    self = [super init];
    if (self) {
        _userName = (NSMutableString *)@"嗨手用户";
        _userIconImageName = @"person.crop.circle";
        _height = arc4random_uniform(100) + 180;
        
        _workIdentifications = [[NSMutableArray alloc] init];
        
        _toFollows = [[NSMutableSet alloc] init];
        _fans = [[NSMutableSet alloc] init];
    }
    return self;
}

#pragma mark - public methods

- (void)addToFollows:(NSString *)userName {
    if (userName) {
        // problem:  copy or no copy ?   关注者改名字了，用copy还要去通知？或者直接用kvo？
        [_toFollows addObject:userName];
    }
}

- (void)removeToFollows:(NSString *)userName {
    if (userName) {
        // 如何判定set是否有object？失败会返回什么？ ———— 官方文档：若无object，则不会起任何作用
        [_toFollows removeObject:userName];
    }
}

- (void)addFans:(NSString *)userName {
    if (userName) {
        [_fans addObject:userName];
    }
}

- (void)removeFans:(NSString *)userName {
    if (userName) {
        [_fans addObject:userName];
    }
}

@end
