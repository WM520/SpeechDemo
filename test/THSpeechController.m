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
    }
}

@end
