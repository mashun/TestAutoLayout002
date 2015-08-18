//
//  FirstViewController.m
//  TestAutoLayout003
//
//  Created by dev on 15/5/22.
//  Copyright (c) 2015年 dev. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstTableViewCell.h"


@interface FirstViewController ()<UITableViewDataSource, UITableViewDelegate, FirstTableViewCellDelegate>
{
    UITableView  *_tableView;
    NSDictionary *_dic;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"tableView的自适应";
    
    
    
    
    //做自适应的时候,只需要对该视图的父试图做约束就可以,不需要在对其自身添加约束
    //例如:UITableView的cell要想实现自适应,只需要对UITableView
    
    __weak typeof(self) weakSelf = self;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        UIEdgeInsets padding = UIEdgeInsetsMake(0, 0, 0, 0);
        make.edges.equalTo(weakSelf.view).with.insets(padding);
    }];
    [self requestDB];
    
}

- (void)requestDB {
    _dic = @{@"title": @"titletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
             @"content": @"eontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontenteontent"};
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[FirstTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.delegate = self;
    cell.dict = _dic;
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [FirstTableViewCell getCellHeight:_dic];
}

//8.0之后可以用此方法判断手机是否转屏
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [_tableView reloadData];
    
}
//8.0之前可以用此方法判断手机是否转屏
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [_tableView reloadData];
    NSLog(@"------");
}


#pragma mark - FirstTableViewCellDelegate
- (void)clickDetailButton:(FirstTableViewCell *)cell
{
    NSIndexPath *indexPath = [_tableView indexPathForCell:cell];
    NSLog(@"%ld", (long)indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
