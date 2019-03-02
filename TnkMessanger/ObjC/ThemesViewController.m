//
//  ThemesViewController.m
//  TnkMessanger
//
//  Created by Никита on 02/03/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

#import "ThemesViewController.h"
#import "Themes.h"

@interface ThemesViewController ()

@end

@implementation ThemesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Add an action in current code file (i.e. target)
    [Theme0 addTarget:self action:@selector(setThemeOne:)
     forControlEvents:UIControlEventTouchUpInside];

    self->_delegate = self;
    
    }

- (void)setThemeOne:(UIButton *)button {
    NSLog(@"Button Pressed");
    UIColor *color = [UIColor colorWithRed:66/255.0
                                     green:79/255.0
                                      blue:91/255.0
                                     alpha:1];

    [_delegate themesViewController:self didSelectTheme: color];
}

-(void)themesViewController: (ThemesViewController *)controller
             didSelectTheme:(UIColor *)selectedTheme{
    NSLog(@"themesViewController");

}



- (void)dealloc {
    [Theme1 release];
    [Theme0 release];
    [Theme1 release];
    [Theme2 release];
    [Theme0 release];
    [Theme1 release];
    [Theme2 release];
    [super dealloc];
}
@end
