//
//  HHWorksManager.h
//  HierHand
//
//  Created by hiersoan on 2023/7/23.
//

#import <Foundation/Foundation.h>
#import "HHBaseWorks.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHWorksManager : NSObject

+ (instancetype)sharedManager;

- (HHBaseWorks *)getWorksWithId:(NSString *)identification;

- (HHBaseWorks *)getRandomWorks;

@end

NS_ASSUME_NONNULL_END
