//
//  HHSelectedTableViewCell.m
//  HierHand
//
//  Created by hiersoan on 2023/7/24.
//

#import "HHSelectedTableViewCell.h"
#import "HHCommentView.h"
#import "HHSelectedController.h"
#import "HHBaseWorks.h"
#import "HHWorksManager.h"
#import "HHSelectedDetailComponent.h"
#import "HHVideoPlayerHelper.h"

@interface HHSelectedTableViewCell()

@property(nonatomic) BOOL isCommentViewOpen;

@property(nonatomic) HHCommentView *commentView;

@property(nonatomic) HHBaseWorks *works;

@property(nonatomic) BOOL isSuspend;

@property(nonatomic) UIImageView *suspendView;

@property(nonatomic) HHSelectedDetailComponent *detailComponent;

@property(nonatomic) HHUserInfo *ownerUser;

@property(nonatomic) HHVideoPlayerHelper *videoHelper;

@end

@implementation HHSelectedTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 要用委托的方法来创建高度
//        self.contentView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 800); // problem
        
        _toolBar = [[HHSelectedToolBar alloc] init];
        CGRect tempFrame = _toolBar.frame;
        tempFrame.origin.x = [[UIScreen mainScreen] bounds].size.width - _toolBar.frame.size.width;
        tempFrame.origin.y = 300;
        _toolBar.frame = tempFrame;
        _toolBar.avatar.delegate = self;
        _toolBar.delegate = self;
        // 置最上层，防止被视频遮住
        _toolBar.layer.zPosition = MAXFLOAT;
        [self.contentView addSubview:_toolBar];
        
        _detailComponent = [[HHSelectedDetailComponent alloc] init];
        // 置最上层，防止被视频遮住
        _detailComponent.layer.zPosition = MAXFLOAT;
        [self.contentView addSubview:_detailComponent];
        _ownerUser = [[HHUserInfo alloc] init];
        
        // 添加点击手势识别 - 点赞、暂停、收回评论
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTapScreen)];
        [self.contentView addGestureRecognizer:tapGesture];
        
        // 测试
        _isSuspend = NO;
        
        _videoHelper = [[HHVideoPlayerHelper alloc] init];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    [self reloadBackground];
}

#pragma mark - public methods

- (void)initBackground {
    _works = [[HHWorksManager sharedManager] getWorksWithId:_homeComeInFirstWorks];
    _ownerUser = _works.owner;
    [self initInfo];
    [self.contentView setBackgroundColor:_works.backgroundColor];
}

- (void)reloadBackground {
    _works = [[HHWorksManager sharedManager] getRandomWorks];
    _ownerUser = _works.owner;
    [self initInfo];
    [self.contentView setBackgroundColor:_works.backgroundColor];
}

- (void)initInfo {
    [_detailComponent setDetailComponentWithUserName:_ownerUser.userName description:@"这是一段描述这是一段描述" musicName:@"无音乐"];
    
    [_videoHelper playVideoOnView:self.contentView];
}

- (void)addCommentView {
    self.commentView = [[HHCommentView alloc] init];
    CGRect temp = self.commentView.frame;
    temp.origin = CGPointMake(0, [[UIScreen mainScreen] bounds].size.height);
    self.commentView.frame = temp;
    [self.contentView addSubview:self.commentView];
    // problem: why async
    
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            CGRect blockTemp = weakSelf.commentView.frame;
            blockTemp.origin = CGPointMake(0, [[UIScreen mainScreen] bounds].size.height * 0.3);
            weakSelf.commentView.frame = blockTemp;
        } completion:^(BOOL finish){
            weakSelf.isCommentViewOpen = YES;
        }];
    });
}

#pragma mark - private methods

- (void)userTapScreen {
    if (_isCommentViewOpen == YES) { // 收回评论
        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                CGRect blockTemp = weakSelf.commentView.frame;
                blockTemp.origin = CGPointMake(0, [[UIScreen mainScreen] bounds].size.height);
                weakSelf.commentView.frame = blockTemp;
            } completion:^(BOOL finish){
                weakSelf.isCommentViewOpen = NO;
                [weakSelf.commentView removeFromSuperview];
                
                // problem: 是否需要release （在arc应该不需要）
                self.commentView = nil;
                
            }];
        });
    } else if (!_isSuspend) {   // 暂停页面
        _suspendView = [[UIImageView alloc] init];
        [_suspendView setImage:[UIImage systemImageNamed:@"play.fill"]];
        [_suspendView setTintColor:[UIColor whiteColor]];
        [_suspendView setAlpha:0.2f];
        _suspendView.frame = CGRectMake(self.contentView.center.x - 100, self.contentView.center.y - 100, 200, 200);
        [self.contentView addSubview:_suspendView];
        
        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                weakSelf.suspendView.frame = CGRectMake(self.contentView.center.x - 50, self.contentView.center.y - 50, 100, 100);
                [weakSelf.suspendView setAlpha:0.5f];
            } completion:^(BOOL finish) {
                weakSelf.isSuspend = YES;
                [weakSelf.videoHelper suspendVideo];
            }];
        });
    } else if (_isSuspend) {    // 取消暂停
        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                weakSelf.suspendView.frame = CGRectMake(self.contentView.center.x - 100, self.contentView.center.y - 100, 200, 200);
                [weakSelf.suspendView setAlpha:0.2f];
            } completion:^(BOOL finish) {
                weakSelf.isSuspend = NO;
                [weakSelf.suspendView removeFromSuperview];
                [weakSelf.videoHelper continueVideo];
                
                weakSelf.suspendView = nil;
            }];
        });
    }
}

#pragma mark - avatar element delegate

- (void)avatarDidTap {
    // 把用户信息传入，从而转移到关注界面
    NSLog(@"点击作者头像，传入作者相关信息，即将进入作者个人页面");
    
    // problem:
    // 直接获取父控件
    for (UIView *view = [self superview]; view; view = [view superview]) {
        UIResponder *responder = [view nextResponder];
        if ([responder isKindOfClass:[HHSelectedController class]]) {
            HHSelectedController *selectedController = (HHSelectedController *)responder;
            [selectedController showProfilePage];
        }
    }
}

#pragma mark - tool bar view delegate

- (void)toolBarElementDidTap:( HHToolBarElement * _Nonnull )element atRow:(NSUInteger)row {
    NSLog(@"view layer get");
    switch (row) {
        case 1: {   // 点赞
            
        }break;
        case 2: {   // 评论
            [self addCommentView];
        }break;
        case 3: {   // 收藏
            
        }break;
        case 4: {   // 分享
            
        }break;
    }
}

@end
