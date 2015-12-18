//
//  ViewController.m
//  03-归档和解挡
//
//  Created by apple on 15/1/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

/**
 归档和解挡开发中很少使用
 主要是用在自定义对象存储
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 归档
    Person *p = [[Person alloc] init];
    p.name = @"zhangsan";
    p.age = 18;
    
    //
    [NSKeyedArchiver archiveRootObject:p toFile:@"/Users/apple/Desktop/123.plist"];
    
    // 解挡
    Person *p1 = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/apple/Desktop/123.plist"];
    
    NSLog(@"%@", p1.name);

}

@end
