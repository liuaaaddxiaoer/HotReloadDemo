//
//  UIImage+hotReload.h
//  HotReloadDemo
//
//  Created by 刘小二 on 2018/9/11.
//  Copyright © 2018年 刘小二. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (hotReload)
+ (UIImage *)imageNamed:(NSString *)name class:(Class)classType;
@end