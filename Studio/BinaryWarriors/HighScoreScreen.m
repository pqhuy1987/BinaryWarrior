//
//  HighScoreScreen.m
//  BinaryWarriors
//
//  Created by Phil Picinic on 10/4/14.
//  Copyright (c) 2014 Phil Picinic. All rights reserved.
//

#import "HighScoreScreen.h"
#import "cocos2d.h"

@implementation HighScoreScreen : CCLayer

+(CCScene*) scene{
    // Get a scene
    CCScene* scene = [CCScene node];
    HighScoreScreen* layer = [HighScoreScreen node];
    [scene addChild: layer];
    return scene;
}

-(id) init{
    if( (self= [super init])){
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        NSString* text = @"High Scores";
        
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:24 dimensions: CGSizeMake(0,100) hAlignment:UITextAlignmentLeft];
        
        [label setColor:ccc3(0, 200, 255)];
        
        // position the label on the center of the screen
        label.position =  ccp( (screenWidth / 2) + (0)  , screenHeight/1.5 );
        
        // add the label as a child to this Layer
        [self addChild: label];
        
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        int first = [defaults integerForKey:@"first_place"];
        NSString* firstText = [NSString stringWithFormat:@"1. %d", first];
        int second = [defaults integerForKey:@"second_place"];
        NSString* secondText = [NSString stringWithFormat:@"2. %d", second];
//        [secondText stringByAppendingString:(NSString*)second];
        int third = [defaults integerForKey:@"third_place"];
        NSString* thirdText = [NSString stringWithFormat:@"3. %d", third];
//        [thirdText stringByAppendingString:(NSString*)third];
        
        CCMenuItemLabel* firstLabel = [CCMenuItemFont itemWithString:firstText];
        CCMenuItemLabel* secondLabel = [CCMenuItemFont itemWithString:secondText];
        CCMenuItemLabel* thirdLabel = [CCMenuItemFont itemWithString:thirdText];
        
        
        CCMenuItem* continueButton = [CCMenuItemFont itemWithString: @"Continue" target:self selector:@selector(onContinue:)];
        
        CCMenu* menu = [CCMenu menuWithItems:firstLabel, secondLabel, thirdLabel, continueButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth/ 2, screenHeight*0.25f)];
        
        [self addChild: menu];
    }
    return self;
}

-(void) onContinue:(CCMenuItemFont *)button{
    [[CCDirector sharedDirector] popScene];
}

@end