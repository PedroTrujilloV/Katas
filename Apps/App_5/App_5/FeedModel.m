//
//  FeedModel.m
//  App_5
//
//  Created by Pedro Trujillo on 12/10/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//
// cat icon: https://icons8.com/icon/34812/cat-profile

#import "FeedModel.h"

@implementation FeedModel
///Users/ptrujillo/Documents/Pedro/Katas/Apps/App_5/App_5
-(id) initWithName:(NSString *)name FeedTitle:(NSString *)feedTitle ProfileImageURL:(NSString *)pURL FeedImageURL:(NSString * )fURL
{
    self = [super init];
    
    if(self)
    {
        _profileName = name;
        _feedTitle = feedTitle;
        _profileImageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:pURL]];
        _feedImageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:fURL]];
    }
    return self;
}



@end
