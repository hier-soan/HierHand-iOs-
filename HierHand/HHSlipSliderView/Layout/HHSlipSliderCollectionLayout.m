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
    [self calculateAttributes];
}

// 需要更多细节重写该方法
//- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return nil;
//}
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (UICollectionViewLayoutAttributes *attributes in _attributesArray) {
        if (CGRectIntersectsRect(rect, attributes.frame)) {
            [array addObject:attributes];
        }
    }
    return array;
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
    
    CGFloat itemWidth = _viewWidth / _numberOfCol - 2 * _edgeInset + (_numberOfCol - 1) * _itemSpacing;
    for (int i = 0; i < [_numberOfItemsInSections count]; i++) {
        for (int j = 0; j < [_numberOfItemsInSections[i] unsignedLongValue]; j++) {
            NSUInteger num = [_numberOfItemsInSections[i] unsignedLongValue];
            CGFloat itemX = _edgeInset + (j % _numberOfCol) * _itemSpacing + (j % _numberOfCol) * itemWidth;
            CGFloat itemY = _edgeInset + (j / _numberOfCol) * _itemSpacing + (j / _numberOfCol) * itemWidth;
            UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForRow:j inSection:i]];
            attributes.frame = CGRectMake(itemX, itemY, itemWidth, itemWidth);
            [_attributesArray addObject:attributes];
        }
    }
}

@end
