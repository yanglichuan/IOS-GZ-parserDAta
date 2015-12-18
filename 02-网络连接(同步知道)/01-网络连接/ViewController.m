//
//  ViewController.m
//  01-网络连接
//
//  Created by apple on 15/1/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    // 1. url
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    
//      NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/demo.json"];
    
    // 2. 建立请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:2];
    
    // 3. 建立连接Connection， 发送同步请求到服务器
    /**
     参数:
     SynchronousRequest发送同步请求
     returningResponse: 服务器响应的地址
     
     
     error: 错误信息的地址
     
     NULL：本质就是0, 表示的是地址是0 (swift里面取消了NULL)
     nil: 表示地址为0的空对象, 可以给nil发消息
     */
    
    NSURLResponse *response = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:NULL];
    
    NSLog(@"%@...%@---response%@",
          [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding], [NSThread currentThread], response);
}

@end
