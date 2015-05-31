//
//  PBImageCache.m
//  PBImageKit
//
//  Created by andy on 31/5/15.
//  Copyright (c) 2015 andy. All rights reserved.
//

#import "PBImageCache.h"

@implementation PBImageCache
{
    NSCache *_memCache;
    
}

+ (PBImageCache *)sharedInstance
{
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

- (instancetype)init
{
    if (self = [super init])
    {
        _memCache = [[NSCache alloc] init];
        [self _setupNotification];
    }
    
    return self;
}

- (void)_setupNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(clearMemory)
                                                 name:UIApplicationDidReceiveMemoryWarningNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(cleanDisk)
                                                 name:UIApplicationWillTerminateNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(backgroundCleanDisk)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (UIImage *)imageForKey:(id)imageKey
{
    NSParameterAssert(imageKey);
    
    return (UIImage *)[_memCache objectForKey:imageKey];
}

- (void)setImage:(UIImage *)image forKey:(id)imageKey
{
    NSParameterAssert(image);
    NSParameterAssert(imageKey);
    
    [_memCache setObject:image forKey:imageKey];
}

- (void)clearMemory
{
    [_memCache removeAllObjects];
}

- (void)cleanDisk
{

}

- (void)backgroundCleanDisk
{

}

@end
