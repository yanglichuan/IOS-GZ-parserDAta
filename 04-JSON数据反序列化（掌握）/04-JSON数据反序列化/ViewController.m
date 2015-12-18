//
//  ViewController.m
//  04-JSON数据反序列化(解析)
//
//  Created by apple on 15/1/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    // 1. url
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/videos.json"];
    
    // 2. 请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3. 连接
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        /**
         NSJSONReadingMutableContainers = (1UL << 0), 容器是可变的，转成的结果是可变的类型
         NSJSONReadingMutableLeaves = (1UL << 1),     叶子节点是可变的
         NSJSONReadingAllowFragments = (1UL << 2)     允许根节点 可以不是NSArray，NSDictionary
         枚举类型，一般使用位移的，传0，什么事情都不做
         */
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
        
        NSLog(@"result = %@---%@", result, [result class]);
    }];
    
    
}

@end
