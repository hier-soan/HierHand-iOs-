//
//  HHSelectedController.m
//  HierHand
//
//  Created by hiersoan on 2023/7/21.
//

#import "HHSelectedController.h"
#import "HHSelectedTableViewCell.h"
#import "HHProfilePageController.h"
#import "HHUserManager.h"
#import "HHWorksManager.h"

@interface HHSelectedController ()

@property(nonatomic)NSUInteger currentCellIndex;

@property(nonatomic)NSUInteger lastCellIndex;

@property(nonatomic)NSUInteger testCellTotalNumber;

@property(nonatomic)HHCommentBottomElement *commentBottomElement;

@property(nonatomic)HHUserManager *userManager;
    
@end

@implementation HHSelectedController

- (id)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"精选";
        _testCellTotalNumber = 50;
        _currentCellIndex = 1;
        _lastCellIndex = 1;
        
        _userManager = [HHUserManager sharedUserManager];
    }
    return self;
}

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    if (_isHomeComein == YES) {
        [self changeInHomeSelectedView];
    }
    
    CGRect tempTabBarFrame = self.tabBarController.tabBar.frame;
    CGRect tableViewFrame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, tempTabBarFrame.origin.y);
    
    self.tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.view.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    [self.view setBackgroundColor:[UIColor blackColor]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 解决一进上下滑页面导航栏仍未透明的问题
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.1 delay:0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
            [weakSelf.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:weakSelf.currentCellIndex - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        } completion:^(BOOL finish) {

        }];
    });
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self changeInOtherView];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationController.navigationBar setShadowImage:nil];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor whiteColor]];
}

#pragma mark - public methods

// 切换到个人简介
- (void)showProfilePage {
    HHProfilePageController *profilePage = [[HHProfilePageController alloc] init];
    [self.navigationController pushViewController:profilePage animated:YES];
    [self.navigationController setHidesBottomBarWhenPushed:YES];
    
    self.navigationController.navigationBar.backItem.title = @"";
}


#pragma mark - private methods
- (void)changeInHomeSelectedView {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    // tabbar原点不是左上角的点？ no working
    // [self setCommentBottomElementOrigin:self.tabBarController.tabBar.frame.origin];
    self.commentBottomElement = [[HHCommentBottomElement alloc] init];
    [self.view addSubview:self.commentBottomElement];
    CGRect tempFrame = self.tabBarController.tabBar.frame;
    [self setCommentBottomElementOrigin:CGPointMake(0, tempFrame.origin.y)];
}

- (void)setCommentBottomElementOrigin:(CGPoint)origin {
    CGRect tempFrame = _commentBottomElement.frame;
    tempFrame.origin = origin;
    _commentBottomElement.frame = tempFrame;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGRect tempTabBarFrame = self.tabBarController.tabBar.frame;
    return tempTabBarFrame.origin.y;
}

#pragma mark - table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _testCellTotalNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HHSelectedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HHSelectedTableViewCell"];
    
    if (!cell) {
        cell = [[HHSelectedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HHSelectedTableViewCell"];
        
        if (_isHomeComeInFirstTime) {
            // 从首页双列选择的cell拿信息
            cell.homeComeInFirstUser = self.homeInUser;
            cell.homeComeInFirstWorks = self.homeInWork;
            [cell initBackground];
            _isHomeComeInFirstTime = NO;
        } else {
            // 在没有重用之前，随机拿取作品
            [cell reloadBackground];
        }
    }

    return cell;
}

#pragma mark - scroll view delegate 上下滑

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                  willDecelerate:(BOOL)decelerate {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        // problem
        __weak typeof(self) weakSelf = self;
        bool cellChange = NO;
        
        CGPoint panTranslation = [scrollView.panGestureRecognizer translationInView:scrollView];
        scrollView.panGestureRecognizer.enabled = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        
        if (panTranslation.y < -10 && weakSelf.currentCellIndex < weakSelf.testCellTotalNumber) {
            weakSelf.currentCellIndex++;
            cellChange = YES;
        } else if (panTranslation.y > 10 && weakSelf.currentCellIndex > 1) {
            weakSelf.currentCellIndex--;
            cellChange = YES;
        }
        if (cellChange) {
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                // Block implicitly retains 'self'; explicitly mention 'self' to indicate this is intended behavior
                // [_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:currentCell inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
                
                // why is position bottom ?
                // indexPath中的row是从0开始
                [weakSelf.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:weakSelf.currentCellIndex - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
            } completion:^(BOOL finish) {
            }];
        }
        
        scrollView.panGestureRecognizer.enabled = YES;
        weakSelf.lastCellIndex = weakSelf.currentCellIndex;
    });
}
@end
