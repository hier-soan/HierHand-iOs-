//
//  HHSlipSliderCollectionLayout.m
//  HierHand
//
//  Created by hiersoan on 2023/7/30.
//

#import "HHSlipSliderCollectionLayout.h"

@interface HHSlipSliderCollectionLayout()

@property(nonatomic) NSUInteger numberOfCol;

@property(nonatomic) NSUInteger numberOfItems;

@property(nonatomic) NSMutableArray *numberOfItemsInSections;

@property(nonatomic) NSUInteger viewWidth;

@property(nonatomic) NSUInteger itemSpacing;

@property(nonatomic) NSUInteger edgeInset;

@property(nonatomic) NSMutableArray *attributesArray;

@end

@implementation HHSlipSliderCollectionLayout

#pragma mark - override

- (void)prepareLayout {
    [super prepareLayout];
    [self initVariable];
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return NO;
}

#pragma mark - lazy load

- (NSMutableArray *)numberOfItemsInSections {
    if (!_numberOfItemsInSections) {
        _numberOfItemsInSections = [[NSMutableArray alloc] init];
    }
    return _numberOfItemsInSections;
}

#pragma mark - private methods

- (void)initVariable {
    _numberOfCol = 3;
    _itemSpacing = 10;
    _edgeInset = 10;
}

- (void)calculateAttributes {
    _attributesArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [_numberOfItemsInSections count]; i++) {
        for (int j = 0; j < [_numberOfItemsInSections[i] unsignedLongValue]; j++) {
            
        }
    }
}

@end
