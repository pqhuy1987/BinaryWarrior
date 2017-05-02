//
//  GameOverScreen.m
//  BinaryWarriors
//
//  Created by Phil Picinic on 10/4/14.
//  Copyright (c) 2014 Phil Picinic. All rights reserved.
//

#import "GameOverScreen.h"
#import "cocos2d.h"
#import "Score.h"
#import "HighScoreScreen.h"

@implementation GameOverScreen : CCLayer

+(CCScene*) scene{
    // Get a scene
    CCScene* scene = [CCScene node];
    GameOverScreen* layer = [GameOverScreen node];
    [scene addChild: layer];
    return scene;
}

-(id) init{
    if( (self= [super init])){
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        NSString* text = @"Game Over!";
        
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:24 dimensions: CGSizeMake(0,100) hAlignment:UITextAlignmentLeft];
        
        [label setColor:ccc3(0, 200, 255)];
        
        // position the label on the center of the screen
        label.position =  ccp( (screenWidth / 2) + (0)  , screenHeight/2 );
        
        // add the label as a child to this Layer
        [self addChild: label];
        
        CCMenuItem* continueButton = [CCMenuItemFont itemWithString: @"Continue" target:self selector:@selector(onContinue:)];
        
        CCMenu* menu = [CCMenu menuWithItems:continueButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth/ 2, screenHeight*0.25f)];
        
        [self addChild: menu];
    }
    return self;
}

-(void) onContinue:(CCMenuItemFont *)button{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    int third = [defaults integerForKey:@"third_place"];
    int score = [Score score];
    if(score > third){
        [defaults setInteger:score forKey:@"third_place"];
        int second = [defaults integerForKey:@"second_place"];
        if(score > second){
            [defaults setInteger:second forKey:@"third_place"];
            [defaults setInteger:score forKey:@"second_place"];
            int first = [defaults integerForKey:@"first_place"];
            if(score > first){
                [defaults setInteger:first forKey:@"second_place"];
                [defaults setInteger:score forKey:@"first_place"];
            }
        }
        [defaults synchronize];
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:2.0 scene:[HighScoreScreen scene]]];
    }else{
        [[CCDirector sharedDirector] popScene];
    }
}

@end
