//
//  Person.h
//  03-归档和解挡
//
//  Created by apple on 15/1/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>

@property(nonatomic,copy) NSString *name;

@property(nonatomic,assign) int age;

@end
