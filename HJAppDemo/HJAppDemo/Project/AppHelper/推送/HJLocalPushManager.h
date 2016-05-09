//
//  HJLocalPushManager.h
//  HJAppDemo
//
//  Created by huangjian on 16/3/23.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HJLocalPushManager : NSObject

+ (instancetype)sharedInstance;

/**
 *  设置本地推送
 *
 *  @param alertTime 多少秒以后执行本地推送
 */
- (void)registerLocalNotification:(NSInteger)alertTime;

/**
 *  取消某个本地推送通知
 *
 *  @param key 关键字
 */
- (void)cancelLocalNotificationWithKey:(NSString *)key;

@end
