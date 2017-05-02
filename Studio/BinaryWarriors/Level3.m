//
//  Level3.m
//  BinaryWarriors
//
//  Created by Kimberly Tobias on 11/6/14.
//  Copyright (c) 2014 Phil Picinic. All rights reserved.
//

#import "Level3.h"
#import "Helper.h"
#import "Gorgon.h"
#import "Harpie.h"
#import "SoundEffects.h"
#import "Lives.h"

#define REWARD_CRUSH_MONSTA 20

@implementation Level3 : Level2

+(CCScene *) scene
{
    // 'scene' is an autorelease object.
    CCScene* scene = [CCScene node];
    
    // 'layer' is an autorelease object.
    Level3 *layer = [Level3 node];
    
    // add layer as a child to scene
    [scene addChild: layer z:25];
    
    [scene addChild: [GameController make] z:25];
    
    return scene;
}

- (id) init {
    if([self isMemberOfClass:[Level3 class]])
        world = [CCTMXTiledMap tiledMapWithTMXFile:@"binarywarriors_level3.tmx"];
    
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
    
    CGSize size = [world mapSize];
    
    stalksLayer = [world layerNamed:@"stalks"];
    
    enemiesLayer = [world layerNamed:@"enemies"];
    
    [enemiesLayer setVisible:false];
    
    enemies = [[NSMutableArray alloc] init];
    
    for(int tilex = 0; tilex < size.width; tilex++) {
        for(int tiley = 0; tiley < size.height; tiley++) {
            int gid = [enemiesLayer tileGIDAt:ccp(tilex,tiley)];
            
            //            CGPoint here = [Helper tileToWorldX:tilex andY:tiley];
            CGPoint here = [Helper tile:ccp(tilex,tiley) toWorld:world];
            
            if(gid == RID_GORGON) {
                Gorgon* gorgon = (Gorgon*) [[Gorgon alloc] initAt:here of:self];
                
                [self addChild:gorgon z:90];
                
                [enemies addObject:gorgon];
            }
            
            else if(gid == RID_HARPIE) {
                Harpie* flya = (Harpie*) [[Harpie alloc] initAt:here of:self];
                
                [self addChild:flya z:90];
                
                [enemies addObject:flya];
            }
        }
    }
}


@end
