//
//  MainScreen.m
//  BinaryWarriors
//
//  Created by Phil Picinic on 10/4/14.
//  Copyright (c) 2014 Phil Picinic. All rights reserved.
//

#import "MainScreen.h"
#import "OptionsScreen.h"
#import "QuitScreen.h"
#import "cocos2d.h"
#import "InterLevel.h"
#import "Options.h"
#import "SimpleAudioEngine.h"

#define THEME_SONG @"4225775_The_River_War_Original_Mix.mp3"

@implementation MainScreen : CCLayer

+(CCScene*) scene{
    // Get a scene
    CCScene* scene = [CCScene node];
    MainScreen* layer = [MainScreen node];
    [scene addChild: layer];
    return scene;
}

-(id) init {
    if( (self= [super init])){
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        NSString* text = @"Space Warriors";
        
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:24 dimensions: CGSizeMake(0,100) hAlignment:UITextAlignmentLeft];
        
        [label setColor:ccc3(0, 200, 255)];
        
        // position the label on the center of the screen
        label.position =  ccp( (screenWidth / 2) + (0)  , screenHeight/2 );
        
        // add the label as a child to this Layer
        [self addChild: label];
        if([Options musicOn]){
            [[SimpleAudioEngine sharedEngine] playBackgroundMusic:THEME_SONG loop:true];
        }
        CCMenuItem* newButton = [CCMenuItemFont itemWithString: @"New" target:self selector:@selector(onNew:)];
        //CCMenuItemFont* resumeButton = [CCMenuItemFont itemWithString:@"Resume" target:self selector:@selector(onResume:)];
        CCMenuItemFont* optionsButton = [CCMenuItemFont itemWithString:@"Options" target:self selector:@selector(onOptions:)];
        CCMenuItemFont* quitButton = [CCMenuItemFont itemWithString:@"Quit" target:self selector:@selector(onQuit:)];
        
        CCMenu* menu = [CCMenu menuWithItems:newButton, optionsButton, quitButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth/ 2, screenHeight*0.25f)];
        
        [self addChild: menu];
    }
    return self;
}

-(void) onNew: (CCMenuItemFont*) button{
    [[CCDirector sharedDirector] pushScene:[InterLevel scene]];
}

-(void) onOptions: (CCMenuItemFont*) button{
    [[CCDirector sharedDirector]pushScene:[OptionsScreen scene]];
}

-(void) onQuit: (CCMenuItemFont*) button{
    [[CCDirector sharedDirector] pushScene:[QuitScreen scene]];
}

@end