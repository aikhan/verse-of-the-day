//
//  Category.h
//  VerseOfTheDay
//
//  Created by Asad Khan on 2/8/12.
//  Copyright (c) 2012 Semantic Notion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Category : NSObject
{
    
}
@property (nonatomic, assign) int id;
@property (nonatomic, assign) int parentId;
@property (nonatomic, retain) NSString *name;
@end
