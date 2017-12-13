//
//  FeedModel.h
//  App_5
//
//  Created by Pedro Trujillo on 12/10/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

//
//#ifndef FeedModel_h
//#define FeedModel_h
//
//
//#endif /* FeedModel_h */

#import <Foundation/Foundation.h>

@interface FeedModel:NSObject

@property (nonatomic) NSString * profileName;
@property (nonatomic) NSString * feedTitle;
@property (nonatomic) NSData * profileImageData;
@property (nonatomic) NSData * feedImageData;

-(id) initWithName:(NSString *)name FeedTitle:(NSString *)feedTitle ProfileImageURL:(NSString *)pURL FeedImageURL:(NSString * )fURL;


@end
