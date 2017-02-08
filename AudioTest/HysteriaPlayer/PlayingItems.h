//
//  PlayingItems.h
//  AudioTest
//
//  Created by hsm on 2017/2/7.
//  Copyright © 2017年 linggan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayingItems : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong) NSMutableArray *queueItems;

@end
