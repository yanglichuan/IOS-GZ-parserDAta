//
//  ViewController.m
//  05-JSONKit解析数据
//
//  Created by apple on 15/1/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "JSONKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1. url
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/videos.json"];
    
    // 2. 请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3. 连接
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        // 初始化一个json的解码器，调用方法解析
        id result = [[JSONDecoder decoder] objectWithData:data];
        
        NSLog(@"result = %@", result);
    }];
}



@end
