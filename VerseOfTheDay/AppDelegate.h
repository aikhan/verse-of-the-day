//
//  AppDelegate.h
//  VerseOfTheDay
//
//  Created by Saleh Shah on 2/7/12.
//  Copyright (c) 2012 Semantic Notion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTabBarViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    
    NSSet * verseSet;
    NSMutableArray * verseArray;
}

@property(nonatomic,retain) NSSet * verseSet;
@property(nonatomic,retain) NSMutableArray * verseArray;
@property(nonatomic,retain) NSMutableArray * unUsedVerseArray;
@property(nonatomic, retain) NSMutableArray *generalCategoriesArray;
@property(nonatomic, retain) NSMutableArray *seasonalCategoriesArray;
@property(nonatomic, retain) NSMutableDictionary *generalCategoryCountDictionary;
@property(nonatomic, retain) NSMutableDictionary *seasonalCategoryCountDictionary;
@property(nonatomic, retain) NSString *currentView;
@property(nonatomic, retain) NSMutableArray *favouritesArray;
@property (strong, nonatomic) UIWindow *window;
@property(nonatomic, retain) NSMutableDictionary *categoryDict;
@property (strong, nonatomic) CustomTabBarViewController *tabBarController;


-(void)readDataFromPhone;
-(void)writeDataToPhone;
-(void) createTabBar;

-(void) parseJson;
- (void)updateVerseArrayForDayChange;

@end
