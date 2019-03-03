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

- (id) initWithColors: (UIColor *) c0 color1: (UIColor *)c1 color2: (UIColor *)c2{
    self = [self init];
    if(self)
    {
        theme0 = c0;
        theme1 = c1;
        theme2 = c2;
    }
    return self;
}

- (UIColor *) getFirst{
    return theme0;
}

- (UIColor *) getSecond{
    return theme1;
}

- (UIColor *) getThird{
    return theme2;
}


@end
