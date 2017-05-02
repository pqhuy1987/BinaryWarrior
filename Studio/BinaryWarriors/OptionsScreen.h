//
//  OptionsScreen.h
//  BinaryWarriors
//
//  Created by Phil Picinic on 10/4/14.
//  Copyright (c) 2014 Phil Picinic. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"

@interface OptionsScreen : CCLayer

+(CCScene*) scene;

-(id) init;

-(void) onAudio: (CCMenuItemFont*) button;
-(void) onScores: (CCMenuItemFont*) button;
-(void) onSkill: (CCMenuItemFont*) button;
-(void) onBack: (CCMenuItemFont*) button;

@end


