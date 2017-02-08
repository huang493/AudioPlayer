//
//  PlayingItems.m
//  AudioTest
//
//  Created by hsm on 2017/2/7.
//  Copyright © 2017年 linggan. All rights reserved.
//

#import "PlayingItems.h"

static PlayingItems *_shareInstance = nil;

@implementation PlayingItems

+ (instancetype)sharedInstance {
    
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
        self.queueItems = [NSMutableArray array];
        
        [self.queueItems addObjectsFromArray:[self musicURLStrings]];
    }
    return self;
}

- (NSArray *)musicURLStrings {
    
    return @[
             @"http://audio.xmcdn.com/group12/M03/67/9B/wKgDW1c1VQ-AvSgcABCFrvVU-f8663.m4a",
             @"http://audio.xmcdn.com/group12/M03/67/9B/wKgDW1c1VQvDGIVNAAtxDaRCQKk936.m4a",
             @"http://audio.xmcdn.com/group12/M03/67/9B/wKgDW1c1VQ_gcx4SABBGWMNCAOY651.m4a",
             @"http://audio.xmcdn.com/group12/M03/67/9A/wKgDW1c1VQuCB5-qAAyIdfRVqVI282.m4a",
             @"http://audio.xmcdn.com/group13/M06/68/45/wKgDXlc1VQfhC5iKAApqh8P_b4w917.m4a",
             @"http://audio.xmcdn.com/group13/M06/68/45/wKgDXlc1VQiSB-F3AA2J9XK4YAo786.m4a",
             @"http://audio.xmcdn.com/group13/M06/68/62/wKgDXVc1VQegSOI6AA06ONKJdOk408.m4a",
             @"http://audio.xmcdn.com/group13/M06/68/45/wKgDXlc1VQWxfM3XAAtbX96WpQc014.m4a",
             @"http://audio.xmcdn.com/group13/M06/68/45/wKgDXlc1VQWw_lGKAA8MPfYfUhs212.m4a",
             @"http://audio.xmcdn.com/group13/M06/68/45/wKgDXlc1VQPiiUa_AA2YE4wfUk8525.m4a",
             @"http://audio.xmcdn.com/group13/M06/68/62/wKgDXVc1VQSRQ6MvAA-YPraIY84504.m4a",
             @"http://audio.xmcdn.com/group13/M06/68/62/wKgDXVc1VQGRBNzOAAnaGyQGPlE698.m4a",
             @"http://audio.xmcdn.com/group13/M06/68/44/wKgDXlc1VQCQA6YdAAlkhi0z-rs804.m4a",
             @"http://audio.xmcdn.com/group13/M06/68/62/wKgDXVc1VP7hEvA2AAuurizHASU255.m4a",
             @"http://audio.xmcdn.com/group13/M06/68/62/wKgDXVc1VPyCiY6SAArqRVWn_3s071.m4a",
             @"http://audio.xmcdn.com/group13/M06/68/62/wKgDXVc1VPvj_ka3AAjbZtFKTks537.m4a",
             @"http://audio.xmcdn.com/group13/M06/68/44/wKgDXlc1VPzBYyfJAAqtOx6PuWU339.m4a",
             @"http://audio.xmcdn.com/group13/M06/68/44/wKgDXlc1VP2h6nbjAA8jPDSu5SQ406.m4a",
             @"http://audio.xmcdn.com/group13/M06/68/62/wKgDXVc1VPuxdTzKAA3DIrPQ8LY329.m4a",
             @"http://audio.xmcdn.com/group13/M06/68/44/wKgDXlc1VPawq1zQAArxgMaARxE027.m4a",
             @"http://audio.xmcdn.com/group13/M06/68/44/wKgDXlc1VPajykZxAAqROF84jBY186.m4a",
             @"http://audio.xmcdn.com/group13/M06/68/44/wKgDXlc1VPbyJJNKAAnRvUatlNo348.m4a"
             ];
}

@end
