//
//  HJCreateDatabaseTables.m
//  HJAppDemo
//
//  Created by huangjian on 16/3/24.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import "HJCreateDatabaseTables.h"
#import "HJDatabaseQueue.h"
#import "HJPublicDatabase.h"

@implementation HJCreateDatabaseTables

+ (void)createPublicDatabaseTables {

    [[HJDatabaseQueue sharedDatabaseQueue] setPublicQueue];
    
    NSString * sql = @"create table if not exists Public_Info (ID integer primary key autoincrement,\
    username varchar(128),\
    password varchar(128),\
    age integer);";
    
    [[HJPublicDatabase sharedInstance] createPublicTableWithQueue:sql];
}

+ (void)createUserDatabaseTables {

}

@end
