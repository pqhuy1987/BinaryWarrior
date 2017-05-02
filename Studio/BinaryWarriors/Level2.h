//
//  Level2.h
//  BinaryWarriors
//
//  Created by Marist User on 11/6/14.
//  Copyright (c) 2014 Phil Picinic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level1.h"

@interface Level2 : Level1 {
    CCTMXLayer* obstaclesLayer;
}

/** Gets a scene for this layer */
+ (CCScene *) scene;

/** Constructor */
- (id) init;

/** Initializes the world */
- (void) initWorld;

/** Updates the level */
- (void) update:(ccTime)dt;

/** Handles PC caught by enemy */
//- (void) handlePCCaught;

/** Handles resetting everything if PC caught */
//- (void) caughtReset;

@end
