//
//  DetailVerseViewController.m
//  VerseOfTheDay
//
//  Created by Asad Khan on 2/13/12.
//  Copyright (c) 2012 Semantic Notion. All rights reserved.
//

#import "DetailVerseViewController.h"
#import "AppDelegate.h"
#import "Verse.h"
#import "SemanticNotionTextView.h"

@implementation DetailVerseViewController
@synthesize pageControl, scrollView, numberOfPages, verseArray, topLabel, categoryName, outOfLabel, favButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withVerseArray:(NSArray *)arrayOfVerses withCategoryName:(NSString *)name
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.verseArray = arrayOfVerses;
        numberOfPages = [self.verseArray count];
        self.categoryName = name;
        
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.topLabel.textColor = [UIColor colorWithRed:227/255.0 green:209.0/255.0 blue:102.0/255.0 alpha:1.0];
    self.topLabel.text = self.categoryName;
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * self.numberOfPages, scrollView.frame.size.height);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.scrollsToTop = NO;
    self.scrollView.delegate = self;
    
    self.pageControl.numberOfPages = self.numberOfPages;
    self.pageControl.currentPage = 0;
    
    
    for (int i = 0; i < self.numberOfPages; i++) {
        [self loadScrollViewWithPage:i];
    }
    self.outOfLabel.text = [NSString stringWithFormat:@"1 out of %d", [self.verseArray count]];
    Verse * verse = [self.verseArray objectAtIndex:self.pageControl.currentPage];
    if (verse.isFavorite) {
        [self.favButton setImage:[UIImage imageNamed:@"btn_star.png"] forState:UIControlStateNormal];
    }
    else{
        [self.favButton setImage:[UIImage imageNamed:@"estar.png"] forState:UIControlStateNormal];
    }
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

- (IBAction)backTapped{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)scrollRight:(id)sender
{
    
    self.pageControl.currentPage++;
    int page = self.pageControl.currentPage;
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [self.scrollView scrollRectToVisible:frame animated:YES];
    
    
}

-(IBAction)scrollLeft:(id)sender
{
    self.pageControl.currentPage--;
    int page = self.pageControl.currentPage;
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [self.scrollView scrollRectToVisible:frame animated:YES];
}

- (void)loadScrollViewWithPage:(int)page {
    
    SemanticNotionTextView * verseTextView = [[SemanticNotionTextView alloc] init];
    
    CGRect frame = self.scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = -6;
    
    verseTextView.frame = frame;
    [verseTextView styleString];
    //AppDelegate * appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
    Verse * verse = [self.verseArray objectAtIndex:page];
    verseTextView.text = verse.verse;
    verseTextView.font = [UIFont fontWithName:@"Blokletters Balpen" size:13.0];
    NSLog(@"%@",verse.verse);
    verseTextView.delegate = self;
    verseTextView.editable = NO;
    verseTextView.backgroundColor = [UIColor clearColor];
    verseTextView.textColor = [UIColor colorWithRed:64.0/255.0 green:31.0/255.0 blue:20.0/255.0 alpha:1.0];
    if (verse.isFavorite) {
        [self.favButton setImage:[UIImage imageNamed:@"btn_star.png"] forState:UIControlStateNormal];
    }
    else{
        [self.favButton setImage:[UIImage imageNamed:@"estar.png"] forState:UIControlStateNormal];
    }
    [self.scrollView addSubview:verseTextView];
    
    
}



- (void)scrollViewDidScroll:(UIScrollView *)sender {
    
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    if (page < 0 || page == [self.verseArray count]) {
        return;
    }
    
    self.pageControl.currentPage = page;
    self.outOfLabel.text = [NSString stringWithFormat:@"%d out of %d", page+1, [self.verseArray count]];
    
    Verse * verse = [self.verseArray objectAtIndex:page];
    if (verse.isFavorite) {
        [self.favButton setImage:[UIImage imageNamed:@"btn_star.png"] forState:UIControlStateNormal];
    }
    else{
        [self.favButton setImage:[UIImage imageNamed:@"estar.png"] forState:UIControlStateNormal];
    }
    
    
}


- (IBAction)changePage:(id)sender {
    
    int page = self.pageControl.currentPage;
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [self.scrollView scrollRectToVisible:frame animated:YES];
}
- (IBAction)favouriteTapped:(id)sender{
    NSLog(@"Fav tapped page num is %d", self.pageControl.currentPage);
    
    Verse * verse = [self.verseArray objectAtIndex:self.pageControl.currentPage];
    if (!verse.isFavorite) {
        [self.favButton setImage:[UIImage imageNamed:@"btn_star.png"] forState:UIControlStateNormal];
        verse.isFavorite = YES;
    }
    else{
        [self.favButton setImage:[UIImage imageNamed:@"estar.png"] forState:UIControlStateNormal];
        verse.isFavorite = NO;
        AppDelegate * appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
        NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
        appDelegate.favouritesArray = (NSMutableArray*)[standardUserDefaults objectForKey:@"favoritesArray"];
        NSMutableSet *tempSet = [[NSMutableSet alloc] initWithArray:appDelegate.favouritesArray];
        NSMutableSet  *removeSet = [[NSMutableSet alloc] init];
        for (int i=0; i<[appDelegate.favouritesArray count]; i++) {
            if ([[appDelegate.favouritesArray objectAtIndex:i] intValue] == verse.verseID) {
                [removeSet addObject:[appDelegate.favouritesArray objectAtIndex:i]];
            }
        }
        
        [tempSet minusSet:removeSet];
        NSMutableArray *tempArray = [NSMutableArray arrayWithArray:[tempSet allObjects]];
        appDelegate.favouritesArray = tempArray;
    }
    NSLog(@"Favorite verse id is %d", verse.verseID);
}
@end
