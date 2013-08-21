//
//  AppDelegate.m
//  VerseOfTheDay
//
//  Created by Saleh Shah on 2/7/12.
//  Copyright (c) 2012 Semantic Notion. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "JSON.h"
#import "NSArray+ReplaceNull.h"
#import "Verse.h"
#import "Category.h"
@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController,verseSet,verseArray, generalCategoriesArray, seasonalCategoriesArray, seasonalCategoryCountDictionary, generalCategoryCountDictionary, currentView, favouritesArray, categoryDict, unUsedVerseArray;

static NSInteger appStartupCount;
static NSUInteger startupCounter = 0;// counter to check application did become active code is not run for the first time
static int count;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   
    [self updateVerseArrayForDayChange];
    count = 0;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent];
    self.favouritesArray = [[NSMutableArray alloc] init];
    
    [self createTabBar];
    [self parseJson];
    [self.window makeKeyAndVisible];
    return YES;
}

+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime
{
    NSDate *fromDate;
    NSDate *toDate;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate
                 interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate
                 interval:NULL forDate:toDateTime];
    NSDateComponents *difference = [calendar components:NSDayCalendarUnit
                                               fromDate:fromDate toDate:toDate options:0];
    return [difference day];
}

-(void) createTabBar
{
    self.tabBarController = [[CustomTabBarViewController alloc] initWithNibName:nil bundle:nil];
    [self.window addSubview:self.tabBarController.view];
}

