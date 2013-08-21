//
//  NSMutableArray+Reverse.m
//  VerseOfTheDay
//
//  Created by Asad Khan on 2/20/12.
//  Copyright (c) 2012 Semantic Notion. All rights reserved.
//

#import "NSMutableArray+Reverse.h"


@implementation NSMutableArray (Reverse)

- (void)reverse {
    for(int i = 0; i < [self count] / 2; i++) {
        int j = [self count] - i - 1;
        
        id temp = [self objectAtIndex:i];
        
        [self replaceObjectAtIndex:i withObject:[self objectAtIndex:j]];
        [self replaceObjectAtIndex:j withObject:temp];
        
    }
}

@end
