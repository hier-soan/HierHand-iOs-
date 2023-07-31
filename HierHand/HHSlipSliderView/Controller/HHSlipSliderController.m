//
//  HHSlipSliderMenu.m
//  HierHand
//
//  Created by hiersoan on 2023/7/30.
//

#import "HHSlipSliderController.h"
#import "HHSlipSliderItem.h"
#import "HHSlipSliderView.h"

#define numberOfSections    3

#define numberOfItemsInSection_00   3
#define numberOfItemsInSection_01   5
#define numberOfItemsInSection_02   3
#define numberOfItemsInSection_03   3

@interface HHSlipSliderController()

@property(nonatomic) HHSlipSliderView *slipSliderView;

@end

@implementation HHSlipSliderController

-(id)init {
    self = [super init];
    if (self) {
        _slipSliderView = [[HHSlipSliderView alloc] init];
        [self.view addSubview:_slipSliderView];
    }
    return self;
}

#pragma mark - lazy load



#pragma mark - collection view data source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return numberOfSections;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger number = 0;
    switch (section) {
        case 0:{
            number = numberOfItemsInSection_00;
        }break;
        case 1:{
            number = numberOfItemsInSection_01;
        }break;
        case 2:{
            number = numberOfItemsInSection_02;
        }break;
        case 3:{
            number = numberOfItemsInSection_03;
        }break;
    }
    return number;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    HHSlipSliderItem *item = [_collectionView dequeueReusableCellWithReuseIdentifier:@"HHSlipSliderItem" forIndexPath:@"HHSlipSliderItem"];
    HHSlipSliderItem *item = [[HHSlipSliderItem alloc] init];
    item.showDetailView = ^{
        
    };
    return item;
}

@end