-(void) parseJson
{
    self.verseArray = [[NSMutableArray alloc] init];
    self.unUsedVerseArray = [[NSMutableArray alloc] init];
    NSString *linksPath = [[NSBundle mainBundle] pathForResource:@"test_verses" ofType:@"txt"];
    NSError * error;
    NSString * jsonString = [NSString stringWithContentsOfFile:linksPath encoding:NSUTF8StringEncoding error:&error]; 
    NSArray *parsedJason = [[jsonString JSONValue] replaceNullWithNilInDictionary];
    int count= 0 ;
    for (NSDictionary * obj in parsedJason) 
    {
        NSInteger verseID = [[obj objectForKey:@"verse_id"] intValue];
        NSString * verseText = [obj objectForKey:@"verse"];
        NSString * liveDate = [obj objectForKey:@"new_live_date"]; 
        NSString * inputDate = [obj objectForKey:@"input_date"]; 
        NSString * editDate = [obj objectForKey:@"edit_date"];
        NSInteger freeVerse = [[obj objectForKey:@"free_verse"] intValue];
        BOOL isFreeVerse;
        if (freeVerse == 0) {
            
            isFreeVerse = NO;
        }
        else
        {
            isFreeVerse = YES;
        }
        
        NSDateFormatter *f = [[NSDateFormatter alloc] init];
        [f setDateFormat:@"ddMM"];
        NSDate *currentDate = [NSDate date];
        NSString *currentDateString = [f stringFromDate:currentDate];
        if([liveDate isEqualToString:currentDateString]){
//            NSLog(@"Yaay date is equal");
//            NSLog(@"today %@, compare date %@", currentDateString, liveDate);
        }
        NSDate *verseDate = [f dateFromString:liveDate];
        count++;
        NSInteger catID = 0;
        for (NSInteger i=1; i<=44; i++) {
            NSInteger j = [[obj objectForKey:[NSString stringWithFormat:@"cat%d", i]] intValue];
            if (j == 1) {
                catID = i;
            }
        }
        Verse * verse = [[Verse alloc] initWithID:verseID verse:verseText liveDate:liveDate inputDate:inputDate editDate:editDate isFreeVerse:isFreeVerse catID:catID isFavorite:NO withLiveDate:verseDate];
        if ([verse.liveDate isEqualToString:@""] || verse.liveDate == nil) {
            [self.verseArray addObject:verse];
        }
        else {
            [self.unUsedVerseArray addObject:verse];
        }
    }

    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"latestLiveDate"
                                                 ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray;
    sortedArray = [self.unUsedVerseArray sortedArrayUsingDescriptors:sortDescriptors];
    self.unUsedVerseArray = (NSMutableArray *)sortedArray;

    if (appStartupCount >= 200) {
        for (int i=0; i<[self.unUsedVerseArray count]; i++) {
            Verse *verse1 = [self.unUsedVerseArray objectAtIndex:i];
            NSDateFormatter *f = [[NSDateFormatter alloc] init];
            [f setDateFormat:@"ddMM"];
            NSDate *currentDate = [NSDate date];
            NSString *currentDateString = [f stringFromDate:currentDate];
            if([verse1.liveDate isEqualToString:currentDateString] && i>=6){
                [self.verseArray addObject:[self.unUsedVerseArray objectAtIndex:i-6]];
                [self.verseArray addObject:[self.unUsedVerseArray objectAtIndex:i-5]];
                [self.verseArray addObject:[self.unUsedVerseArray objectAtIndex:i-4]];
                [self.verseArray addObject:[self.unUsedVerseArray objectAtIndex:i-3]];
                [self.verseArray addObject:[self.unUsedVerseArray objectAtIndex:i-2]];
                [self.verseArray addObject:[self.unUsedVerseArray objectAtIndex:i-1]];
                [self.verseArray addObject:verse1];
            }
            else if ([verse1.liveDate isEqualToString:currentDateString] && i==5){
                [self.verseArray addObject:[self.unUsedVerseArray objectAtIndex:i-5]];
                [self.verseArray addObject:[self.unUsedVerseArray objectAtIndex:i-4]];
                [self.verseArray addObject:[self.unUsedVerseArray objectAtIndex:i-3]];
                [self.verseArray addObject:[self.unUsedVerseArray objectAtIndex:i-2]];
                [self.verseArray addObject:[self.unUsedVerseArray objectAtIndex:i-1]];
                [self.verseArray addObject:verse1];
            }
            else if ([verse1.liveDate isEqualToString:currentDateString] && i==4){
                [self.verseArray addObject:[self.unUsedVerseArray objectAtIndex:i-4]];
                [self.verseArray addObject:[self.unUsedVerseArray objectAtIndex:i-3]];
                [self.verseArray addObject:[self.unUsedVerseArray objectAtIndex:i-2]];
                [self.verseArray addObject:[self.unUsedVerseArray objectAtIndex:i-1]];
                [self.verseArray addObject:verse1];
            }
            else if ([verse1.liveDate isEqualToString:currentDateString] && i==3){
                [self.verseArray addObject:[self.unUsedVerseArray objectAtIndex:i-3]];
                [self.verseArray addObject:[self.unUsedVerseArray objectAtIndex:i-2]];
                [self.verseArray addObject:[self.unUsedVerseArray objectAtIndex:i-1]];
                [self.verseArray addObject:verse1];
            }
            else if ([verse1.liveDate isEqualToString:currentDateString] && i==2){
                [self.verseArray addObject:[self.unUsedVerseArray objectAtIndex:i-2]];
                [self.verseArray addObject:[self.unUsedVerseArray objectAtIndex:i-1]];
                [self.verseArray addObject:verse1];
            }
            else if ([verse1.liveDate isEqualToString:currentDateString] && i==1){
                [self.verseArray addObject:[self.unUsedVerseArray objectAtIndex:i-1]];
                [self.verseArray addObject:verse1];
            }
            else if ([verse1.liveDate isEqualToString:currentDateString] && i==0){
                [self.verseArray addObject:verse1];
            }
            
        } 
    }
    self.generalCategoriesArray = [[NSMutableArray alloc] init];
    self.seasonalCategoriesArray = [[NSMutableArray alloc] init];
    linksPath = [[NSBundle mainBundle] pathForResource:@"categories" ofType:@"txt"];
    jsonString = [NSString stringWithContentsOfFile:linksPath encoding:NSUTF8StringEncoding error:&error];
    parsedJason = [[jsonString JSONValue] replaceNullWithNilInDictionary];
    for (NSDictionary * obj in parsedJason) 
    {
        Category *category = [[Category alloc] init];
        category.id = [[obj objectForKey:@"id"] intValue];
        category.parentId = [[obj objectForKey:@"parentid"] intValue];
        category.name = [obj objectForKey:@"name"];
        if (category.parentId == 2) {
            [self.generalCategoriesArray addObject:category];
        }
        else
            [self.seasonalCategoriesArray addObject:category];
        
    }
    self.categoryDict = [[NSMutableDictionary alloc] init];
    
    for (Category *cat in generalCategoriesArray ) {
        [self.categoryDict setValue:cat.name forKey:[NSString stringWithFormat:@"%d", cat.id]];
    }
    for (Category *cat in seasonalCategoriesArray ) {
        [self.categoryDict setValue:cat.name forKey:[NSString stringWithFormat:@"%d", cat.id]];
    }
    
    self.generalCategoryCountDictionary = [[NSMutableDictionary alloc] init];
    for (Verse *verse2 in self.verseArray) {
        NSString *key = [NSString stringWithFormat:@"%d", verse2.catID];
        NSNumber *value = (NSNumber *)[generalCategoryCountDictionary valueForKey:key];
        
        int i = [value intValue] + 1;
        [generalCategoryCountDictionary setValue:[NSNumber numberWithInt:i] forKey:key];
    }

    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    self.favouritesArray = (NSMutableArray*)[standardUserDefaults objectForKey:@"favoritesArray"];
    NSMutableArray *tempArray = [standardUserDefaults objectForKey:@"favoritesArray"];
    if ([self.favouritesArray count] != 0) {
        for (int i=0; i<[self.verseArray count]; i++) {
            for (int j = 0; j < [self.favouritesArray count]; j++) {
                if ([[self.favouritesArray objectAtIndex:j] intValue] == [[self.verseArray objectAtIndex:i] verseID]) {
                    [[self.verseArray objectAtIndex:i] setIsFavorite:YES];
                }
            }
        }
    }else
        NSLog(@"Returned Array is empty");
    
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    if (standardUserDefaults) {
        for (Verse *verse in self.verseArray) {
            if (verse.isFavorite) {
                if (!self.favouritesArray) {
                    self.favouritesArray = [[NSMutableArray alloc] init];
                }
                NSMutableArray *tempArray = [self.favouritesArray mutableCopy];
                [tempArray addObject:[NSNumber numberWithInt:verse.verseID]];
                self.favouritesArray = tempArray;
            }
        }
        [standardUserDefaults setObject:self.favouritesArray forKey:@"favoritesArray"];
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application

{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
    
}



- (void)updateVerseArrayForDayChange{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    appStartupCount = [standardUserDefaults integerForKey:@"startupcount"];
    if (appStartupCount < 200) {
        appStartupCount = 200;
    }//
    if (appStartupCount > 566) {
        appStartupCount = 200;
    }
    NSString *prevoiusDateString = [standardUserDefaults stringForKey:@"previousdate"];
    NSDate *previousDate;
    if (prevoiusDateString) {
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"YYYY-MM-dd"];
        previousDate = [dateFormat dateFromString:prevoiusDateString];
    }
    int numOfDays = 0;//[AppDelegate daysBetweenDate:previousDate andDate:[NSDate date]];
    if (previousDate) {
        numOfDays = [AppDelegate daysBetweenDate:previousDate andDate:[NSDate date]];
    }
    
    NSLog(@"%d", numOfDays);
    if (  numOfDays >= 1 ) {
        appStartupCount = appStartupCount + numOfDays; 
    }
    
    NSLog(@"Appcount is %d", appStartupCount);
    [standardUserDefaults setInteger:appStartupCount forKey:@"startupcount"];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"YYYY-MM-dd"];
    NSDate *today = [NSDate date];
    NSString * todaysDate = [dateFormat stringFromDate:today];
    [standardUserDefaults setObject:todaysDate forKey:@"previousdate"];
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
    if (!startupCounter == 0) {
        //[self performSelector:@selector(hasReturned) withObject:nil afterDelay:0.01];
        [NSThread detachNewThreadSelector:@selector(hasReturned) toTarget:self withObject:nil];
    }
    startupCounter++;
    
}

