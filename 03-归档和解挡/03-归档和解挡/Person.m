//
//  Person.m
//  03-归档和解挡
//
//  Created by apple on 15/1/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "Person.h"

@implementation Person

/**
 归档 -- encoder
 将自定义的对象写入磁盘前，将对象转成“二进制”
 */
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:_name forKey:@"userName"];
    [encoder encodeInt:_age forKey:@"userAge"];
}

/**
 解档 --- decoder
 将磁盘上保存的二进制数据，转成自定义的对象
 */
- (instancetype)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        _name = [decoder decodeObjectForKey:@"userName"];
        _age = [decoder decodeIntForKey:@"userAge"];
    }
    return self;
}

@end
