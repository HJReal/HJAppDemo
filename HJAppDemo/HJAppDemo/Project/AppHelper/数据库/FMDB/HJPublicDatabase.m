//
//  HJPublicDatabase.m
//  HJAppDemo
//
//  Created by huangjian on 16/3/24.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import "HJPublicDatabase.h"

static HJPublicDatabase * publicDatabse = nil;

@implementation HJPublicDatabase

+ (instancetype)sharedInstance {

    //@synchronized(self) oc关键字 表示对self进行加锁
    @synchronized (self) {
        if (publicDatabse == nil) {
            publicDatabse = [[HJPublicDatabase alloc] initWithQueue];
        }
    }
    return publicDatabse;
}

- (instancetype)initWithQueue {
    if (self = [super init]) {
        
    }
    return self;
}

- (BOOL)createPublicTableWithQueue:(NSString *)sql {

    __block BOOL result = NO;
    dbQueue = [[HJDatabaseQueue sharedDatabaseQueue] selectPublicQueue];
    [dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql];
    }];
    
    [self insertNewColumns];
    
    return result;
}

#pragma mark - 插入新字段
-(void)insertNewColumns {
    
    [self insertNewColumnsWithType:@"TEXT" columns:@"nickName"];
}

- (BOOL)insertNewColumnsWithType:(NSString *)type columns:(NSString *)newColumn {
    __block BOOL b = NO;
    NSString *sql = [NSString stringWithFormat:@"ALTER TABLE Public_Info ADD COLUMN %@ %@",newColumn,type];
    [dbQueue inDatabase:^(FMDatabase *db) {
        if (![db columnExists:newColumn inTableWithName:@"ID_usersInfo"])
        {
            b = [db executeUpdate:sql];
            //            NSAssert(b, @"alter table failed: %@", [db lastErrorMessage]);
        }
    }];
    return b;
}


@end
