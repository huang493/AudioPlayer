//
//  HysteriaPlayerManager.h
//  AudioTest
//
//  Created by hsm on 2017/2/7.
//  Copyright © 2017年 linggan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HysteriaPlayerManager : NSObject

@property (nonatomic, assign) BOOL isPlaying;

@property (nonatomic, assign) float process;

+ (instancetype)shareInstance;

- (void)setupNewSourceGetter:(id)re;

- (void)previewJackJohnson:(id)sender;

- (void)PreviewU2:(id)sender;

- (void)play;

- (void)pause;

- (void)stop;

- (void)playNext;

- (void)playPre;

- (void)seekTo:(CGFloat)f;

@end
