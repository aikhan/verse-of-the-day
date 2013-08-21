//
//  Verse.h
//  VerseOfTheDay
//
//  Created by Saleh Shah on 2/7/12.
//  Copyright (c) 2012 Semantic Notion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Verse : NSObject {
    
    NSInteger verseID;
    NSString * verse;
    NSString * liveDate;
    NSString * inputDate;
    NSString * editDate;
    BOOL isFreeVerse;
    NSInteger catID; 
    BOOL isFavorite;
    
}

@property(nonatomic,readwrite) NSInteger verseID;
@property(nonatomic,retain) NSString * verse;
@property(nonatomic,retain) NSString * liveDate;
@property(nonatomic,retain) NSString * inputDate;
@property(nonatomic,retain) NSString * editDate;
@property(nonatomic,readwrite) BOOL isFreeVerse;
@property(nonatomic,readwrite) BOOL isFavorite;
@property(nonatomic,readwrite) NSInteger catID; 
@property(nonatomic,retain) NSDate * latestLiveDate;

-(id)initWithID:(NSInteger)ID verse: (NSString*)verseText liveDate:(NSString*)lDate inputDate:(NSString*)iDate editDate:(NSString*)eDate isFreeVerse:(BOOL)isFree catID:(NSInteger)cID isFavorite:(BOOL)favorite withLiveDate:(NSDate*)cLatestLiveDate;

@end