- (void)hasReturned{
    [self parseJson];
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    self.favouritesArray = (NSMutableArray*)[standardUserDefaults objectForKey:@"favoritesArray"];
    NSArray *tempArray = [standardUserDefaults objectForKey:@"favoritesArray"];
    NSLog(@"Temp array count %d", [tempArray count]);
    if ([self.favouritesArray count] != 0) {
        for (int i=0; i<[self.verseArray count]; i++) {
            for (int j = 0; j < [self.favouritesArray count]; j++) {
                if ([[self.favouritesArray objectAtIndex:j] intValue] == [[self.verseArray objectAtIndex:i] verseID]) {
                    [[self.verseArray objectAtIndex:i] setIsFavorite:YES];
                    NSLog(@"Favorited1 %@", [[self.verseArray objectAtIndex:i] verse]);
                }
            }
        }
    }else
        NSLog(@"Returned Array is empty");
}
- (void)startAnimation{
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.window addSubview:activityIndicator];
    [self.window bringSubviewToFront:activityIndicator];
    activityIndicator.hidesWhenStopped = YES;
    [activityIndicator startAnimating];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    if (standardUserDefaults) {
        [self.favouritesArray removeAllObjects];
        for (Verse *verse in self.verseArray) {
            if (verse.isFavorite) {
                [self.favouritesArray addObject:[NSNumber numberWithInt:verse.verseID]];
            }
        }
        [standardUserDefaults setObject:self.favouritesArray forKey:@"favoritesArray"];
    }

}

#pragma mark -
#pragma Plist functions
-(void)readDataFromPhone{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"Favorites.plist"];
}
                         

-(void)writeDataToPhone{
    
}

@end
