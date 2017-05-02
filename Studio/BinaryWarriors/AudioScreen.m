//
//  AudioScreen.m
//  BinaryWarriors
//
//  Created by Phil Picinic on 10/4/14.
//  Copyright (c) 2014 Phil Picinic. All rights reserved.
//

#import "AudioScreen.h"
#import "cocos2d.h"
#import "Options.h"
#import "SimpleAudioEngine.h"

#define THEME_SONG @"4225775_The_River_War_Original_Mix.mp3"

@implementation AudioScreen : CCLayer

+(CCScene*) scene{
    // Get a scene
    CCScene* scene = [CCScene node];
    AudioScreen* layer = [AudioScreen node];
    [scene addChild: layer];
    return scene;
}

-(id) init{
    if( (self= [super init])){
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        NSString* text = @"Toggle Audio On and Off";
        
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:24 dimensions: CGSizeMake(0,100) hAlignment:UITextAlignmentLeft];
        
        [label setColor:ccc3(255, 255, 255)];
        
        // position the label on the center of the screen
        label.position =  ccp( (screenWidth / 2) + (0)  , screenHeight/2 );
        
        // add the label as a child to this Layer
        [self addChild: label];
        
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        int on = [defaults integerForKey:@"audio_config"];
        NSString* val = @"On";
        if(on == 1){
            val = @"Off";
        }
        toggleButton = [CCMenuItemFont itemWithString: val target:self selector:@selector(onToggle:)];
        
        CCMenuItemFont* backButton = [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(onBack:)];
        
        CCMenu* menu = [CCMenu menuWithItems:toggleButton, backButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth/ 2, screenHeight*0.25f)];
        
        [self addChild: menu];
    }
    return self;
}

-(void) onToggle: (CCMenuItemFont*) button{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int on = [defaults integerForKey:@"audio_config"];
    on = (on + 1) % 2;
    [defaults setInteger:on forKey:@"audio_config"];
    [defaults synchronize];
    NSString* val = @"On";
    if(on == 1){
        val = @"Off";
    }
    if(on == 0){
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:THEME_SONG loop:true];
    }else{
        [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    }
    [Options musicOn];
    [toggleButton setString: val];
    
}

-(void) onBack: (CCMenuItemFont*) button{
    [[CCDirector sharedDirector] popScene];
}

@end