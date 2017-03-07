//
//  THSpeechController.h
//  test
//
//  Created by foreverlove on 2017/3/6.
//  Copyright © 2017年 foreverlove. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

typedef void(^reload)();

@interface THSpeechController : NSObject

@property (nonatomic, strong, readonly) AVSpeechSynthesizer * synthesizer;
@property (strong, nonatomic, readonly) UIView * speechView;
/**
 * 初始化
 */
+ (instancetype)speechcontroller;
/**
 * 启动
 */
- (void)beginConversation;

@end
