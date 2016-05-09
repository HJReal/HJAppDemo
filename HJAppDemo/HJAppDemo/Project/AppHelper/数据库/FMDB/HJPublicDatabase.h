//
//  HJPublicDatabase.h
//  HJAppDemo
//
//  Created by huangjian on 16/3/24.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "HJDatabaseQueue.h"

@interface HJPublicDatabase : NSObject {

    //有了FMDatabaseQueue就不要FMDatabase
    FMDatabaseQueue *dbQueue;
}

+ (instancetype)sharedInstance;

- (BOOL)createPublicTableWithQueue:(NSString *)sql;


@end
