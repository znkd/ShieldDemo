//
//  MainTabBarViewController.m
//  ShieldDemo
//
//  Created by eric on 2021/9/3.
//

#import "MainTabBarViewController.h"
#import "CatagoryTableViewController.h"
#import "MainTableViewCell.h"

@interface MainTabBarViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CatagoryTableViewController* ctvvc = [[CatagoryTableViewController alloc]initWithNibName:nil bundle:nil];
    //ctvvc.tableView.rowHeight;// = auto
    ctvvc.tableView.delegate = self;
    ctvvc.tableView.dataSource = self;
    
    ctvvc.tableView.estimatedRowHeight = 10.0f;
    ctvvc.tableView.rowHeight = UITableViewAutomaticDimension;
    
    ctvvc.title = @"DemoStyles";
    UIViewController* vc2 = [[UIViewController alloc]initWithNibName:nil bundle:nil];
    
//    asl_msg_t* merged_msg;
    
    vc2.title = @"others";
    UIViewController* vc3 = [[UIViewController alloc]initWithNibName:nil bundle:nil];
    vc3.title = @"My";
    
    self.viewControllers = @[ctvvc,vc2,vc3];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* selectCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (selectCell) {
//        selectCell.highlighted = NO;
//        selectCell.selectionStyle = UITableViewCellSelectionStyleBlue;
    }
}

- (void)btnclick
{
    NSLog(@"cell btn clicked");
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString* reuseIdentifier = @"DemoStyleCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[MainTableViewCell alloc]initWithMainCellStyle:1 reuseIdentifier:reuseIdentifier indexPath:indexPath];
    }
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.demoStylesArr.count;
}


- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    [super preferredContentSizeDidChangeForChildContentContainer:container];
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    return [super sizeForChildContentContainer:container withParentContainerSize:parentSize];
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    [super systemLayoutFittingSizeDidChangeForChildContentContainer:container];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    [super didUpdateFocusInContext:context withAnimationCoordinator:coordinator];
}

- (void)setNeedsFocusUpdate {
    [super setNeedsFocusUpdate];
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    return [super shouldUpdateFocusInContext:context];
}

- (void)updateFocusIfNeeded {
    [super updateFocusIfNeeded];
}

@end
