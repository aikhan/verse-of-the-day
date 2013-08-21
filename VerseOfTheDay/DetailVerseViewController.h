//
//  DetailVerseViewController.h
//  VerseOfTheDay
//
//  Created by Asad Khan on 2/13/12.
//  Copyright (c) 2012 Semantic Notion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailVerseViewController : UIViewController <UITextViewDelegate,UIScrollViewDelegate> {
    
    IBOutlet UIScrollView * scrollView;
    
    IBOutlet UIPageControl *pageControl;
}

@property(nonatomic,retain) IBOutlet UIScrollView * scrollView;
@property(nonatomic,retain) IBOutlet UIPageControl *pageControl;
@property(nonatomic, assign)int numberOfPages;
@property(nonatomic, retain)NSArray *verseArray;
@property(nonatomic, retain)IBOutlet UILabel *topLabel;
@property(nonatomic, retain)NSString * categoryName;
@property(nonatomic, retain)IBOutlet UILabel *outOfLabel;
@property(nonatomic,retain) IBOutlet UIButton *favButton;

- (void)loadScrollViewWithPage:(int)page;

-(IBAction)scrollRight:(id)sender;
-(IBAction)scrollLeft:(id)sender;

-(IBAction)backTapped;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withVerseArray:(NSArray *)arrayOfVerses withCategoryName:(NSString *)name;
- (IBAction)favouriteTapped:(id)sender;
@end
