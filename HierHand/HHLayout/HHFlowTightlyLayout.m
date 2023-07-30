//
//  HHFlowTightlyLayout.m
//  HierHand
//
//  Created by hiersoan on 2023/7/24.
//

#import "HHFlowTightlyLayout.h"
#import "HHHomeViewController.h"

#define NumberOfColum   2

@interface HHFlowTightlyLayout() {
    
    NSUInteger numberOfColumn;
    
    // 关注页面item的属性
    NSMutableArray *followAttributesArray;
    
    // 发现页面item的属性
    NSMutableArray *foundAttributesArray;
    
    // 同城页面item的属性
    NSMutableArray *sameCityAttributesArray;
    
    UIEdgeInsets edgeInsets;
    
    CGFloat itemSpacing;
    
    CGFloat heightOfFollowPage;
    
    CGFloat heightOfFoundPage;
    
    CGFloat heightOfCityPage;
}

@end

@implementation HHFlowTightlyLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    [self initVariable];
    
    [self calculateAttributes];
}


- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attributesArray;
    switch(_navBarState) {
        case HHNavFollowButtonClick: {
            attributesArray = followAttributesArray;
            break;
        }
        case HHNavFoundButtonClick: {
            attributesArray = foundAttributesArray;
            break;
        }
        case HHNavCityButtonClick: {
            attributesArray = sameCityAttributesArray;
            break;
        }
    }
    
    // problems the pointer
    NSMutableArray *tempArray = [NSMutableArray array];
    for (UICollectionViewLayoutAttributes *attributes in attributesArray) {
        // 如果在item与可视区域rect有交集，则显示该item
        if (CGRectIntersectsRect(rect, attributes.frame)) {
            [tempArray addObject:attributes];
        }
    }
    return tempArray;
}

- (CGSize)collectionViewContentSize {
    CGFloat height = 0;
    switch(_navBarState) {
        case HHNavFollowButtonClick: {
            height = heightOfFollowPage;
            break;
        }
        case HHNavFoundButtonClick: {
            height = heightOfFoundPage;
            break;
        }
        case HHNavCityButtonClick: {
            height = heightOfCityPage;
            break;
        }
    }
    CGFloat contentHeight = height + edgeInsets.bottom;
    return CGSizeMake([[UIScreen mainScreen] bounds].size.width, contentHeight);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return NO;
}

#pragma mark - private method
- (void)initVariable {
    numberOfColumn = NumberOfColum;
    edgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    itemSpacing = 10;
    _itemWidth = ([[UIScreen mainScreen] bounds].size.width
                  - edgeInsets.left - edgeInsets.right
                  - (numberOfColumn - 1) * itemSpacing) / numberOfColumn;
    
    
    followAttributesArray = [NSMutableArray array];
    [followAttributesArray removeAllObjects];
    
    foundAttributesArray = [NSMutableArray array];
    [foundAttributesArray removeAllObjects];
    
    sameCityAttributesArray = [NSMutableArray array];
    [sameCityAttributesArray removeAllObjects];
    
}

- (void)calculateAttributes {
    // 计算在关注、发现、同城三个页面中items的属性和最高列高度
    heightOfFollowPage = [self configureNumberOfItems:_numberOfFollowItems forAttributeArray:followAttributesArray];
    heightOfFoundPage = [self configureNumberOfItems:_numberOfFoundItems forAttributeArray:foundAttributesArray];
    heightOfCityPage = [self configureNumberOfItems:_numberOfSameCityItems forAttributeArray:sameCityAttributesArray];
}

- (CGFloat)configureNumberOfItems:(NSUInteger)number forAttributeArray:(NSMutableArray *)array {
    NSMutableArray *heightOfColumn = [NSMutableArray array];
    [heightOfColumn removeAllObjects];
    
    // 为每列的高度添加一个edgeInsets.top的初始值
    for (int i = 0; i < numberOfColumn; i++) {
        [heightOfColumn addObject:@(edgeInsets.top)];
    }
    
    // 计算每个item的属性，主要计算frame中的高度和xy坐标
    for (int i = 0; i < number; i++) {
        CGFloat itemX = 0;
        CGFloat itemY = 0;
        
        // item的x坐标，排到列中最矮的那一列
        NSUInteger shortestIndex = [self getShortestColomnIndex:heightOfColumn];
        itemX = edgeInsets.left + shortestIndex * (_itemWidth + itemSpacing);
        
        // item的y坐标
        CGFloat colomnHeight = [heightOfColumn[shortestIndex] floatValue];
        itemY = colomnHeight + itemSpacing;
        
        // item的高度需要随cell中内容的大小来决定
        CGFloat itemHeight = 0;
        itemHeight = [self.delegate HeightForItemWithIndexPath:[NSIndexPath indexPathForRow:i inSection:0] itemWidth:_itemWidth];
        
        // 更新列高度
        [heightOfColumn replaceObjectAtIndex:shortestIndex withObject:@(itemHeight + itemY)];
        
        // 设置item的attributes，并添加到attributes数组中
        UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        attributes.frame = CGRectMake(itemX, itemY, _itemWidth, itemHeight);
        [array addObject:attributes];
    }
    
    // 需要返回该页面中最高的列高度，在collectionViewContentSize函数中需要
    NSUInteger maxHeightIndex = [self getHighestColomnIndex:heightOfColumn];
    return [heightOfColumn[maxHeightIndex] floatValue];
}

- (NSUInteger)getShortestColomnIndex:(NSMutableArray *)heightOfColumn {
    NSUInteger index = 0;
  //  CGFloat shortest = [[UIScreen mainScreen] bounds].size.height;  bug点：双列高度并不是只有屏幕这么高
    CGFloat shortest = INT_MAX; // problem
    for (NSUInteger i = 0; i < numberOfColumn; i++) {
        if ([heightOfColumn[i] floatValue] < shortest) {
            shortest = [heightOfColumn[i] floatValue];
            index = i;
        }
    }
    return index;
}

- (NSUInteger)getHighestColomnIndex:(NSMutableArray *)heightOfColumn {
    NSUInteger index = 0;
    CGFloat highest = 0;
    for (NSUInteger i = 0; i < numberOfColumn; i++) {
        if ([heightOfColumn[i] floatValue] > highest) {
            highest = [heightOfColumn[i] floatValue];
            index = i;
        }
    }
    return index;
}

@end
