//
//  HHHomeViewController.m
//  HierHand
//
//  Created by hiersoan on 2023/7/21.
//

#import "HHHomeViewController.h"
#import "HHHomeDoubleCollectionViewCell.h"
#import "HHSelectedController.h"
#import "HHSlipSliderView.h"

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
    
    HHUserManager *userManager;
    HHNavBarState navBarState;
}

@property(nonatomic) NSUInteger worksIndex;

- (UIView *)createNavBarTitleView;

- (UIButton *)createNavBarButtonWithCGRect:(CGRect)rect titleText:(NSString *)title;

- (void)createNavLeftButtonImageName;

@end

@implementation HHHomeViewController

- (id)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"首页";
    
        userManager = [HHUserManager sharedUserManager];
        
        _worksIndex = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationController.navigationBar.translucent = NO;
    
    tightlyFlowLayout = [[HHFlowTightlyLayout alloc] init];
    tightlyFlowLayout.delegate = self;
    tightlyFlowLayout.numberOfFollowItems = [userManager followCount];
    tightlyFlowLayout.numberOfFoundItems = [userManager foundCount];
    tightlyFlowLayout.numberOfSameCityItems = [userManager sameCityCount];
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

#pragma mark - life cycle

- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
}

#pragma mark - navigation bar

// 创建导航栏按钮
- (UIView *)createNavBarTitleView {
    navBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    
    [self createNavLeftButtonImageName];
    
    followButton = [self createNavBarButtonWithCGRect:CGRectMake(25, 0, 80, 30) titleText:@"关注"];
    foundButton = [self createNavBarButtonWithCGRect:CGRectMake(105, 0, 80, 30) titleText:@"发现"];
    cityButton = [self createNavBarButtonWithCGRect:CGRectMake(185, 0, 80, 30) titleText:@"同城"];
    
    return navBarView;
}

// 创建首页导航栏左右按钮
- (void)createNavLeftButtonImageName {
    fastSettingListButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [fastSettingListButton setImage:[UIImage systemImageNamed:@"list.bullet"] forState:UIControlStateNormal];
    [fastSettingListButton setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:fastSettingListButton];
    [fastSettingListButton addTarget:self action:@selector(fastSettingListButtonTap) forControlEvents:UIControlEventTouchUpInside];
    
    fastSearchButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [fastSearchButton setImage:[UIImage systemImageNamed:@"magnifyingglass"] forState:UIControlStateNormal];
    [fastSearchButton setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:fastSearchButton];
}

// 首页右上角点击列表按钮
- (void)fastSettingListButtonTap {
    [HHSlipSliderView showSlipMenu];
}

// 创建首页顶部导航栏按钮
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
        return [userManager followCount];
    } else if (navBarState == HHNavCityButtonClick) {
        return [userManager sameCityCount];
    } else {
        return [userManager foundCount];
    }
    return [userManager followCount];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HHHomeDoubleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HHHomeDoubleCollectionViewCell" forIndexPath:indexPath];
    
    HHUserInfo *info;
    if (navBarState == HHNavFollowButtonClick) {
        info = userManager.getToFollowUser[indexPath.row];
    } else if (navBarState == HHNavCityButtonClick) {
        info = userManager.getSameCityUser[indexPath.row];
    } else {
        info = userManager.getFoundUser[indexPath.row];
    }
    
    // 选取最新作品，后续会改进最新作品的系数
    NSString *worksId = info.workIdentifications[_worksIndex];
    HHBaseWorks *works = [[HHWorksManager sharedManager] getWorksWithId:worksId];
    [cell setCellStateWorksInfo:works];
    [cell setCellShowType:navBarState];
    
    return cell;
}


#pragma mark - collection view delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    HHSelectedController *homeSelectedController = [[HHSelectedController alloc] init];
    
    // 从首页进入，在该view controller will appear时会调整样式
    homeSelectedController.isHomeComein = YES;
    homeSelectedController.isHomeComeInFirstTime = YES;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    switch (navBarState) {
        case HHNavFollowButtonClick: {
            self.navigationItem.backButtonTitle = @"关注";
            HHUserInfo *user = userManager.getToFollowUser[indexPath.row];
            homeSelectedController.homeInUser = user.userName;
            homeSelectedController.homeInWork = user.workIdentifications[_worksIndex];
        }break;
        case HHNavCityButtonClick: {
            self.navigationItem.backButtonTitle = @"同城";
            HHUserInfo *user = userManager.getSameCityUser[indexPath.row];
            homeSelectedController.homeInUser = user.userName;
            homeSelectedController.homeInWork = user.workIdentifications[_worksIndex];
        }break;
        case HHNavFoundButtonClick: {
            self.navigationItem.backButtonTitle = @"发现";
            HHUserInfo *user = userManager.getFoundUser[indexPath.row];
            homeSelectedController.homeInUser = user.userName;
            homeSelectedController.homeInWork = user.workIdentifications[_worksIndex];
        }break;
    }
    
    self.hidesBottomBarWhenPushed = YES;
    
    [self.tabBarController.tabBar setHidden:YES];
    
    [self.navigationController pushViewController:homeSelectedController animated:YES];
}

#pragma mark - HHFlow tightly layout delegate

// layout 比collection cell先执行
- (CGFloat)HeightForItemWithIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)width{
    HHUserInfo *info;
    if (navBarState == HHNavFollowButtonClick && indexPath.row < [userManager followCount]) { //
        info = userManager.getToFollowUser[indexPath.row];
    } else if (navBarState == HHNavCityButtonClick && indexPath.row < [userManager sameCityCount]) { //
        info = userManager.getSameCityUser[indexPath.row];
    } else if (navBarState == HHNavFoundButtonClick && indexPath.row < [userManager foundCount]) { //
        info = userManager.getFoundUser[indexPath.row];
    }
    
    if (info) {
        // 从作者中选取最新的作品，后续会改进最新作品的系数;
        NSString *worksId = info.workIdentifications[_worksIndex];
        HHBaseWorks *works = [[HHWorksManager sharedManager] getWorksWithId:worksId];

        return works.height;
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
