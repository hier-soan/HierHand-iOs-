//
//  HHSelectedController.h
//  HierHand
//
//  Created by hiersoan on 2023/7/21.
//

#import <UIKit/UIKit.h>
#import "HHBaseViewController.h"
#import "HHSelectedToolBar.h"
#import "HHCommentBottomElement.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHSelectedController : HHBaseViewController <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property(nonatomic) UITableView *tableView;

@property(nonatomic) BOOL isHomeComein;

@property(nonatomic) BOOL isHomeComeInFirstTime;

// 从首页点击进入的用户名
@property(nonatomic) NSString* homeInUser;

// 从首页点击进入的作品名
@property(nonatomic) NSString *homeInWork;

- (void)showProfilePage;

@end

NS_ASSUME_NONNULL_END
