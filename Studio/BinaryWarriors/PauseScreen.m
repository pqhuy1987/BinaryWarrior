//
//  PauseScreen.m
//  BinaryWarriors
//
//  Created by Phil Picinic on 10/4/14.
//  Copyright (c) 2014 Phil Picinic. All rights reserved.
//

#import "PauseScreen.h"
#import "cocos2d.h"

@implementation PauseScreen : CCLayer

+(CCScene*) scene{
    // Get a scene
    CCScene* scene = [CCScene node];
    PauseScreen* layer = [PauseScreen node];
    [scene addChild: layer];
    return scene;
}

-(id) init{
    if( (self= [super init])){
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        CCMenuItem* resumeButton = [CCMenuItemFont itemWithString: @"Resume" target:self selector:@selector(onResume:)];
        CCMenuItemFont* quitButton = [CCMenuItemFont itemWithString:@"Quit" target:self selector:@selector(onQuit:)];
        
        CCMenu* menu = [CCMenu menuWithItems:resumeButton, quitButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth/ 2, screenHeight*0.25f)];
        
        [self addChild: menu];
    }
    return self;
}

-(void) onResume:(CCMenuItemFont *)button{
    
}

-(void) onQuit:(CCMenuItemFont *)button{
    
}

@end