//
//  ViewController.m
//  YQStringTool
//
//  Created by zyqiong on 16/10/12.
//  Copyright © 2016年 zyqiong. All rights reserved.
//

#import "ViewController.h"
#import "RBToolHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *aaa = [RBSandboxFile GetTmpPath];
    NSLog(@"%@",aaa);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
