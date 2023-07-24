//
//  HHHomeViewController.m
//  HierHand
//
//  Created by hiersoan on 2023/7/21.
//

#import "HHHomeViewController.h"
#import "HHHomeDoubleCollectionViewCell.h"
#import "HHSelectedController.h"

@interface HHHomeViewController () {
    UIView *navBarView;
    UIButton *followButton;
    UIButton *foundButton;
    UIButton *cityButton;
    
    UIButton *fastSettingListButton;
    UIButton *fastSearchButton;
    
    UICollectionView *homeCollectionView;
    UICollectionViewFlowLayout *flowLayout;
    HHFlowTightlyLayout *tightlyFlowLayout;
    UICollectionViewController *co;
    
    HHUserManager *manager;
    HHNavBarState navBarState;
}

- (UIView *)createNavBarTitleView;

- (UIButton *)createNavBarButtonWithCGRect:(CGRect)rect titleText:(NSString *)title;

- (void)createNavLeftButtonImageName;

@end

@implementation HHHomeViewController

- (id)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"首页";
    
        manager = [[HHUserManager alloc] initWithRandomUser];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    
    tightlyFlowLayout = [[HHFlowTightlyLayout alloc] init];
    tightlyFlowLayout.delegate = self;
    tightlyFlowLayout.numberOfFollowItems = [manager.followUser count];
    NSLog(@"follow user = %lu", tightlyFlowLayout.numberOfFollowItems);
    tightlyFlowLayout.numberOfFoundItems = [manager.foundUser count];
    NSLog(@"found user = %lu", tightlyFlowLayout.numberOfFoundItems);
    tightlyFlowLayout.numberOfSameCityItems = [manager.sameCityUser count];
    NSLog(@"same city user = %lu", tightlyFlowLayout.numberOfSameCityItems);
    homeCollectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:tightlyFlowLayout];

    [self.view addSubview:homeCollectionView];
    homeCollectionView.delegate = self;
    homeCollectionView.dataSource = self;
    [homeCollectionView setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1]];
    
    
    
    [homeCollectionView registerClass:[HHHomeDoubleCollectionViewCell class] forCellWithReuseIdentifier:@"HHHomeDoubleCollectionViewCell"];
    
    self.navigationItem.titleView = [self createNavBarTitleView];
    
    [followButton addTarget:self action:@selector(followButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [foundButton addTarget:self action:@selector(foundButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [cityButton addTarget:self action:@selector(cityButtonClick) forControlEvents:UIControlEventTouchUpInside];
    followButton.selected = YES;
    navBarState = HHNavFollowButtonClick;
    
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

#pragma mark - navigation bar

- (UIView *)createNavBarTitleView {
    navBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    
    [self createNavLeftButtonImageName];
    
    followButton = [self createNavBarButtonWithCGRect:CGRectMake(25, 0, 80, 30) titleText:@"关注"];
    foundButton = [self createNavBarButtonWithCGRect:CGRectMake(105, 0, 80, 30) titleText:@"发现"];
    cityButton = [self createNavBarButtonWithCGRect:CGRectMake(185, 0, 80, 30) titleText:@"同城"];
    
    return navBarView;
}

- (void)createNavLeftButtonImageName {
    fastSettingListButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [fastSettingListButton setImage:[UIImage systemImageNamed:@"list.bullet"] forState:UIControlStateNormal];
    [fastSettingListButton setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:fastSettingListButton];
    
    fastSearchButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [fastSearchButton setImage:[UIImage systemImageNamed:@"magnifyingglass"] forState:UIControlStateNormal];
    [fastSearchButton setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:fastSearchButton];
}

- (UIButton *)createNavBarButtonWithCGRect:(CGRect)rect titleText:(NSString *)title {
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
    [button setBackgroundColor:[UIColor whiteColor]];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [navBarView addSubview:button];
    return button;
}




#pragma mark - collection view data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (navBarState == HHNavFollowButtonClick) {
        return [manager followCount];
    } else if (navBarState == HHNavCityButtonClick) {
        return [manager sameCityCount];
    } else {
        return [manager.foundUser count];
    }
    return [manager followCount];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HHHomeDoubleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HHHomeDoubleCollectionViewCell" forIndexPath:indexPath];
    
    HHUserInfo *info;
    if (navBarState == HHNavFollowButtonClick) {
        info = manager.followUser[indexPath.row];
    } else if (navBarState == HHNavCityButtonClick) {
        info = manager.sameCityUser[indexPath.row];
    } else {
        info = manager.foundUser[indexPath.row];
    }
    
    [cell setCellStateUserInfo:info];
    [cell setCellShowType:navBarState];
    
    return cell;
}


#pragma mark - collection view flow layout delegate

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    HHUserInfo *info;
//    if (navBarState == HHNavFollowButtonClick) {
//        info = manager.followUser[indexPath.row];
//    } else if (navBarState == HHNavCityButtonClick) {
//        info = manager.sameCityUser[indexPath.row];
//    } else {
//        info = manager.foundUser[indexPath.row];
//    }
//    return CGSizeMake((self.view.frame.size.width - 30) / 2, info.height);
////    return CGSizeMake(tightlyFlowLayout.itemWidth, info.height);
//}

//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
//    return 10;
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//    return 10;
//}
//
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    return UIEdgeInsetsMake(10, 10, 10, 10);
//}

#pragma mark - collection view delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController pushViewController:[[HHSelectedController alloc] init] animated:YES];
}

#pragma mark - HHFlow tightly layout delegate
- (CGFloat)HeightForItemWithIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)width{
    HHUserInfo *info;
    if (navBarState == HHNavFollowButtonClick && indexPath.row < [manager followCount]) {
        info = manager.followUser[indexPath.row];
    } else if (navBarState == HHNavCityButtonClick && indexPath.row < [manager sameCityCount]) {
        info = manager.sameCityUser[indexPath.row];
    } else if (navBarState == HHNavFoundButtonClick && indexPath.row < [manager.foundUser count]) {
        info = manager.foundUser[indexPath.row];
    }
    return info.height;
}


#pragma mark - navigation bar button
- (void)followButtonClick {
    followButton.selected = YES;
    foundButton.selected = NO;
    cityButton.selected = NO;
    
    navBarState = HHNavFollowButtonClick;
    tightlyFlowLayout.navBarState = navBarState;
    [homeCollectionView reloadData];
}

- (void)foundButtonClick {
    followButton.selected = NO;
    foundButton.selected = YES;
    cityButton.selected = NO;
    
    navBarState = HHNavFoundButtonClick;
    tightlyFlowLayout.navBarState = navBarState;
    [homeCollectionView reloadData];
}

- (void)cityButtonClick {
    followButton.selected = NO;
    foundButton.selected = NO;
    cityButton.selected = YES;
    
    navBarState = HHNavCityButtonClick;
    tightlyFlowLayout.navBarState = navBarState;
    [homeCollectionView reloadData];
}



@end
