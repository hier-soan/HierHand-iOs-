//
//  HHSlipSliderMenu.m
//  HierHand
//
//  Created by hiersoan on 2023/7/30.
//

#import "HHSlipSliderController.h"
#import "HHSlipSliderItem.h"

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
        _slipSliderView.collectionView.delegate = self;
        [self.view addSubview:_slipSliderView];
    }
    return self;
}

#pragma mark life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSlipSliderViewItem];
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
//    HHSlipSliderItem *item = [_slipSliderView.collectionView dequeueReusableCellWithReuseIdentifier:@"HHSlipSliderItem" forIndexPath:indexPath];
    HHSlipSliderItem *item = _itemArray[indexPath.section][indexPath.row];
    __weak typeof(item) weakItem = item;
    item.showDetailView = ^{
        NSLog(@"item is : %@", weakItem.title);
    };
    return item;
}

#pragma mark - public methods
- (void)showSlipMenu {
    [_slipSliderView showSlipMenu];
}

#pragma mark - private methods
- (void)addSlipSliderViewItem {
    _itemArray = [[NSMutableArray alloc] init];
    
    // section 1：
    HHSlipSliderItem* scanItem = [self createSlipSliderItemImageView:@"qrcode.viewfinder" title:@"扫一扫"];
    HHSlipSliderItem* shopItem = [self createSlipSliderItemImageView:@"cart" title:@"嗨手小店"];
    HHSlipSliderItem* taskItem = [self createSlipSliderItemImageView:@"filemenu.and.selection" title:@"任务中心"];
    [_itemArray addObject:@[scanItem, shopItem, taskItem]];
    
    // section 2:
    HHSlipSliderItem* liveItem = [self createSlipSliderItemImageView:@"web.camera.fill" title:@"直播"];
    HHSlipSliderItem* pocketItem = [self createSlipSliderItemImageView:@"square.and.at.rectangle.fill" title:@"我的钱包"];
    HHSlipSliderItem* helpItem = [self createSlipSliderItemImageView:@"headphones" title:@"客服中心"];
    HHSlipSliderItem* draftItem = [self createSlipSliderItemImageView:@"folder" title:@"草稿箱"];
    HHSlipSliderItem* historyItem = [self createSlipSliderItemImageView:@"clock.arrow.circlepath" title:@"历史记录"];
    HHSlipSliderItem* programItem = [self createSlipSliderItemImageView:@"button.programmable.square" title:@"小程序"];
    HHSlipSliderItem* contentItem = [self createSlipSliderItemImageView:@"heart" title:@"内容偏好"];
    [_itemArray addObject:@[liveItem, pocketItem, helpItem, draftItem, historyItem, programItem, contentItem]];
    
    // section 3:
    HHSlipSliderItem* surroundItem = [self createSlipSliderItemImageView:@"mappin.circle" title:@"周边游玩"];
    HHSlipSliderItem* foodItem = [self createSlipSliderItemImageView:@"takeoutbag.and.cup.and.straw" title:@"KFC"];
    HHSlipSliderItem* gameItem = [self createSlipSliderItemImageView:@"gamecontroller" title:@"游戏中心"];
    [_itemArray addObject:@[surroundItem, foodItem, gameItem]];
}

- (HHSlipSliderItem *)createSlipSliderItemImageView:(NSString *)url title:(NSString *)title {
    HHSlipSliderItem *item = [[HHSlipSliderItem alloc] init];
    [item.icon setImage:[UIImage systemImageNamed:url]];
    [item.title setText:title];
    return item;
}

@end
