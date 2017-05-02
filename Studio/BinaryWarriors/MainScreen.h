//
//  MainScreen.h
//  BinaryWarriors
//
//  Created by Phil Picinic on 10/4/14.
//  Copyright (c) 2014 Phil Picinic. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"

@interface MainScreen : CCLayer

+(CCScene*) scene;

-(id) init;

-(void) onNew: (CCMenuItemFont*) button;

//-(void) onResume: (CCMenuItemFont*) button;

-(void) onOptions: (CCMenuItemFont*) button;

-(void) onQuit: (CCMenuItemFont*) button;

@end
