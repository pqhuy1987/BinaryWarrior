
//
//  HighScoresScreen.h
//  BinaryWarriors
//
//  Created by Phil Picinic on 10/4/14.
//  Copyright (c) 2014 Phil Picinic. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"

@interface HighScoresScreen : CCLayer{
    CCMenuItemFont* toggleButton;
}

+(CCScene*) scene;

-(id) init;

-(void) onToggle: (CCMenuItemFont*) button;

-(void) onBack: (CCMenuItemFont*) button;

@end