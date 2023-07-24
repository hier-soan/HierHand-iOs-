//
//  HHUserInfo.m
//  HierHand
//
//  Created by hiersoan on 2023/7/23.
//

#import "HHUserInfo.h"

@implementation HHUserInfo

- (id)init {
    self = [super init];
    if (self) {
        _userName = (NSMutableString *)@"嗨手用户";
        _userIconImageName = @"person.crop.circle";
        _height = arc4random_uniform(160) + 120;
    }
    return self;
}

@end
