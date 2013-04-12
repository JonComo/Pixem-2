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
        
        [self associatePixels];
        
        _width = wide;
        _height = high;
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:pixels forKey:@"pixels"];
    [aCoder encodeObject:@(self.width) forKey:@"width"];
    [aCoder encodeObject:@(self.height) forKey:@"height"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        //Init
        pixels = [aDecoder decodeObjectForKey:@"pixels"];
        self.width = [[aDecoder decodeObjectForKey:@"width"] unsignedIntValue];
        self.height = [[aDecoder decodeObjectForKey:@"height"] unsignedIntValue];
    }
    
    return self;
}

-(PMPixel *)pixelAtX:(int)x y:(int)y
{
    if (x < 0) x = 0;
    if (y < 0) y = 0;
    
    if (x > self.width - 1) x = self.width - 1;
    if (y > self.height - 1) y = self.height - 1;
    
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
            PMPixel *newPixel = [[PMPixel alloc] init];
            returnArray[i][j] = newPixel;
        }
    }
    
    return returnArray;
}

-(void)associatePixels
{
    for (u_int i = 0; i<self.width; i++)
    {
        for (u_int j = 0; j<self.height; j++)
        {
            PMPixel *pixel = [self pixelAtX:i y:j];
            
            pixel.n = [self pixelAtX:i y:j-1];
            pixel.s = [self pixelAtX:i y:j+1];
            pixel.e = [self pixelAtX:i-1 y:j];
            pixel.w = [self pixelAtX:i+1 y:j];
        }
    }
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
