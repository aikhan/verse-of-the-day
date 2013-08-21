//
//  CustomTabBarViewController.m
//  PickUplines
//
//  Created by Saleh Shah on 10/10/11.
//  Copyright (c) 2011 Semantic Notion. All rights reserved.
//

#import "CustomTabBarViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import "DailyVerseViewController.h"
#import "CategoriesViewController.h"
#import "SearchViewController.h"
#import "FavouritesViewController.h"
#import "FeedbackViewController.h"

@implementation CustomTabBarViewController

@synthesize button1,button2,button3,button4,button5,tabBarControllers,visibleViewController,tabBarBG;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    [super loadView];
    [self createTabBarItems];
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/


- (void)hideTabBar
{
	self.tabBarBG.hidden = YES;
    self.button1.hidden = YES;
	self.button2.hidden = YES;
	self.button3.hidden = YES;
	self.button4.hidden = YES;
	self.button5.hidden = YES;
    separator1.hidden = YES;
    separator2.hidden = YES;
    separator3.hidden = YES;
    separator4.hidden = YES;
}



- (void)showTabBar
{
	self.tabBarBG.hidden = NO;
    self.button1.hidden = NO;
	self.button2.hidden = NO;
	self.button3.hidden = NO;
	self.button4.hidden = NO;
	self.button5.hidden = NO;
    separator1.hidden = NO;
    separator2.hidden = NO;
    separator3.hidden = NO;
    separator4.hidden = NO;
}

-(void)createTabBarItems
{
	// Initialise our two images
    NSLog(@"create tab bar items");
    NSString * deviceType = [UIDevice currentDevice].model;
    
    
//    if ([deviceType isEqualToString:@"iPad"] || [deviceType isEqualToString:@"iPad Simulator"]) {
//        
//        self.tabBarBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 948, 768, 56)];
//        self.tabBarBG.image = [UIImage imageNamed:@"tabBarBG-iPad.png"];
//    }
//    else
//    {
        self.tabBarBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 411, 320, 49)];
        self.tabBarBG.image = [UIImage imageNamed:@"tabBarBG.png"];
        
//    }
    
    
    
	[self.view addSubview:self.tabBarBG];
    
    float dx = 0;
    
    UIImage * separatorImage;
    
	UIImage *btnImage;
	UIImage *btnImageSelected;
	
	self.button1 = [UIButton buttonWithType:UIButtonTypeCustom]; //Setup the button
    
//    if ([deviceType isEqualToString:@"iPad"] || [deviceType isEqualToString:@"iPad Simulator"]) {
//        btnImage = [UIImage imageNamed:@"btn_live-iPad.png"];
//        btnImageSelected = [UIImage imageNamed:@"btn_live_selected-iPad.png"];
//        
//        self.button1.frame = CGRectMake(dx, 954, 168, 49); 
//    }
//    else
//    {
        btnImage = [UIImage imageNamed:@"btn_daily.png"];
        btnImageSelected = [UIImage imageNamed:@"btn_daily_selected.png"];
        self.button1.frame = CGRectMake(dx, 411, 64, 49); 
        
//    }
    
	[self.button1 setBackgroundImage:btnImage forState:UIControlStateNormal];
	[self.button1 setBackgroundImage:btnImageSelected forState:UIControlStateSelected]; 
	[self.button1 setTag:0];
	[self.button1 setSelected:true];
	
    dx += self.button1.frame.size.width;
    
    
//    if ([deviceType isEqualToString:@"iPad"] || [deviceType isEqualToString:@"iPad Simulator"]) {
//        
//        separatorImage = [UIImage imageNamed:@"tab_bar_separator-iPad.png"];
//        separator1 = [[UIImageView alloc] initWithFrame:CGRectMake(dx, 955, 2, 49)];
//        
//    }
//    else
//    {
        separatorImage = [UIImage imageNamed:@"tab_bar_separator.png"];
        separator1 = [[UIImageView alloc] initWithFrame:CGRectMake(dx, 411, 2, 49)];
        
        
