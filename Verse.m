//
//  Verse.m
//  VerseOfTheDay
//
//  Created by Saleh Shah on 2/7/12.
//  Copyright (c) 2012 Semantic Notion. All rights reserved.
//

#import "Verse.h"

@implementation Verse

@synthesize verseID,verse,liveDate,inputDate,editDate,isFreeVerse,catID, isFavorite, latestLiveDate;

-(id)initWithID:(NSInteger)ID verse: (NSString*)verseText liveDate:(NSString*)lDate inputDate:(NSString*)iDate editDate:(NSString*)eDate isFreeVerse:(BOOL)isFree catID:(NSInteger)cID isFavorite:(BOOL)favorite withLiveDate:(NSDate*)cLatestLiveDate
{
    self = [super init];
    if (self) {
		self.verseID = ID;
        self.verse = verseText;
        self.liveDate = lDate;
        self.inputDate = iDate;
        self.editDate = eDate;
        self.isFreeVerse = isFree;
        self.catID = cID;
        self.isFavorite = favorite;
        self.latestLiveDate = cLatestLiveDate;
	}
	return self;
}

@end
