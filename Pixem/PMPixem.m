//
//  PMPixem.m
//  Pixem
//
//  Created by Jon Como on 4/7/13.
//  Copyright (c) 2013 Jon Como. All rights reserved.
//

#import "PMPixem.h"
#import "PMPixel.h"

@interface PMPixem ()
{
    NSMutableArray *pixels;
}

@end

@implementation PMPixem

-(id)init
{
    if (self = [self initWithPixelsWide:50 high:50]) {
        //Init
        
    }
    
    return self;
}

-(id)initWithPixelsWide:(u_int)wide high:(u_int)high
{
    if (self = [super init]) {
        //Init
        pixels = [self arrayWithWidth:wide height:high];
        _width = wide;
        _height = high;
    }
    
    return self;
}

-(PMPixel *)pixelAtX:(u_int)x y:(u_int)y
{
    return pixels[x][y];
}

-(NSMutableArray *)arrayWithWidth:(u_int)width height:(u_int)height
{
    NSMutableArray *returnArray = [NSMutableArray arrayWithCapacity:width];
    
    for (u_int i = 0; i<width; i++)
    {
        returnArray[i] = [NSMutableArray arrayWithCapacity:height];
        
        for (u_int j = 0; j<height; j++)
        {
            returnArray[i][j] = [[PMPixel alloc] init];
        }
    }
    
    return returnArray;
}

-(void)renderInRect:(CGRect)rect
{
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    CGContextScaleCTM(ref, rect.size.width/self.width, rect.size.height/self.height);
    
    //iterate
    for (u_int i = 0; i<self.width; i++)
    {
        for (u_int j = 0; j<self.height; j++)
        {
            PMPixel *pixel = [self pixelAtX:i y:j];
            CGContextSetFillColorWithColor(ref, pixel.color.CGColor);
            CGContextFillRect(ref, CGRectMake(i, j, 1, 1));
        }
    }
    
    
    CGContextScaleCTM(ref, self.width/rect.size.width, self.height/rect.size.height);
}

@end
