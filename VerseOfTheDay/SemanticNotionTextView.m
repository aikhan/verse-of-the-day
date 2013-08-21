//
//  SemanticNotionTextView.m
//  VerseOfTheDay
//
//  Created by Asad Khan on 3/15/12.
//  Copyright (c) 2012 Semantic Notion. All rights reserved.
//

#import "SemanticNotionTextView.h"
#import "UITextView+UITextView_StyleString.h"

@implementation SemanticNotionTextView

- (id)styleString {
    NSLog(@"inside style string");
    return [[super styleString] stringByAppendingString:@"; line-height: 1.65em"];
    
}
@end
