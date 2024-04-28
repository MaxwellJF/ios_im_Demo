//
//  ViewController.m
//  imsdk_demo
//
//  Created by 张旭东 on 2024/4/25.
//

#import "ViewController.h"
#import "LEIGODIMCommonDelegate.h"
#import "LEIGODIMCommonManager.h"
#import "LEIGODIMLoginManager.h"

#define kLog(data) NSLog(@"%@", [NSString stringWithFormat:@"%@", data]);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor blueColor];
    btn.frame = CGRectMake(60, 60, 200, 80);
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

- (void)btnClicked:(UIButton *)sender {
    kLog(@"点击了button1")
    // 获取Caches目录路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDirectory = [paths objectAtIndex:0];
    kLog(cachesDirectory)
    [[LEIGODIMCommonManager sharedCommonManager] sdkSetConfig:cachesDirectory maxLogSize:10 * 1024 * 1024 numLogSize:5];
    
    // 初始化
    [[LEIGODIMCommonManager sharedCommonManager] sdkInitWithServerLSBURL:@"test1-imapi-gw.nn.com" serverLSBPort:@"80" appId:@"nnMobileIm_6z0g3ut7" imToken:@"Leigod eyJhbGciOiJIUzI1NiJ9.eyJ2YWx1ZSI6eyJuYW1lIjoic3lzdGVtIiwidXNlcklkIjoiOTk5OTkiLCJhdmF0YXJVcmwiOm51bGx9LCJlZmYiOjIwMjM1OTE4MDM3MjJ9.p8omb5ra5g9-1Q1slTmxWsFRsstKMLVYi4M6EUcksDI" succ:^(NSString *data) {
        kLog(data)
        [[LEIGODIMLoginManager sharedLoginManager] sdkLogin:3 userId:6 succ:^(NSString *data) {
            kLog(data)
            [[LEIGODIMLoginManager sharedLoginManager] sdkGetSessionList:^(NSString *data) {
                kLog(data)
            } fail:^(int code, NSString *msg) {
                kLog(msg)
            }];
        } fail:^(int code, NSString *msg) {
            kLog(@"login failed")
        }];
    } fail:^(int code, NSString *msg) {
        kLog(msg)
    }];
}

@end
