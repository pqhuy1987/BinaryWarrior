//
//  Level2.m
//  BinaryWarriors
//
//  Created by Marist User on 11/6/14.
//  Copyright (c) 2014 Phil Picinic. All rights reserved.
//

#import "Level2.h"
#import "Helper.h"
#import "Gorgon.h"
#import "Harpie.h"
#import "SoundEffects.h"
#import "Lives.h"

#define REWARD_CRUSH_MONSTA 20

@implementation Level2 : Level1

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene* scene = [CCScene node];
    
	// 'layer' is an autorelease object.
	Level2 *layer = [Level2 node];
	
	// add layer as a child to scene
	[scene addChild: layer z:25];
    
    [scene addChild: [GameController make] z:25];
    
	return scene;
}

- (id) init {
    if([self isMemberOfClass:[Level2 class]])
        world = [CCTMXTiledMap tiledMapWithTMXFile:@"binarywarriors_level2.tmx"];
    
    if((self = [super init])) {
        bubbles = [[NSArray alloc]initWithObjects:
                   @"Caught!",@"Gotcha!",@"Take that!",@"Pow!",@"Ha, ha!",nil];
        
        feedback = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:24];
        
        [feedback setVisible:FALSE];
        
        [feedback setColor:ccc3(0,0,0)];
        
        [feedback setAnchorPoint:ccp(0,0)];
        
        // If you forget to add the feedback to the world and try to position
        // it later, cocos2d crashes
        [self addChild:feedback z:95];
    }
    
	return self;
}

- (void) initWorld {
    [super initWorld];
    
    obstaclesLayer = [world layerNamed:@"obstacles"];
    
}

-(void) update:(ccTime)dt {
    [super update:dt];
    if(caught || complete)
        return;
    
    
    
    CGPoint point = [grace getPosition];
    int gid = [obstaclesLayer tileGIDAt:point];
    if(gid != 0){
        caught = true;
    }
    if(caught){
        [self handlePCCaught];
    }
    
    
}

@end
