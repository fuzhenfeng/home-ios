//
//  LoginController.m
//  home
//
//  Created by 傅振锋 on 2023/3/31.
//

#import "LoginController.h"
#import "ATextField.h"
#import "HomeController.h"

@interface LoginController ()

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
//    [self.view.layer addSublayer: [self backgroundLayer]];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [self setUp];
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
}

-(void)setUp {
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 50)];
    titleLabel.center = CGPointMake(self.view.center.x, 150);
//    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = @"LRAnimations";//@"CLOVER";
    titleLabel.font = [UIFont systemFontOfSize:40.f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    
    UILabel *detail = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 30)];
    detail.center = CGPointMake(self.view.center.x,630);
//    detail.textColor = [UIColor whiteColor];
    detail.text = @"Don`t have an account yet? Sign Up";
    detail.font = [UIFont systemFontOfSize:13.f];
    detail.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:detail];
    
    ATextField *username = [[ATextField alloc]initWithFrame:CGRectMake(0, 0, 270, 30)];
    username.center = CGPointMake(self.view.center.x, 350);
    username.lr_placeholder = @"Username";
    username.tag = 0;
    [self.view addSubview:username];
    
    ATextField *password = [[ATextField alloc]initWithFrame:CGRectMake(0, 0, 270, 30)];
    password.center = CGPointMake(self.view.center.x, username.center.y+60);
    password.lr_placeholder = @"Password";
    password.tag = 1;
    [self.view addSubview:password];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    UIButton* button = [UIButton buttonWithType: UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 200, 44);
    button.center = CGPointMake(self.view.center.x, password.center.y+100);
    [button setTitle:@"登录" forState:UIControlStateNormal];
    [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [button setBackgroundColor:UIColor.blueColor];
    [button addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview: button];
}

- (void)login:(id) sender {
    HomeController *vc = [[HomeController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(CAGradientLayer *)backgroundLayer{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view.bounds;
    gradientLayer.colors = @[(__bridge id)[UIColor blueColor].CGColor,(__bridge id)[UIColor cyanColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0.5, 0);
    gradientLayer.endPoint = CGPointMake(0.5, 1);
    gradientLayer.locations = @[@0.68,@1];
    return gradientLayer;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
