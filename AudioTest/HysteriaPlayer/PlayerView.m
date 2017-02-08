//
//  PlayerView.m
//  AudioTest
//
//  Created by hsm on 2017/2/8.
//  Copyright © 2017年 linggan. All rights reserved.
//

#import "PlayerView.h"
#import "HysteriaPlayerManager.h"

@interface PlayerView()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation PlayerView

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (IBAction)preAction:(id)sender {
    [[HysteriaPlayerManager shareInstance] playPre];
}

- (IBAction)playPauseAction:(id)sender {
    
    if([HysteriaPlayerManager shareInstance].isPlaying) {
        [[HysteriaPlayerManager shareInstance] pause];
        [self.timer invalidate];
        self.timer = nil;
    } else {
        [[HysteriaPlayerManager shareInstance] play];
        [self.timer fire];
    }
}

- (NSTimer *)timer {
    
    if(!_timer) {
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
            float f = [HysteriaPlayerManager shareInstance].process;
            self.process.value = f;
        }];
        
        self.timer.fireDate = [NSDate dateWithTimeIntervalSinceNow:NSIntegerMax];
    }
    
    return _timer;
}

- (IBAction)nextAction:(id)sender {
    [[HysteriaPlayerManager shareInstance] playNext];
}

- (IBAction)seek:(id)sender {
    UISlider *s = sender;
    [[HysteriaPlayerManager shareInstance] seekTo:s.value];
}



@end
