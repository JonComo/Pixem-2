//
//  PMPixel.h
//  Pixem
//
//  Created by Jon Como on 4/7/13.
//  Copyright (c) 2013 Jon Como. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PMPixel : NSObject

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, weak) PMPixel *n, *s, *e, *w;

@end
