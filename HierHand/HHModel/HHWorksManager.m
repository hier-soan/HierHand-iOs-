//
//  HHWorksManager.m
//  HierHand
//
//  Created by hiersoan on 2023/7/23.
//

#import <UIKit/UIKit.h>
#import "HHWorksManager.h"
#import "HHUserManager.h"
#import "HHUserInfo.h"

#define HHRandom(r) arc4random_uniform(r)
#define HHColor(r, g, b, a)\
        [UIColor colorWithRed:r green:g blue:b alpha:a]
#define HHRandomColor   HHColor((CGFloat)HHRandom(256)/255, (CGFloat)HHRandom(256)/255, (CGFloat)HHRandom(256)/255, 1)

@interface HHWorksManager()

@property(nonatomic, strong) NSMutableDictionary *userWorksDictionary;

@property(nonatomic, strong) NSMutableArray *userWorksArray;

@end

@implementation HHWorksManager

+ (instancetype)sharedManager {
    static HHWorksManager *manager;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        manager = [[HHWorksManager alloc] init];
    });
    return manager;
}

- (id)init{
    self = [super init];
    if (self) {
        
        _userWorksDictionary = [[NSMutableDictionary alloc] init];
        _userWorksArray = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < [[HHUserManager userInfoArray] count]; i++) {
            HHUserInfo *userInfo = [HHUserManager userInfoArray][i];
            
            for (NSString* Id in userInfo.workIdentifications) {
                HHBaseWorks *works = [[HHBaseWorks alloc] init];
                // random
                works.height = arc4random_uniform(100) + 180;
                works.identification = [Id copy];
                works.owner = userInfo;
                works.backgroundColor = HHRandomColor;
                
                // 字典存储作品：以id为key，works为value。所有作者作品存在一个容器中
                [_userWorksDictionary setObject:works forKey:Id];
                
                // 暂时用于随机
                [_userWorksArray addObject:works];
            }
        }
        
    }
    return self;
}

- (HHBaseWorks *)getWorksWithId:(NSString *)identification {
    HHBaseWorks *works = [_userWorksDictionary objectForKey:identification];
    if (works) {
        return works;
    }
    return nil;
}

- (HHBaseWorks *)getRandomWorks {
    NSUInteger random = arc4random_uniform((uint32_t)[_userWorksArray count]);
    return _userWorksArray[random];
}

@end
