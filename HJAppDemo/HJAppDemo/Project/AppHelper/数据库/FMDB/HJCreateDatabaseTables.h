//
//  HJCreateDatabaseTables.h
//  HJAppDemo
//
//  Created by huangjian on 16/3/24.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJCreateDatabaseTables : NSObject

#pragma mark - 创建用户公共数据表
+ (void)createPublicDatabaseTables;

#pragma mark - 创建个人帐户下的数据表
+ (void)createUserDatabaseTables;

@end
