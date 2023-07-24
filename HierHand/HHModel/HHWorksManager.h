//
//  HHWorksManager.h
//  HierHand
//
//  Created by hiersoan on 2023/7/23.
//

#import <Foundation/Foundation.h>
#import "HHDoubleColWorks.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHWorksManager : NSObject

- (NSArray *)doubleColWorksArray;

- (void)addDoubleColWorksInArray:(nonnull HHDoubleColWorks *)works;

@end

NS_ASSUME_NONNULL_END
