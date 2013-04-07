//
//  PMPixel.m
//  Pixem
//
//  Created by Jon Como on 4/7/13.
//  Copyright (c) 2013 Jon Como. All rights reserved.
//

#import "PMPixel.h"

@implementation PMPixel

-(id)init
{
    if (self = [super init]) {
        //Init
        _color = arc4random()%2 ? [UIColor whiteColor] : [UIColor blackColor];
    }
    
    return self;
}

@end