//    }
    
    
    separator1.image = separatorImage;
//    [self.view addSubview:separator1];
//	dx += 2;
	
    
    self.button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    
//    if ([deviceType isEqualToString:@"iPad"] || [deviceType isEqualToString:@"iPad Simulator"]) {
//        btnImage = [UIImage imageNamed:@"btn_cat-iPad.png"];
//        btnImageSelected = [UIImage imageNamed:@"btn_messages_selected-iPad.png"];
//        
//        self.button2.frame = CGRectMake(dx, 954, 168, 49); 
//    }
//    else
//    {
        btnImage = [UIImage imageNamed:@"btn_categories.png"];
        btnImageSelected = [UIImage imageNamed:@"btn_categories_selected.png"];
        self.button2.frame = CGRectMake(dx, 411, 64, 49); 
        
//    }
    
    
    
	[self.button2 setBackgroundImage:btnImage forState:UIControlStateNormal];
	[self.button2 setBackgroundImage:btnImageSelected forState:UIControlStateSelected];
	[self.button2 setTag:1];
    

    
    dx += self.button2.frame.size.width;
    
    
//    if ([deviceType isEqualToString:@"iPad"] || [deviceType isEqualToString:@"iPad Simulator"]) {
//        
//        separator2 = [[UIImageView alloc] initWithFrame:CGRectMake(dx, 955, 2, 49)];
//        separator2.image = separatorImage;
//        
//    }
//    else
//    {
        separator2 = [[UIImageView alloc] initWithFrame:CGRectMake(dx, 411, 2, 49)];
        separator2.image = separatorImage;
        
        
//    }
    
//    [self.view addSubview:separator2];
//	dx += 2;
    
    
    
    
    
    
	self.button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    
//    if ([deviceType isEqualToString:@"iPad"] || [deviceType isEqualToString:@"iPad Simulator"]) {
//        btnImage = [UIImage imageNamed:@"btn_tool-iPad.png"];
//        btnImageSelected = [UIImage imageNamed:@"btn_tools_selected-iPad.png"];
//        
//        self.button3.frame = CGRectMake(dx, 948, 101, 61); 
//    }
//    else
//    {
        btnImage = [UIImage imageNamed:@"btn_search.png"];
        btnImageSelected = [UIImage imageNamed:@"btn_search_selected.png"];
        
        self.button3.frame = CGRectMake(dx, 411, 64, 49);
        
//    }
    
	[self.button3 setBackgroundImage:btnImage forState:UIControlStateNormal];
	[self.button3 setBackgroundImage:btnImageSelected forState:UIControlStateSelected];
	[self.button3 setTag:2];
	
	
	
	dx += self.button3.frame.size.width;
    
//    if ([deviceType isEqualToString:@"iPad"] || [deviceType isEqualToString:@"iPad Simulator"]) {
//        
//        separator3 = [[UIImageView alloc] initWithFrame:CGRectMake(dx, 955, 2, 49)];
//        separator3.image = separatorImage;
//        
//    }
//    else
//    {
        separator3 = [[UIImageView alloc] initWithFrame:CGRectMake(dx, 411, 2, 49)];
        separator3.image = separatorImage;
        
        
//    }
//    [self.view addSubview:separator3];
//	dx += 2;
	
    
    
    
    self.button4 = [UIButton buttonWithType:UIButtonTypeCustom];
//    if ([deviceType isEqualToString:@"iPad"] || [deviceType isEqualToString:@"iPad Simulator"]) {
//        btnImage = [UIImage imageNamed:@"btn_groups-iPad.png"];
//        btnImageSelected = [UIImage imageNamed:@"btn_groups_selected-iPad.png"];
//        
//        self.button4.frame = CGRectMake(dx, 954, 153, 49); 
//    }
//    else
//    {
        btnImage = [UIImage imageNamed:@"btn_favourites.png"];
        btnImageSelected = [UIImage imageNamed:@"btn_favourites_selected.png"];
        
        self.button4.frame = CGRectMake(dx, 411, 64, 49);
        
