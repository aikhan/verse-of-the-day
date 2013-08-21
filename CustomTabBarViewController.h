//
//  CustomTabBarViewController.h
//  PickUplines
//
//  Created by Saleh Shah on 10/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTabBarViewController : UIViewController {
    
    UIButton * button1;
    UIButton * button2;
    UIButton * button3;
    UIButton * button4;
    UIButton * button5;
    
    NSMutableArray *tabBarControllers;
    
    UIViewController * visibleViewController;
    UIImageView * tabBarBG;
    UIImageView * separator1;
    UIImageView * separator2;
    UIImageView * separator3;
    UIImageView * separator4;
}

@property (nonatomic, retain) UIButton * button1;
@property (nonatomic, retain) UIButton * button2;
@property (nonatomic, retain) UIButton * button3;
@property (nonatomic, retain) UIButton * button4;
@property (nonatomic, retain) UIButton * button5;

@property (nonatomic, retain) NSMutableArray *tabBarControllers;
@property (nonatomic, retain) UIViewController * visibleViewController;
@property (nonatomic, retain) UIImageView * tabBarBG;

-(void)buttonClicked:(id)sender;
-(void)createTabBarItems;
- (void)hideTabBar;
- (void)showTabBar;

@end
