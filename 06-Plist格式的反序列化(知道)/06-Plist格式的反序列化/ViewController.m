//
//  ViewController.m
//  06-Plist格式的反序列化
//
//  Created by apple on 15/1/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. url
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/videos.plist"];
    
    // 2. 请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3. 连接
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
//       [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
        /**
         NSPropertyListImmutable =  不可变
         NSPropertyListMutableContainers = 整个数据容器的可变
         NSPropertyListMutableContainersAndLeaves 叶子节点和容器都可变
         */
        id result = [NSPropertyListSerialization propertyListWithData:data options:0 format:NULL error:NULL];
        
        
        
        NSLog(@"result = %@---%@", result, [result class]);
    }];
}

@end
