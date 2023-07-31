//
//  HHFollowPageController.m
//  HierHand
//
//  Created by hiersoan on 2023/7/26.
//

#import "HHProfilePageController.h"
#import "HHProfileBackgroundView.h"
#import "HHProfilePageHeader.h"
#import "HHProfilePageFooter.h"

@interface HHProfilePageController ()

@property(nonatomic) HHProfilePageHeader *header;

@property(nonatomic) HHProfilePageFooter *footer;


@end

@implementation HHProfilePageController

- (id)init {
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        
        _header = [[HHProfilePageHeader alloc] init];
        [self.view addSubview:_header];
        
        _footer = [[HHProfilePageFooter alloc] init];
        CGRect temp = _footer.frame;
        temp.origin = CGPointMake(0, CGRectGetMaxY(_header.frame));
        _footer.frame = temp;
        [self.view addSubview:_footer];
    }
    return self;
}

#pragma mark - lazy load


#pragma mark - life cycle

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - private method

@end
