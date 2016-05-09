//
//  HJDatabaseQueue.m
//  HJAppDemo
//
//  Created by huangjian on 16/3/23.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import "HJDatabaseQueue.h"

static HJDatabaseQueue * databaseQueue = nil;
@implementation HJDatabaseQueue

+ (instancetype)sharedDatabaseQueue {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (databaseQueue == nil) {
            databaseQueue = [[HJDatabaseQueue alloc] init];
        }
    });
    return databaseQueue;
}

- (FMDatabaseQueue *)selectCurrentQueue {
    return mQueue;
}

- (void)resetDatabasePathWithUid:(NSString *)uid {
    
    NSString * path = [NSHomeDirectory() stringByAppendingString:@"/Documents"];
    NSString * tempDBPath = [path stringByAppendingString:uid];
    [[NSFileManager defaultManager] createDirectoryAtPath:tempDBPath withIntermediateDirectories:YES attributes:nil error:nil];
    NSString * dbPath = [tempDBPath stringByAppendingString:@"/User.db"];

    mQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    [mQueue inDatabase:^(FMDatabase *db) {
        if (self.isEncrypt) {
            [db setKey:kDatabaseKey];
        }
    }];
}

- (FMDatabaseQueue *)selectPublicQueue {
    return mPublicQueue;
}

- (void)setPublicQueue {
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString * documentsDicectory = [paths objectAtIndex:0];
    NSString * dbPath = [documentsDicectory stringByAppendingPathComponent:@"ALL_PUBLIC.db"];

    mPublicQueue=[FMDatabaseQueue databaseQueueWithPath:dbPath];
    [mPublicQueue inDatabase:^(FMDatabase *db) {
        if (self.isEncrypt) {
            [db setKey:kDatabaseKey];
        }
    }];
}

@end
