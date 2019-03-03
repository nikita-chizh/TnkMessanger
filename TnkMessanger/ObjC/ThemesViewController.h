//
//  ThemesViewController.h
//  TnkMessanger
//
//  Created by Никита on 02/03/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Themes.h"
#import "ThemesViewControllerDelegate.h"

NS_ASSUME_NONNULL_BEGIN
#define _white [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0]
#define _black [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0]
#define _red [UIColor colorWithRed:255.0/255.0 green:0 blue:0 alpha:1.0]
@interface ThemesViewController : UIViewController<ThemesViewControllerDelegate>
{
    Themes *model;
    IBOutlet UIButton *Theme0;
    IBOutlet UIButton *Theme1;
    IBOutlet UIButton *Theme2;
}

- (void)setThemeOne:(UIButton *)button;
- (void)setThemeTwo:(UIButton *)button;
- (void)setThemeThree:(UIButton *)button;

@property (nonatomic, weak) id<ThemesViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
