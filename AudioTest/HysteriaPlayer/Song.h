//
//  Song.h
//  AudioTest
//
//  Created by hsm on 2017/2/7.
//  Copyright © 2017年 linggan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject

+ (Song *)initWithData:(NSDictionary *)dic;

@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *amgArtistId;
@property (nonatomic, strong) NSString *artistLinkUrl;
@property (nonatomic, strong) NSString *artistName;
@property (nonatomic, strong) NSString *artistType;
@property (nonatomic, strong) NSString *primaryGenreName;
@property (nonatomic, strong) NSString *wrapperType;


@end
