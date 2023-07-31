//
//  HHProfileFlowLayout.m
//  HierHand
//
//  Created by hiersoan on 2023/8/1.
//

#import "HHProfileFlowLayout.h"

#define edgeInsets      1
#define worksSpacing    1
#define column          3

@interface HHProfileFlowLayout()

@property(nonatomic) NSUInteger numberOfWorks;

@property(nonatomic) NSMutableArray *attributesArray;

@property(nonatomic) NSUInteger itemHeight;

@end

@implementation HHProfileFlowLayout

#pragma mark - override

- (void)prepareLayout {
    [super prepareLayout];
    [self initVarible];
    [self calculateAttributes];
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return nil;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (CGSize)collectionViewContentSize {
    return CGSizeZero;
}

#pragma mark - private methods
- (void)initVarible {
    
}

- (void)calculateAttributes {
    _attributesArray = [[NSMutableArray alloc] init];
    
    UICollectionViewLayoutAttributes *headerAttributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
 //   headerAttributes.frame =
    [_attributesArray addObject:headerAttributes];
    
    UICollectionViewLayoutAttributes *footerAttributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter withIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [_attributesArray addObject:footerAttributes];
    
    CGFloat itemWidth = ([[UIScreen mainScreen] bounds].size.width - 2 * edgeInsets + 2 * worksSpacing) / 3;
    for (int i = 0; i < _numberOfWorks; i++) {
        CGFloat itemX = edgeInsets + (i % _numberOfWorks) * (worksSpacing + itemWidth);
        CGFloat itemY = edgeInsets + (i / _numberOfWorks) * (worksSpacing + _itemHeight);
        
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForRow:i % _numberOfWorks inSection:i / _numberOfWorks]];
        attributes.frame = CGRectMake(itemX, itemY, itemWidth, _itemHeight);
        [_attributesArray addObject:attributes];
    }
}

@end