//    }
    
	
	[self.button4 setBackgroundImage:btnImage forState:UIControlStateNormal];
	[self.button4 setBackgroundImage:btnImageSelected forState:UIControlStateSelected];
	[self.button4 setTag:3];
    
    
    
    dx += self.button4.frame.size.width;
    
//    if ([deviceType isEqualToString:@"iPad"] || [deviceType isEqualToString:@"iPad Simulator"]) {
//        
//        separator4 = [[UIImageView alloc] initWithFrame:CGRectMake(dx, 955, 2, 49)];
//        separator4.image = separatorImage;
//        
//    }
//    else
//    {
        separator4 = [[UIImageView alloc] initWithFrame:CGRectMake(dx, 411, 2, 49)];
        separator4.image = separatorImage;
        
//    }
//    [self.view addSubview:separator4];
//	dx += 2;
    
    
    
	self.button5= [UIButton buttonWithType:UIButtonTypeCustom];
	
//    if ([deviceType isEqualToString:@"iPad"] || [deviceType isEqualToString:@"iPad Simulator"]) {
//        btnImage = [UIImage imageNamed:@"btn_more-iPad.png"];
//        btnImageSelected = [UIImage imageNamed:@"btn_more_selected-iPad.png"];
//        
//        self.button5.frame = CGRectMake(dx, 954, 174, 49); 
//    }
//    else
//    {
        btnImage = [UIImage imageNamed:@"btn_feedback.png"];
        btnImageSelected = [UIImage imageNamed:@"btn_feedback_selected.png"];
        
        self.button5.frame = CGRectMake(dx, 411, 64, 49);
        
