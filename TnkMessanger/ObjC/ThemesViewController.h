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

@interface ThemesViewController : UIViewController<ThemesViewControllerDelegate>
{
    Themes *model;
    IBOutlet UIButton *Theme0;
    IBOutlet UIButton *Theme1;
    IBOutlet UIButton *Theme2;
}

- (void)setThemeOne:(UIButton *)button;

@property (nonatomic, weak) id<ThemesViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
