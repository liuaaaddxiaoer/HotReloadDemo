//
//  UIImage+hotReload.m
//  HotReloadDemo
//
//  Created by 刘小二 on 2018/9/11.
//  Copyright © 2018年 刘小二. All rights reserved.
//

#import "UIImage+hotReload.h"
#import <objc/runtime.h>
@implementation UIImage (hotReload)
+ (UIImage *)imageNamed:(NSString *)name class:(Class)classType {
    
#if TARGET_INTERFACE_BUILDER
    return [self imageNamed:name inBundle:[NSBundle bundleForClass:classType] compatibleWithTraitCollection:nil];
#else
    return [UIImage imageNamed:name];
#endif
}
@end
