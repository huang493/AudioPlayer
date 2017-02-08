//
//  HysteriaPlayerManager.m
//  AudioTest
//
//  Created by hsm on 2017/2/7.
//  Copyright © 2017年 linggan. All rights reserved.
//

#import "HysteriaPlayerManager.h"
#import "PlayingItems.h"
#import <HysteriaPlayer.h>
#import <RACDelegateProxy.h>
#import "Song.h"

static HysteriaPlayerManager *_shareInstance = nil;

@interface HysteriaPlayerManager() <HysteriaPlayerDataSource>

@end

@implementation HysteriaPlayerManager

+(instancetype)shareInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _shareInstance = [[self alloc] init];
    });
    
    return _shareInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setupHysteriaPlayer];
    }
    return self;
}

- (BOOL)isPlaying {
    return [HysteriaPlayer sharedInstance].isPlaying;
}

- (float)process {
    
    float c = [[HysteriaPlayer sharedInstance] getPlayingItemCurrentTime];
    float t = [[HysteriaPlayer sharedInstance] getPlayingItemDurationTime];
    return c / t;
}

- (void)setupHysteriaPlayer {
    
    HysteriaPlayer *hysterialPlayer = [HysteriaPlayer sharedInstance];
        
    RACDelegateProxy *delegate = [[RACDelegateProxy alloc] initWithProtocol:@protocol(HysteriaPlayerDelegate)];
    
    hysterialPlayer.delegate = delegate;
    hysterialPlayer.datasource = self;
    
    @weakify(hysterialPlayer);
    [[delegate rac_signalForSelector:@selector(hysteriaPlayerReadyToPlay:)
                       fromProtocol:@protocol(HysteriaPlayerDelegate)]
     subscribeNext:^(NSNumber *x) {
        @strongify(hysterialPlayer);
         
         HysteriaPlayerReadyToPlay identifier = [x integerValue];
         
         switch (identifier) {
             case HysteriaPlayerReadyToPlayCurrentItem:
             {
                 if([hysterialPlayer getHysteriaPlayerStatus]
                    != HysteriaPlayerStatusForcePause) {
                     [hysterialPlayer play];
                 }
             }
                 break;
             case HysteriaPlayerReadyToPlayPlayer: {
                 [hysterialPlayer play];
             }
                 break;
             default:
                 break;
         }
         
         
    }];
    
    
    [[delegate rac_signalForSelector:@selector(hysteriaPlayerDidFailed:error:)
                       fromProtocol:@protocol(HysteriaPlayerDelegate)]
     subscribeNext:^(RACTuple *x) {
         NSLog(@"播放失败：%@  %@",x.first, x.second);
    }];
}

- (void)play {
    
    HysteriaPlayer *player =[HysteriaPlayer sharedInstance];
    
    if(player.audioPlayer.currentItem.status == AVPlayerStatusReadyToPlay) {
        [[HysteriaPlayer sharedInstance] play];
    } else {
        [[HysteriaPlayer sharedInstance] fetchAndPlayPlayerItem:0];
    }
}

- (void)pause {
    [[HysteriaPlayer sharedInstance] pause];
}

- (void)stop {
    
}

- (void)playNext {
    [[HysteriaPlayer sharedInstance] playNext];
}

- (void)playPre {

    [[HysteriaPlayer sharedInstance] playPrevious];
}

- (void)seekTo:(CGFloat)f {
    
    double time = [[HysteriaPlayer sharedInstance] getPlayingItemDurationTime];
    
    time = time * f;
    
    [[HysteriaPlayer sharedInstance] seekToTime:time];
}

- (void)setupNewSourceGetter:(id)responseObject {
    
    PlayingItems *playingItems = [PlayingItems sharedInstance];
    
    [playingItems setQueueItems:[NSMutableArray array]];
    
    NSArray *JSONData = [responseObject objectForKey:@"results"];
    for (NSDictionary *songData in JSONData) {
        Song *object = [Song initWithData:songData];
        if (object) {
            [[playingItems queueItems] addObject:object];
        }
    }
    
    
    //play
    [[HysteriaPlayer sharedInstance] fetchAndPlayPlayerItem:0];
}

- (void)getPreviews:(NSString *)itunesAPI {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:itunesAPI
      parameters:nil
        progress:^(NSProgress * _Nonnull downloadProgress) {
        
    }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             [[HysteriaPlayerManager shareInstance] setupNewSourceGetter:responseObject];
    }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

- (void)PreviewU2:(id)sender {
    
    NSString *itunesAPIU2 = @"https://itunes.apple.com/lookup?amgArtistId=5723&entity=song&limit=5&sort=recent";
    
    [self getPreviews:itunesAPIU2];
}

- (void)previewJackJohnson:(id)sender {
    
    NSString *itunesAPIJackJohnson = @"https://itunes.apple.com/lookup?amgArtistId=468749&entity=song&limit=5&sort=recent";
    
    [self getPreviews:itunesAPIJackJohnson];
}

#pragma -mark HysteriaPlayerDataSource
- (NSInteger)hysteriaPlayerNumberOfItems {
    return [PlayingItems sharedInstance].queueItems.count;
}

- (NSURL *)hysteriaPlayerURLForItemAtIndex:(NSInteger)index preBuffer:(BOOL)preBuffer {
    NSString *object = [[PlayingItems sharedInstance].queueItems objectAtIndex:index];
    NSURL *url = [NSURL URLWithString:object];
    return url;
}

@end
