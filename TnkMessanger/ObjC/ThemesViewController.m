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
    model = [Themes alloc];
    model = [model initWithColors: _white color1: _black color2: _red];
    
    [Theme0 addTarget:self action:@selector(setThemeOne:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [Theme1 addTarget:self action:@selector(setThemeTwo:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [Theme2 addTarget:self action:@selector(setThemeThree:)
     forControlEvents:UIControlEventTouchUpInside];

    self->_delegate = self;
    
    }

- (void)setThemeOne:(UIButton *)button {
    [_delegate themesViewController:self didSelectTheme: model.getFirst];
}

- (void)setThemeTwo:(UIButton *)button {
    [_delegate themesViewController:self didSelectTheme: model.getSecond];
}

- (void)setThemeThree:(UIButton *)button {
    [_delegate themesViewController:self didSelectTheme: model.getThird];
}

-(void)themesViewController: (ThemesViewController *)controller
             didSelectTheme:(UIColor *)selectedTheme{
    NSLog(@"themesViewController");
    //[[UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTextColor:[UIColor whiteColor]];

    [[UINavigationBar appearance] setBackgroundColor:[UIColor orangeColor]];
    NSLog(@"check");

}

- (void)dealloc {
    [model dealloc];
    [Theme0 release];
    [Theme1 release];
    [Theme2 release];
    [super dealloc];
}
@end