//    }
	[self.button5 setBackgroundImage:btnImage forState:UIControlStateNormal];
	[self.button5 setBackgroundImage:btnImageSelected forState:UIControlStateSelected];
	[self.button5 setTag:4];
	
	// Add my new buttons to the view
	[self.view addSubview:self.button1];
	[self.view addSubview:self.button2];
    [self.view addSubview:self.button3];
	[self.view addSubview:self.button4];
    [self.view addSubview:self.button5];
	
	// Setup event handlers so that the buttonClicked method will respond to the touch up inside event.
	[self.button1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
	[self.button2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
	[self.button3 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
	[self.button4 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.button5 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIViewController *viewController1, *viewController2, *viewController3, *viewController4, *viewController5;
    UINavigationController *navigationController1, *navigationController2,*navigationController3,*navigationController4, *navigationController5;
    
    
    
//    if ([deviceType isEqualToString:@"iPad"] || [deviceType isEqualToString:@"iPad Simulator"]) {
//        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"iPad Not supported!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
//        return;
//        viewController1 = [[ViewController alloc] initWithNibName:@"LiveFeedViewController-iPad" bundle:nil];
//        viewController2 = [[ViewController alloc] initWithNibName:@"MessagesViewController-iPad" bundle:nil];
//        viewController3 = [[ViewController alloc] initWithNibName:@"ToolsViewController-iPad" bundle:nil];
//        viewController4 = [[ViewController alloc] initWithNibName:@"CircleViewController-iPad" bundle:nil];
//        viewController5 = [[ViewController alloc] initWithNibName:@"MoreViewController-iPad" bundle:nil];
//    }
//    else
//    {
        viewController1 = [[DailyVerseViewController alloc] initWithNibName:@"DailyVerseViewController" bundle:nil];
        viewController2 = [[CategoriesViewController alloc] initWithNibName:@"CategoriesViewController" bundle:nil];
        viewController3 = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:nil];
        viewController4 = [[FavouritesViewController alloc] initWithNibName:@"FavouritesViewController" bundle:nil];
        viewController5 = [[FeedbackViewController alloc] initWithNibName:@"FeedbackViewController" bundle:nil];
        
//    }
    
    
    navigationController1 = [[UINavigationController alloc] initWithRootViewController:viewController1];
    navigationController2 = [[UINavigationController alloc] initWithRootViewController:viewController2];
    navigationController3 = [[UINavigationController alloc] initWithRootViewController:viewController3];
    navigationController4 = [[UINavigationController alloc] initWithRootViewController:viewController4];
    navigationController5 = [[UINavigationController alloc] initWithRootViewController:viewController5];
    
    self.tabBarControllers = [NSArray arrayWithObjects:navigationController1, navigationController2,navigationController3,navigationController4,navigationController5, nil];
    

    for (int i = [self.tabBarControllers count]-1; i >= 0; i--) {
        self.visibleViewController = [self.tabBarControllers objectAtIndex:i];
//        if ([deviceType isEqualToString:@"iPad"] || [deviceType isEqualToString:@"iPad Simulator"]) {
//            
//            self.visibleViewController.view.frame = CGRectMake(0, 0, 768, 955);
//        }
//        else
//        {
            self.visibleViewController.view.frame = CGRectMake(0, 0, 320, 416);
            
//        }
        
    }
    
    self.visibleViewController = [self.tabBarControllers objectAtIndex:0];
    [self.view addSubview:self.visibleViewController.view];
    
    [self.view bringSubviewToFront:self.tabBarBG];
    [self.view bringSubviewToFront:self.button1];
	[self.view bringSubviewToFront:self.button2];
	[self.view bringSubviewToFront:self.button3];
	[self.view bringSubviewToFront:self.button4];
	[self.view bringSubviewToFront:self.button5];
    [self.view bringSubviewToFront:separator1];
    [self.view bringSubviewToFront:separator2];
    [self.view bringSubviewToFront:separator3];
    [self.view bringSubviewToFront:separator4];
    
    
}

-(void)buttonClicked:(id)sender {
	int index = [sender tag];
    UIButton * selectedTabButton = (UIButton*) sender;
    [selectedTabButton setSelected:YES];
    
    if (selectedTabButton == self.button1) {
        [self.button2 setSelected:NO];
        [self.button3 setSelected:NO];
        [self.button4 setSelected:NO];
        [self.button5 setSelected:NO];
    }
    else if (selectedTabButton == self.button2) {
        [self.button1 setSelected:NO];
        [self.button3 setSelected:NO];
        [self.button4 setSelected:NO];
        [self.button5 setSelected:NO];
    }
    else if (selectedTabButton == self.button3) {
        [self.button1 setSelected:NO];
        [self.button2 setSelected:NO];
        [self.button4 setSelected:NO];
        [self.button5 setSelected:NO];
    }
    else if (selectedTabButton == self.button4) {
        [self.button1 setSelected:NO];
        [self.button2 setSelected:NO];
        [self.button3 setSelected:NO];
        [self.button5 setSelected:NO];
    }
    else if (selectedTabButton == self.button5) {
        [self.button1 setSelected:NO];
        [self.button2 setSelected:NO];
        [self.button3 setSelected:NO];
        [self.button4 setSelected:NO];
    }
             
    [self.visibleViewController.view removeFromSuperview];
    self.visibleViewController = nil;
    self.visibleViewController = [self.tabBarControllers objectAtIndex:index];
    [self.view addSubview:self.visibleViewController.view];
    
    [self.view bringSubviewToFront:self.tabBarBG];
    [self.view bringSubviewToFront:self.button1];
	[self.view bringSubviewToFront:self.button2];
	[self.view bringSubviewToFront:self.button3];
	[self.view bringSubviewToFront:self.button4];
	[self.view bringSubviewToFront:self.button5];
    [self.view bringSubviewToFront:separator1];
    [self.view bringSubviewToFront:separator2];
    [self.view bringSubviewToFront:separator3];
    [self.view bringSubviewToFront:separator4];
    
}




- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
