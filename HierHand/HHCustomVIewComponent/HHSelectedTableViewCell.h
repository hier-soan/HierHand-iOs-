//
//  HHSelectedTableViewCell.h
//  HierHand
//
//  Created by hiersoan on 2023/7/24.
//

#import <UIKit/UIKit.h>
#import "HHSelectedToolBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHSelectedTableViewCell : UITableViewCell <HHBaseAvatarElementDelegate, HHToolBarViewDelegate>

@property(nonatomic) HHSelectedToolBar *toolBar;

@property(nonatomic)NSString *homeComeInFirstUser;

@property(nonatomic)NSString *homeComeInFirstWorks;

- (void)initBackground;

- (void)reloadBackground;

- (void)addCommentView;

@end

NS_ASSUME_NONNULL_END
