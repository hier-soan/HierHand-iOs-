//
//  HHWorksManager.m
//  HierHand
//
//  Created by hiersoan on 2023/7/23.
//

#import "HHWorksManager.h"

@interface HHWorksManager() {
    NSMutableArray *doubleColWorksArray;
    
    
}

@end

@implementation HHWorksManager

- (id)init{
    self = [super init];
    if (self) {
        doubleColWorksArray = [[NSMutableArray alloc] init];
        
        
    }
    return self;
}

- (NSArray *)doubleColWorksArray {
    dispatch_once_t token;
    dispatch_once(&token, ^{
        doubleColWorksArray = [[NSMutableArray alloc] init];
    });
    return doubleColWorksArray;
}

- (void)addDoubleColWorksInArray:(HHDoubleColWorks *)works {
    [doubleColWorksArray addObject:works];
}

@end
