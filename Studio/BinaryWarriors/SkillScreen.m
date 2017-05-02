//
//  SkillScreen.m
//  BinaryWarriors
//
//  Created by Phil Picinic on 10/4/14.
//  Copyright (c) 2014 Phil Picinic. All rights reserved.
//

#import "SkillScreen.h"
#import "cocos2d.h"

@implementation SkillScreen : CCLayer

+(CCScene*) scene{
    // Get a scene
    CCScene* scene = [CCScene node];
    SkillScreen* layer = [SkillScreen node];
    [scene addChild: layer];
    return scene;
}

-(id) init{
    if( (self= [super init])){
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        NSString* text = @"Choose Skill Level";
        
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:24 dimensions: CGSizeMake(0,100) hAlignment:UITextAlignmentLeft];
        
        [label setColor:ccc3(255, 255, 255)];
        
        // position the label on the center of the screen
        label.position =  ccp( (screenWidth / 2) + (0)  , screenHeight - screenHeight/3 );
        
        // add the label as a child to this Layer
        [self addChild: label];
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        int num = [defaults integerForKey:@"difficulty_config"];
        NSString* choice = @"Current Difficulty: Easy";
        if(num == 1){
            choice = @"Current Difficulty: Intermediate";
        }
        if(num == 2){
            choice = @"Current Difficulty: Hard";
        }
        
        currentChoice = (CCLabelTTF*)[CCLabelTTF labelWithString:choice fontName:@"Marker Felt" fontSize:24 dimensions: CGSizeMake(0,100) hAlignment:UITextAlignmentLeft];
        
        [currentChoice setColor:ccc3(255, 255, 255)];
        
        // position the label on the center of the screen
        currentChoice.position =  ccp( (screenWidth / 2) + (0)  , screenHeight - screenHeight/2.25 );
        [self addChild:currentChoice];
        
        CCMenuItem* easyButton = [CCMenuItemFont itemWithString: @"Easy" target:self selector:@selector(onEasy:)];
        CCMenuItemFont* intermediateButton = [CCMenuItemFont itemWithString:@"Intermediate" target:self selector:@selector(onIntermediate:)];
        CCMenuItemFont* hardButton = [CCMenuItemFont itemWithString:@"Hard" target:self selector:@selector(onHard:)];
        CCMenuItemFont* backButton = [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(onBack:)];
        
        CCMenu* menu = [CCMenu menuWithItems:easyButton, intermediateButton, hardButton, backButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth/ 2, screenHeight*0.25f)];
        
        [self addChild: menu];
    }
    return self;
}

-(void) onEasy: (CCMenuItemFont*) button{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:0 forKey:@"difficulty_config"];
    [defaults synchronize];
    [self onToggle:0];
}

-(void) onIntermediate: (CCMenuItemFont*) button{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:1 forKey:@"difficulty_config"];
    [defaults synchronize];
    [self onToggle:1];
}

-(void) onHard: (CCMenuItemFont*) button{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:2 forKey:@"difficulty_config"];
    [defaults synchronize];
    [self onToggle:2];
}

-(void) onBack: (CCMenuItemFont*) button{
    [[CCDirector sharedDirector] popScene];
}

-(void) onToggle: (int) val{
    NSString* choice = @"Current Difficulty: Easy";
    if(val == 1){
        choice = @"Current Difficulty: Intermediate";
    }
    if(val == 2){
        choice = @"Current Difficulty: Hard";
    }
    [currentChoice setString:choice];
}

@end
