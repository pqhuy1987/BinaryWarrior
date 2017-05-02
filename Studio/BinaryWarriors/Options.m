//
//  Options.m
//  iMGABaseCC
//
//  Created by Ron Coleman on 12/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Options.h"

#define UD_KEY_SOUNDS @"audio_config"
#define UD_KEY_MUSIC @"audio_config"

static NSUserDefaults* userDefaults = nil;

@implementation Options

+ (bool) soundsOn {
    [Options loadDefaults];
    
    BOOL soundsEnabled = [userDefaults integerForKey:UD_KEY_SOUNDS] == 0;
    
	return soundsEnabled;
}

+ (void) enableSounds: (bool) toggle {
    [Options loadDefaults];
    
    //[userDefaults setBool:toggle forKey:UD_KEY_SOUNDS];
}

+ (bool) musicOn {
    [Options loadDefaults];
    
	bool musicOn = [userDefaults integerForKey:UD_KEY_MUSIC] == 0;
    
    return musicOn;
}

+ (void) enableMusic: (bool) toggle {
    [Options loadDefaults];
    
    //[userDefaults setBool:toggle forKey:UD_KEY_MUSIC];
}

+ (void) loadDefaults {
    if(userDefaults == nil)
        userDefaults = [[NSUserDefaults alloc] init];    
}
@end
