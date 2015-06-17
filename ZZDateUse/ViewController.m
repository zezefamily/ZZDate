//
//  ViewController.m
//  ZZDateUse
//
//  Created by zezefamily on 15/6/13.
//  Copyright (c) 2015年 zezefamily. All rights reserved.
//

#import "ViewController.h"
#import "ZZDate.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *yestaday;
@property (weak, nonatomic) IBOutlet UILabel *today;
@property (weak, nonatomic) IBOutlet UILabel *tomorrow;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"str == %@",[ZZDate getTimsStrWithString:@"12"]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
