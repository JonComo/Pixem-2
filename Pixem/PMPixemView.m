//
//  PMPixemView.m
//  Pixem
//
//  Created by Jon Como on 4/7/13.
//  Copyright (c) 2013 Jon Como. All rights reserved.
//

#import "PMPixemView.h"

#import "PMPixem.h"
#import "PMPixel.h"

@implementation PMPixemView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint position = [touch locationInView:self];
    
    PMPixel *closePixel = [self.pixem pixelAtX:floorf(position.x/self.frame.size.width*self.pixem.width) y:floorf(position.y / self.frame.size.height * self.pixem.height)];
    
    closePixel.color = [UIColor redColor];
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self.pixem renderInRect:rect];
}

@end
