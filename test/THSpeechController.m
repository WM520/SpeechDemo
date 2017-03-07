//
//  THSpeechController.m
//  test
//
//  Created by foreverlove on 2017/3/6.
//  Copyright © 2017年 foreverlove. All rights reserved.
//

#import "THSpeechController.h"


@interface THSpeechController ()

@property (strong, nonatomic) AVSpeechSynthesizer * synthesizer;
@property (strong, nonatomic) NSArray * voices;
@property (strong, nonatomic) NSArray * speechStrings;
@property (strong, nonatomic) UIView * speechView;

@end


@implementation THSpeechController

+ (instancetype)speechcontroller
{
    return [[self alloc] init];
}

- (instancetype)init
{
    if (self = [super init]) {
        _synthesizer = [[AVSpeechSynthesizer alloc] init];
        _voices = @[[AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"],
                    [AVSpeechSynthesisVoice voiceWithLanguage:@"en-GB"]];
        _speechStrings = [self buildSpeechStrings];
        _speechView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
//        _speechView.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (NSArray *)buildSpeechStrings
{
    return @[@"hello",
             @"hello, world",
             @"welcome to earth",
             @"bye"];
}

- (void)beginConversation
{
    for (NSInteger i = 0; i < self.speechStrings.count; i++) {
        AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:self.speechStrings[i]];
        utterance.voice = self.voices[i % 2];
        utterance.rate = 0.4f;
        utterance.pitchMultiplier = 0.8f;
        utterance.postUtteranceDelay = 0.1f;
        [self.synthesizer speakUtterance:utterance];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0 + 30 * i, [UIScreen mainScreen].bounds.size.width, 30)];
        label.text = self.speechStrings[i];
        label.textColor = [UIColor redColor];
        [self.speechView addSubview:label];
    }
}

@end
