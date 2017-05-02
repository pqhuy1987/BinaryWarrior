//
//  QuitScreen.m
//  BinaryWarriors
//
//  Created by Phil Picinic on 10/4/14.
//  Copyright (c) 2014 Phil Picinic. All rights reserved.
//

#import "QuitScreen.h"
#import "cocos2d.h"

@implementation QuitScreen : CCLayer

+(CCScene*) scene{
    // Get a scene
    CCScene* scene = [CCScene node];
    QuitScreen* layer = [QuitScreen node];
    [scene addChild: layer];
    return scene;
}

-(id) init{
    if( (self= [super init])){
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        NSString* text = @"Are you sure you want to quit the game?";
        
        CCLabelTTF *label = (CCLabelTTF*)[CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:24 dimensions: CGSizeMake(0,100) hAlignment:UITextAlignmentLeft];
        
        [label setColor:ccc3(255, 255, 255)];
        
        // position the label on the center of the screen
        label.position =  ccp( (screenWidth / 2) + (0)  , screenHeight/2 );
        
        // add the label as a child to this Layer
        [self addChild: label];
        
        CCMenuItem* quitButton = [CCMenuItemFont itemWithString: @"Quit" target:self selector:@selector(onQuit:)];
        CCMenuItemFont* cancelButton = [CCMenuItemFont itemWithString:@"Cancel" target:self selector:@selector(onCancel:)];
        
        CCMenu* menu = [CCMenu menuWithItems:quitButton, cancelButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth/ 2, screenHeight*0.25f)];
        
        [self addChild: menu];
    }
    return self;
}

-(void) onQuit:(CCMenuItemFont *)button{
    exit(0);
}

-(void) onCancel:(CCMenuItemFont *)button{
    [[CCDirector sharedDirector] popScene];
}

@end