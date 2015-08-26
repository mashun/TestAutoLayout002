//
//  ViewController.m
//  TestAutoLayout003
//
//  Created by dev on 15/5/22.
//  Copyright (c) 2015年 dev. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"


@interface ViewController ()
{
    UIScrollView *_scrollView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.title = @"自适应AutoLayout";

    //背景视图
    UIView *bigView = [[UIView alloc] init];
    bigView.backgroundColor = [UIColor redColor];
    bigView.layer.cornerRadius = 4.;
    bigView.layer.masksToBounds = YES;
    [self.view addSubview:bigView];
    
#pragma mark - 给背景图添加约束(添加的约束必须要能够确定该控件的位置,不然编译的时候就会报错)
    [bigView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(40 + 64);
        make.height.mas_equalTo(88);
        make.right.mas_equalTo(-15);
        make.left.mas_equalTo(15);
    }];
    
    //账号
    UITextField *firstTf = [[UITextField alloc] init];
    firstTf.backgroundColor = [UIColor yellowColor];
    firstTf.placeholder = @"账号";
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 44)];
    leftView.backgroundColor = [UIColor grayColor];
    firstTf.leftView = leftView;
    firstTf.leftViewMode = UITextFieldViewModeAlways;
    [bigView addSubview:firstTf];
    
    //密码
    UITextField *secondTf = [[UITextField alloc] init];
    secondTf.backgroundColor = [UIColor orangeColor];
    secondTf.placeholder = @"密码";
    UIView *leftView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 44)];
    leftView1.backgroundColor = [UIColor lightGrayColor];
    secondTf.leftViewMode = UITextFieldViewModeAlways;
    secondTf.leftView = leftView1;
    [bigView addSubview:secondTf];
    
    //添加约束
    [firstTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(44);
        make.right.mas_equalTo(-0);
        make.left.mas_equalTo(0);
    }];

    //添加约束
    [secondTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(44);
        make.height.mas_equalTo(44);
        make.right.mas_equalTo(-0);
        make.left.mas_equalTo(0);
    }];
    
    //登录按钮
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    loginButton.backgroundColor = [UIColor redColor];
    loginButton.layer.cornerRadius = 4;
    loginButton.layer.masksToBounds = YES;
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton addTarget:self
                    action:@selector(first)
          forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    //添加约束
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bigView.mas_bottom).with.offset(20);
        make.right.mas_equalTo(-15);
        make.left.mas_equalTo(15);
        make.height.mas_equalTo(44);
    }];
    
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    registerButton.backgroundColor = [UIColor grayColor];
    registerButton.layer.cornerRadius = 4;
    registerButton.layer.masksToBounds = YES;
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(registerButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
    //添加约束
    [registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(loginButton.mas_left);
        make.top.equalTo(loginButton.mas_bottom).with.offset(20);
        make.height.equalTo(@44);
        make.right.equalTo(@-15);
    }];
}

- (void)registerButton {
    NSLog(@"注册");
}

- (void)first {
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:firstVC animated:YES];
}

//点击空白区域收回键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
