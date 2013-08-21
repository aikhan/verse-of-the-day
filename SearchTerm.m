//
//  SearchTerm.m
//  VerseOfTheDay
//
//  Created by Asad Khan on 2/20/12.
//  Copyright (c) 2012 Semantic Notion. All rights reserved.
//

#import "SearchTerm.h"

@implementation SearchTerm
@synthesize text, timeStamp;

- (void)encodeWithCoder:(NSCoder *)coder;
{
    [coder encodeObject:self.text forKey:@"text"];
    [coder encodeObject:self.timeStamp forKey:@"timestamp"];
}

- (id)initWithCoder:(NSCoder *)coder;
{
    self = [[SearchTerm alloc] init];
    if (self != nil)
    {
        self.text = [coder decodeObjectForKey:@"text"];
        self.timeStamp = [coder decodeObjectForKey:@"timestamp"];
    }   
    return self;
}
@end
