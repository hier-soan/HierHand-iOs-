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

@interface HHHomeViewController()

// 导航栏视图
@property(nonatomic) UIView *navBarView;

// 关注
@property(nonatomic) UIButton *followButton;

// 发现
@property(nonatomic) UIButton *foundButton;

// 同城
@property(nonatomic) UIButton *cityButton;

// 左上角侧滑菜单
@property(nonatomic) UIButton *fastSettingListButton;

// 快速搜索
@property(nonatomic) UIButton *fastSearchButton;

// 双列视图
@property(nonatomic) UICollectionView *homeCollectionView;

// 双列布局
@property(nonatomic) HHFlowTightlyLayout *tightlyFlowLayout;

// 用户model
@property(nonatomic) HHUserManager *userManager;

// 首页状态
@property(nonatomic) HHNavBarState navBarState;

// 显示作者的第几个作品，后续优化为：作者最新作品
@property(nonatomic) NSUInteger worksIndex;

@end

@implementation HHHomeViewController

- (id)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"首页";
    
        _userManager = [HHUserManager sharedUserManager];
        
        _worksIndex = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.navigationItem.titleView = [self createNavBarTitleView];
    
    // 初始化首页状态
    _followButton.selected = YES;
    _navBarState = HHNavFollowButtonClick;
}

#pragma mark - lazy load
- (UICollectionView *)homeCollectionView {
    if (!_homeCollectionView) {
        // 初始化双列布局
        _tightlyFlowLayout = [[HHFlowTightlyLayout alloc] init];
        _tightlyFlowLayout.delegate = self;
        _tightlyFlowLayout.numberOfFollowItems = [_userManager followCount];
        _tightlyFlowLayout.numberOfFoundItems = [_userManager foundCount];
        _tightlyFlowLayout.numberOfSameCityItems = [_userManager sameCityCount];
       
        _homeCollectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:_tightlyFlowLayout];
        _homeCollectionView.delegate = self;
        _homeCollectionView.dataSource = self;
        [_homeCollectionView setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1]];
        [self.view addSubview:_homeCollectionView];
        
        [_homeCollectionView registerClass:[HHHomeDoubleCollectionViewCell class] forCellWithReuseIdentifier:@"HHHomeDoubleCollectionViewCell"];
    }
    return _homeCollectionView;
}

#pragma mark - life cycle

- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
}

#pragma mark - navigation bar

// 创建导航栏按钮
- (UIView *)createNavBarTitleView {
    _navBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    
    [self createNavLeftButtonImageName];
    
    _followButton = [self createNavBarButtonWithCGRect:CGRectMake(25, 0, 80, 30) titleText:@"关注"];
    [_followButton addTarget:self action:@selector(followButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    _foundButton = [self createNavBarButtonWithCGRect:CGRectMake(105, 0, 80, 30) titleText:@"发现"];
    [_foundButton addTarget:self action:@selector(foundButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    _cityButton = [self createNavBarButtonWithCGRect:CGRectMake(185, 0, 80, 30) titleText:@"同城"];
    [_cityButton addTarget:self action:@selector(cityButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    return _navBarView;
}

// 创建首页导航栏左右按钮
- (void)createNavLeftButtonImageName {
    _fastSettingListButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [_fastSettingListButton setImage:[UIImage systemImageNamed:@"list.bullet"] forState:UIControlStateNormal];
    [_fastSettingListButton setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_fastSettingListButton];
    [_fastSettingListButton addTarget:self action:@selector(fastSettingListButtonTap) forControlEvents:UIControlEventTouchUpInside];
    
    _fastSearchButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [_fastSearchButton setImage:[UIImage systemImageNamed:@"magnifyingglass"] forState:UIControlStateNormal];
    [_fastSearchButton setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_fastSearchButton];
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
    [_navBarView addSubview:button];
    return button;
}

#pragma mark - collection view data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (_navBarState == HHNavFollowButtonClick) {
        return [_userManager followCount];
    } else if (_navBarState == HHNavCityButtonClick) {
        return [_userManager sameCityCount];
    } else {
        return [_userManager foundCount];
    }
    return [_userManager followCount];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HHHomeDoubleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HHHomeDoubleCollectionViewCell" forIndexPath:indexPath];
    
    HHUserInfo *info;
    if (_navBarState == HHNavFollowButtonClick) {
        info = _userManager.getToFollowUser[indexPath.row];
    } else if (_navBarState == HHNavCityButtonClick) {
        info = _userManager.getSameCityUser[indexPath.row];
    } else {
        info = _userManager.getFoundUser[indexPath.row];
    }
    
    // 选取最新作品，后续会改进最新作品的系数
    NSString *worksId = info.workIdentifications[_worksIndex];
    HHBaseWorks *works = [[HHWorksManager sharedManager] getWorksWithId:worksId];
    [cell setCellStateWorksInfo:works];
    [cell setCellShowType:_navBarState];
    
    return cell;
}


#pragma mark - collection view delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    HHSelectedController *homeSelectedController = [[HHSelectedController alloc] init];
    
    // 从首页进入，在该view controller will appear时会调整样式
    homeSelectedController.isHomeComein = YES;
    homeSelectedController.isHomeComeInFirstTime = YES;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    switch (_navBarState) {
        case HHNavFollowButtonClick: {
            self.navigationItem.backButtonTitle = @"关注";
            HHUserInfo *user = _userManager.getToFollowUser[indexPath.row];
            homeSelectedController.homeInUser = user.userName;
            homeSelectedController.homeInWork = user.workIdentifications[_worksIndex];
        }break;
        case HHNavCityButtonClick: {
            self.navigationItem.backButtonTitle = @"同城";
            HHUserInfo *user = _userManager.getSameCityUser[indexPath.row];
            homeSelectedController.homeInUser = user.userName;
            homeSelectedController.homeInWork = user.workIdentifications[_worksIndex];
        }break;
        case HHNavFoundButtonClick: {
            self.navigationItem.backButtonTitle = @"发现";
            HHUserInfo *user = _userManager.getFoundUser[indexPath.row];
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
    if (_navBarState == HHNavFollowButtonClick && indexPath.row < [_userManager followCount]) { //
        info = _userManager.getToFollowUser[indexPath.row];
    } else if (_navBarState == HHNavCityButtonClick && indexPath.row < [_userManager sameCityCount]) { //
        info = _userManager.getSameCityUser[indexPath.row];
    } else if (_navBarState == HHNavFoundButtonClick && indexPath.row < [_userManager foundCount]) { //
        info = _userManager.getFoundUser[indexPath.row];
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
    _followButton.selected = YES;
    _foundButton.selected = NO;
    _cityButton.selected = NO;
    
    _navBarState = HHNavFollowButtonClick;
    _tightlyFlowLayout.navBarState = _navBarState;
    [self.homeCollectionView reloadData];
}

- (void)foundButtonClick {
    _followButton.selected = NO;
    _foundButton.selected = YES;
    _cityButton.selected = NO;
    
    _navBarState = HHNavFoundButtonClick;
    _tightlyFlowLayout.navBarState = _navBarState;
    [self.homeCollectionView reloadData];
}

- (void)cityButtonClick {
    _followButton.selected = NO;
    _foundButton.selected = NO;
    _cityButton.selected = YES;
    
    _navBarState = HHNavCityButtonClick;
    _tightlyFlowLayout.navBarState = _navBarState;
    [self.homeCollectionView reloadData];
}



@end
