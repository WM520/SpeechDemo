//
//  ViewController.m
//  test
//
//  Created by foreverlove on 17/3/6.
//  Copyright © 2017年 foreverlove. All rights reserved.
//

#import "ViewController.h"
#import "THSpeechController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor = [UIColor redColor];
    THSpeechController *th = [THSpeechController speechcontroller];
    [th beginConversation];
    [self.view addSubview:th.speechView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
