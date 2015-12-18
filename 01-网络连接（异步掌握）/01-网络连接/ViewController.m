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
    
    // 0.
    // 这个方法是直接返回data，有时候返回的data是nil，
    // dataWithContentsOfURL:url方法是同步的。 同步方法超时时长60秒
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    UIImage *image = [UIImage imageWithData:data];
    
    // 1. url
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/demo.json"];
    
    // 2. 建立请求
    /**
     参数：url：资源路径
     cachePolicy：缓存策略
     NSURLRequestUseProtocolCachePolicy = 0, // 默认缓存策略，会自动缓存
     
     NSURLRequestReload(刷新)Ignoring(忽略)Local(本地)CacheData(缓存数据) = 1, 每次都从服务器去加载数据。忽略本地缓存

    **** 底下两个 一般来离线访问。一般配合Reachability(苹果提供的检测网络连接的框架)使用
     // 如果用户使用的wifi，就使用这个策略
     NSURLRequestReturnCacheDataElseLoad = 2, // 如果有缓存，就用缓存。没有就上网加载
     // 如果用户使用的3G，就使用下面的策略
     NSURLRequestReturnCacheDataDontLoad = 3, // 如没有缓存，就用缓存。没有返回空，死活不上网

     
     timeoutInterval：超时时间，默认是60秒，一般设置15～20秒。超过这个时间以后，如果服务器还没有相应，就不继续等待了
     SDWebImage超时时长设置的是-->15秒
     AFN超时时长 60秒
     */
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:2];
    
    // 3. 建立连接Connection， 发送请求到服务器
    /**
     参数:Request 请求
     queue: 队列，这个队列，是完成以后，回调block执行的队列、
     Asynchronous：只要是异步，肯定会开新的线程
     
     // 使用场景：如果下载的是压缩包，解压缩也是耗时操作。也需要放在子线程
     // 如果回调block里面只需要更新UI，那么就可以只开始指定queue为主队列
     
     Handler：网络访问完成以后执行的代码块
     response: 服务器的响应（包含响应行/响应头...下载的时候才去关心这个）
     data： 返回的二进制数据
     connectionError：在连接服务器的时候的错误，只要是能正常连接到服务器，就不会有错。
     只要有网络候出现的错访问，就会可能有错误
     */
    
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError || data == nil) {
            NSLog(@"%@----您的网络不给力，请稍后再试", connectionError);
            return;
        }// url错了，才会有错误信息
        
//        NSLog(@"data = %@", data);
        
        // 解压缩
        NSLog(@"解压缩---%@", [NSThread currentThread]);
        
        // 更新UI在主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            // 网络请求完成以后调用的这块代码，从服务器获得二进制数据
            NSLog(@"更新UI%@---%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding], [NSThread currentThread]);
        });
    }];
}

@end
