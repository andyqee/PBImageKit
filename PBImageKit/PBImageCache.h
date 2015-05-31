//
//  PBImageCache.h
//  PBImageKit
//
//  Created by andy on 31/5/15.
//  Copyright (c) 2015 andy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBImageCache : NSObject

+ (PBImageCache *)sharedInstance;

- (void)clearMemory;

- (UIImage *)imageForKey:(id)imageKey;

- (void)setImage:(UIImage *)image forKey:(id)imageKey;

@end
