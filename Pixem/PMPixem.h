//
//  PMPixem.h
//  Pixem
//
//  Created by Jon Como on 4/7/13.
//  Copyright (c) 2013 Jon Como. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PMPixel;

@interface PMPixem : NSObject

@property u_int width, height;

-(id)init;
-(id)initWithPixelsWide:(u_int)wide high:(u_int)high;
-(PMPixel *)pixelAtX:(u_int)x y:(u_int)y;
-(void)renderInRect:(CGRect)rect;

@end