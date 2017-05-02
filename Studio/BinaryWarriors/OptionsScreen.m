//
//  OptionsScreen.m
//  BinaryWarriors
//
//  Created by Phil Picinic on 10/4/14.
//  Copyright (c) 2014 Phil Picinic. All rights reserved.
//

#import "OptionsScreen.h"
#import "AudioScreen.h"
#import "SkillScreen.h"
#import "HighScoresScreen.h"
#import "MainScreen.h"
#import "cocos2d.h"

@implementation OptionsScreen : CCLayer

+(CCScene*) scene{
    // Get a scene
    CCScene* scene = [CCScene node];
    OptionsScreen* layer = [OptionsScreen node];
    [scene addChild: layer];
    return scene;
}

-(id) init{
    if( (self= [super init])){
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        NSString* text = @"Configure Options";
        
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:24 dimensions: CGSizeMake(0,100) hAlignment:UITextAlignmentLeft];
        
        [label setColor:ccc3(255, 255, 255)];
        
        // position the label on the center of the screen
        label.position =  ccp( (screenWidth / 2) + (0)  , screenHeight - screenHeight/3 );
        
        // add the label as a child to this Layer
        [self addChild: label];
        
        CCMenuItem* audioButton = [CCMenuItemFont itemWithString: @"Audio" target:self selector:@selector(onAudio:)];
        CCMenuItemFont* skillButton = [CCMenuItemFont itemWithString:@"Skill Level" target:self selector:@selector(onSkill:)];
        CCMenuItemFont* highScoresButton = [CCMenuItemFont itemWithString:@"High Scores" target:self selector:@selector(onScores:)];
        CCMenuItemFont* backButton = [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(onBack:)];
        
        CCMenu* menu = [CCMenu menuWithItems:audioButton, skillButton, highScoresButton, backButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth/ 2, screenHeight*0.25f)];
        
        [self addChild: menu];
    }
    return self;
}

-(void) onAudio: (CCMenuItemFont*) button{
    [[CCDirector sharedDirector] pushScene:[AudioScreen scene]];
}

-(void) onSkill: (CCMenuItemFont*) button{
    [[CCDirector sharedDirector] pushScene:[SkillScreen scene]];
}

-(void) onScores: (CCMenuItemFont*) button{
    [[CCDirector sharedDirector] pushScene:[HighScoresScreen scene]];
}

-(void) onBack: (CCMenuItemFont*) button{
    [[CCDirector sharedDirector] popScene];
}


@end
