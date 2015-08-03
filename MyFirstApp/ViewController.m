//
//  ViewController.m
//  MyFirstApp
//
//  Created by 李峰艳 on 15/6/24.
//  Copyright (c) 2015年 李峰艳. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, readwrite, nonatomic) UIAlertView *alertView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //声明容器
    CGRect frame = CGRectMake(90, 200, 200, 60);
    //定义按钮指针
    UIButton *someAddButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //定义按钮背景颜色
    someAddButton.backgroundColor = [UIColor clearColor];
    //设置按钮内容
    [someAddButton setTitle:@"动态添加一个按钮!" forState:UIControlStateNormal];
    //将按钮的容器指向最开始声明的容器
    someAddButton.frame = frame;
    //给按钮绑定事件
    [someAddButton addTarget:self
                      action:@selector(someButtonClicked)
            forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:someAddButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doGood:(id)sender{
    NSLog(@"sing");
}
- (void) startGood: (int)sina bad:(NSString*)bad {
    
    NSLog(@"view %d,%@", sina, bad);
}

- (IBAction)someButtonClicked {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:@"您点击了动态按钮！"
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
    [self startGood:234 bad:@"fuck"];
    
}

- (IBAction)doAction:(id)sender {
    /*
    NSLog(@"good");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:@"这是个死的！"
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
     */
    
    [self TestCallback:^(NSString *s, int i) {
        NSLog(@"%@", s);
        NSLog(@"%i", i);
    }];
    
    [self startShowIndicatorAlert];
}

- (void) startShowIndicatorAlert {
    
    self.alertView = [[UIAlertView alloc] initWithTitle:@"请稍候..."
                                                message:nil
                                               delegate:self
                                      cancelButtonTitle:nil
                                      otherButtonTitles:nil, nil];
    [self.alertView show];
    
    UIActivityIndicatorView *aiv = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    aiv.center = CGPointMake(self.alertView.bounds.size.width/2.0f, -9.0f);
    [self.alertView addSubview:aiv];
    [aiv startAnimating];
    
    [self performSelector:@selector(hideIndicatorAlert) withObject:nil afterDelay:3.0f];
    /*
     self.alertController = [UIAlertController alertControllerWithTitle:@"标题"
     message:@"这个是UIAlertController的默认样式"
     preferredStyle:UIAlertControllerStyleAlert];
     
     [self presentViewController:self.alertController
     animated:NO
     completion:^{
     
     }];
     */
    
}

- (void)didPresentAlertView:(UIAlertView *)alertView{
    NSLog(@"had show!height=%f",self.alertView.bounds.size.height);
}

- (void) hideIndicatorAlert{
    [self.alertView dismissWithClickedButtonIndex:0 animated:NO];
    //    [self.alertController dismissViewControllerAnimated:YES completion:^{}];
}


-(void) callbak: (NSString*)s gogo:(int)i{
    
}

- (void) TestCallback: (void(^)(NSString *, int))handler {
    NSString *good = @"gidi";
    int i = 900;
    
    handler(good, i);
}
/*
- (void)dealloc {
    //[_btnGood release];
    [super dealloc];
}
 */
@end
