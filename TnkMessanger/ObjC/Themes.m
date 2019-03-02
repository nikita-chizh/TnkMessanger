//
//  Themes.m
//  TnkMessanger
//
//  Created by Никита on 02/03/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Themes.h"


@implementation Themes

- (id) initWithColor: (UIColor *) color themeNum: (int)n{
    self = [super init];
    if(self)
    {
        [self setColor: color themeNum: n];
    }
    return self;
}

- (void) setColor: (UIColor *) color themeNum: (int)n{
    if(n == 0)
        theme0 = color;
    if(n == 1)
        theme1 = color;
    if(n == 2)
        theme2 = color;
    }

@end
