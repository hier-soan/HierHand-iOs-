//
//  HHSlipSliderCollectionLayout.m
//  HierHand
//
//  Created by hiersoan on 2023/7/30.
//

#import "HHSlipSliderCollectionLayout.h"

@interface HHSlipSliderCollectionLayout()

@property(nonatomic) NSUInteger numberOfItems;

@property(nonatomic) NSUInteger itemSpacing;

@property(nonatomic) NSUInteger edgeInset;

@property(nonatomic) NSMutableArray *attributesArray;

@property(nonatomic) NSUInteger sectionInset;

@property(nonatomic) NSUInteger headerHeight;

@property(nonatomic) NSUInteger rootUserHeaderHeight;

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
    _itemSpacing = 10;
    _edgeInset = 10;
    _sectionInset = 20;
    _headerHeight = 50;
    _rootUserHeaderHeight = 100;
}

- (void)calculateAttributes {
    _attributesArray = [[NSMutableArray alloc] init];
    // 上一个section的高度
    CGFloat lastSectionHeight = 0;
    CGFloat itemWidth = (_viewWidth - 2 * _edgeInset - (_numberOfCol - 1) * _itemSpacing) / _numberOfCol;
    
    for (int i = 0; i < [_numberOfItemsInSections count]; i++) {
        CGFloat temp = 0;
        
        if (i == 0) {
            UICollectionViewLayoutAttributes *rootUserHeaderAttributes = nil;
            rootUserHeaderAttributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:[NSIndexPath indexPathForRow:0 inSection:i]];
            rootUserHeaderAttributes.frame = CGRectMake(0, lastSectionHeight + _sectionInset, _viewWidth, _rootUserHeaderHeight);
            [_attributesArray addObject:rootUserHeaderAttributes];
            lastSectionHeight += _rootUserHeaderHeight + _sectionInset;
        }
        
        if (i > 0) {
            UICollectionViewLayoutAttributes *headerAttributes = nil;
            
            headerAttributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:[NSIndexPath indexPathForRow:0 inSection:i]];
            
            headerAttributes.frame = CGRectMake(0, lastSectionHeight + _sectionInset, 200, _headerHeight);
            [_attributesArray addObject:headerAttributes];
            lastSectionHeight += _headerHeight + _sectionInset;
        }
        
        for (int j = 0; j < [_numberOfItemsInSections[i] unsignedLongValue]; j++) {
            
            CGFloat itemX = _edgeInset + (j % _numberOfCol) * _itemSpacing + (j % _numberOfCol) * itemWidth;
            
            CGFloat itemY = _edgeInset + (j / _numberOfCol) * _itemSpacing + (j / _numberOfCol) * itemWidth + lastSectionHeight + i * _itemSpacing;
            UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForRow:j inSection:i]];
            attributes.frame = CGRectMake(itemX, itemY, itemWidth, itemWidth);
            [_attributesArray addObject:attributes];
            
            // 每次都记录一次高度
            temp = itemY + itemWidth;
        }
        // 一个section过后，将值赋给lastSectionHeight
        lastSectionHeight = temp;
    }
}

@end
