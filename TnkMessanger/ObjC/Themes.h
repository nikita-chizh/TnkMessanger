//
//  Themes.h
//  TnkMessanger
//
//  Created by Никита on 02/03/2019.
//  Copyright © 2019 Никита. All rights reserved.
//
#import <UIKit/UIKit.h>

#ifndef Themes_h
#define Themes_h
@interface Themes : NSObject
{
UIColor *theme0;
UIColor *theme1;
UIColor *theme2;

}
- (id) initWithColor: (UIColor *) color themeNum: (int)n;
- (void) setColor: (UIColor *) color themeNum: (int)n;

@end

#endif /* Themes_h */
