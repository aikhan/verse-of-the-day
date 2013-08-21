//
//  SearchTerm.h
//  VerseOfTheDay
//
//  Created by Asad Khan on 2/20/12.
//  Copyright (c) 2012 Semantic Notion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchTerm : NSObject <NSCoding>

@property(nonatomic, retain)NSString *text;
@property(nonatomic, retain)NSDate *timeStamp;
@end
