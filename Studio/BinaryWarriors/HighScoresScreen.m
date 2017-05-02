//
//  HighScoresScreen.m
//  BinaryWarriors
//
//  Created by Phil Picinic on 10/4/14.
//  Copyright (c) 2014 Phil Picinic. All rights reserved.
//

#import "HighScoresScreen.h"
#import "cocos2d.h"

@implementation HighScoresScreen : CCLayer

+(CCScene*) scene{
    // Get a scene
    CCScene* scene = [CCScene node];
    HighScoresScreen* layer = [HighScoresScreen node];
    [scene addChild: layer];
    return scene;
}

-(id) init{
    if( (self= [super init])){
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        NSString* text = @"Toggle High Score Location";
        
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:24 dimensions: CGSizeMake(0,100) hAlignment:UITextAlignmentLeft];
        
        [label setColor:ccc3(255, 255, 255)];
        
        // position the label on the center of the screen
        label.position =  ccp( (screenWidth / 2) + (0)  , screenHeight/2 );
        
        // add the label as a child to this Layer
        [self addChild: label];
        
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        bool toggle = [defaults boolForKey:@"save_config"];
        NSString* val = @"Local";
        if(toggle){
            val = @"Online";
        }
        toggleButton = [CCMenuItemFont itemWithString: val target:self selector:@selector(onToggle:)];
        CCMenuItemFont* backButton = [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(onBack:)];
        
        CCMenu* menu = [CCMenu menuWithItems:toggleButton, backButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth/ 2, screenHeight*0.25f)];
        
        [self addChild: menu];
    }
    return self;
}

-(void) onToggle: (CCMenuItemFont*) button{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    bool toggle = [defaults boolForKey:@"save_config"];
    toggle = !toggle;
    [defaults setBool:toggle forKey:@"save_config"];
    [defaults synchronize];
    NSString* val = @"Local";
    if(toggle){
        val = @"Online";
    }
    [toggleButton setString: val];
}

-(void) onBack: (CCMenuItemFont*) button{
    [[CCDirector sharedDirector] popScene];
}

@end
