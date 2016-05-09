//
//  HJDatabaseQueue.h
//  HJAppDemo
//
//  Created by huangjian on 16/3/23.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

//数据库加密密码
#define kDatabaseKey @"qGi3oyLAnhjGdkdgA2zkTI0O"

@interface HJDatabaseQueue : NSObject {

    //当前帐号所持有
    FMDatabaseQueue * mQueue;
    
    //帐号共用Queue
    FMDatabaseQueue * mPublicQueue;
}

@property (nonatomic, assign) BOOL isEncrypt; //决定数据库是否加密

+ (instancetype)sharedDatabaseQueue;

#pragma mark -- 获取当前帐号相关的queue
- (FMDatabaseQueue *)selectCurrentQueue;

#pragma mark -- 重置帐号相关queue的路径 (根据用户id建立不同的数据)
- (void)resetDatabasePathWithUid:(NSString *)uid;

#pragma mark -- 获取帐号公有queue
- (FMDatabaseQueue *)selectPublicQueue;

#pragma mark -- 设置共有quque
- (void)setPublicQueue;

@end
