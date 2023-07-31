//
//  HHSlipSliderMenu.m
//  HierHand
//
//  Created by hiersoan on 2023/7/30.
//

#import "HHSlipSliderController.h"
#import "HHSlipSliderItem.h"
#import "HHSlipSliderSectionHeaderCollectionReusableView.h"
#import "HHSlipRootUserComponent.h"

#define numberOfSections    3

#define numberOfItemsInSection_00   3
#define numberOfItemsInSection_01   7
#define numberOfItemsInSection_02   3
#define numberOfItemsInSection_03   3

@interface HHSlipSliderController()

@property(nonatomic) NSMutableArray *itemArray;

@end

@implementation HHSlipSliderController

-(id)init {
    self = [super init];
    if (self) {
        _slipSliderView = [[HHSlipSliderView alloc] init];
        _slipSliderView.collectionView.delegate = self;
        _slipSliderView.collectionView.dataSource = self;
        [_slipSliderView.collectionView registerClass:[HHSlipSliderSectionHeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HHSlipSliderSectionHeaderCollectionReusableView"];
        [_slipSliderView.collectionView registerClass:[HHSlipSliderSectionHeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HHSlipRootUserComponent"];
        [self.view addSubview:_slipSliderView];
    }
    return self;
}

#pragma mark life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [self addSlipSliderViewItem];
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
    }
    return number;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HHSlipSliderItem *item = [_slipSliderView.collectionView dequeueReusableCellWithReuseIdentifier:@"HHSlipSliderItem" forIndexPath:indexPath];
    if (indexPath.section == 0 && indexPath.row == 0) {
        [self item:item setIconUrl:@"qrcode.viewfinder" title:@"扫一扫"];
        item.backgroundColor = [UIColor yellowColor];
    } else if (indexPath.section == 0 && indexPath.row == 1){
        [self item:item setIconUrl:@"cart" title:@"嗨手小店"];
        item.backgroundColor = [UIColor yellowColor];
    } else if (indexPath.section == 0 && indexPath.row == 2){
        [self item:item setIconUrl:@"filemenu.and.selection" title:@"任务中心"];
        item.backgroundColor = [UIColor yellowColor];
    } else if (indexPath.section == 1 && indexPath.row == 0){
        [self item:item setIconUrl:@"web.camera.fill" title:@"直播"];
        item.backgroundColor = [UIColor blueColor];
    } else if (indexPath.section == 1 && indexPath.row == 1){
        [self item:item setIconUrl:@"square.and.at.rectangle.fill" title:@"我的钱包"];
        item.backgroundColor = [UIColor blueColor];
    } else if (indexPath.section == 1 && indexPath.row == 2){
        [self item:item setIconUrl:@"headphones" title:@"客服中心"];
        item.backgroundColor = [UIColor blueColor];
    } else if (indexPath.section == 1 && indexPath.row == 3){
        [self item:item setIconUrl:@"folder" title:@"草稿箱"];
        item.backgroundColor = [UIColor blueColor];
    } else if (indexPath.section == 1 && indexPath.row == 4){
        [self item:item setIconUrl:@"clock.arrow.circlepath" title:@"历史记录"];
        item.backgroundColor = [UIColor blueColor];
    } else if (indexPath.section == 1 && indexPath.row == 5){
        [self item:item setIconUrl:@"button.programmable.square" title:@"小程序"];
        item.backgroundColor = [UIColor blueColor];
    } else if (indexPath.section == 1 && indexPath.row == 6){
        [self item:item setIconUrl:@"heart" title:@"内容偏好"];
        item.backgroundColor = [UIColor blueColor];
    } else if (indexPath.section == 2 && indexPath.row == 0){
        [self item:item setIconUrl:@"qmappin.circle" title:@"周边游玩"];
        item.backgroundColor = [UIColor redColor];
    } else if (indexPath.section == 2 && indexPath.row == 1){
        [self item:item setIconUrl:@"takeoutbag.and.cup.and.straw" title:@"KFC"];
        item.backgroundColor = [UIColor redColor];
    } else if (indexPath.section == 2 && indexPath.row == 2){
        [self item:item setIconUrl:@"gamecontroller" title:@"游戏中心"];
        item.backgroundColor = [UIColor redColor];
    }
    
    return item;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    HHSlipSliderSectionHeaderCollectionReusableView *header = nil;
    
    switch (indexPath.section) {
        case 0: {
            if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
                header = [_slipSliderView.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HHSlipRootUserComponent" forIndexPath:indexPath];
            }
        }
        case 1: {
            header = [_slipSliderView.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HHSlipSliderSectionHeaderCollectionReusableView" forIndexPath:indexPath];
            header.headerTitle.text = @"服务中心"; break;
        }
        case 2: {
            header = [_slipSliderView.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HHSlipSliderSectionHeaderCollectionReusableView" forIndexPath:indexPath];
            header.headerTitle.text = @"生活娱乐"; break;
        }
    }

    return header;

}

#pragma mark - collection view flow layout delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(200, 50);
}


#pragma mark - public methods
- (void)showSlipMenu {
    [_slipSliderView showSlipMenu];
}

#pragma mark - private methods
- (void)addSlipSliderViewItem {
    _itemArray = [[NSMutableArray alloc] init];
    
    // section 1：
    HHSlipSliderItem* scanItem = [self createSlipSliderItemImageView:@"qrcode.viewfinder" title:@"扫一扫" forSection:0 row:0];
    HHSlipSliderItem* shopItem = [self createSlipSliderItemImageView:@"cart" title:@"嗨手小店" forSection:0 row:1];
    HHSlipSliderItem* taskItem = [self createSlipSliderItemImageView:@"filemenu.and.selection" title:@"任务中心" forSection:0 row:2];
    [_itemArray addObject:@[scanItem, shopItem, taskItem]];
    
    // section 2:
    HHSlipSliderItem* liveItem = [self createSlipSliderItemImageView:@"web.camera.fill" title:@"直播" forSection:1 row:0];
    HHSlipSliderItem* pocketItem = [self createSlipSliderItemImageView:@"square.and.at.rectangle.fill" title:@"我的钱包" forSection:1 row:1];
    HHSlipSliderItem* helpItem = [self createSlipSliderItemImageView:@"headphones" title:@"客服中心" forSection:1 row:2];
    HHSlipSliderItem* draftItem = [self createSlipSliderItemImageView:@"folder" title:@"草稿箱" forSection:1 row:3];
    HHSlipSliderItem* historyItem = [self createSlipSliderItemImageView:@"clock.arrow.circlepath" title:@"历史记录" forSection:1 row:4];
    HHSlipSliderItem* programItem = [self createSlipSliderItemImageView:@"button.programmable.square" title:@"小程序" forSection:1 row:5];
    HHSlipSliderItem* contentItem = [self createSlipSliderItemImageView:@"heart" title:@"内容偏好" forSection:1 row:6];
    [_itemArray addObject:@[liveItem, pocketItem, helpItem, draftItem, historyItem, programItem, contentItem]];
    
    // section 3:
    HHSlipSliderItem* surroundItem = [self createSlipSliderItemImageView:@"mappin.circle" title:@"周边游玩" forSection:2 row:0];
    HHSlipSliderItem* foodItem = [self createSlipSliderItemImageView:@"takeoutbag.and.cup.and.straw" title:@"KFC" forSection:2 row:1];
    HHSlipSliderItem* gameItem = [self createSlipSliderItemImageView:@"gamecontroller" title:@"游戏中心" forSection:2 row:2];
    [_itemArray addObject:@[surroundItem, foodItem, gameItem]];
    
}

//
- (HHSlipSliderItem *)createSlipSliderItemImageView:(NSString *)url title:(NSString *)title forSection:(NSUInteger)section row:(NSUInteger)row {
    // 这种方法没办法
//    HHSlipSliderItem *item = [_slipSliderView.collectionView dequeueReusableCellWithReuseIdentifier:@"HHSlipSliderItem" forIndexPath:indexPath];
    HHSlipSliderItem *item = [[HHSlipSliderItem alloc] init];
    [item.icon setImage:[UIImage systemImageNamed:url]];
    [item.title setText:title];
    return item;
}

- (void)item:(HHSlipSliderItem *)item setIconUrl:(NSString *)url title:(NSString *)title {
    [item.icon setImage:[UIImage systemImageNamed:url]];
    [item.title setText:title];
}

@end
