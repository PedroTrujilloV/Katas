//
//  Hero.m
//  App_3
//
//  Created by Pedro Trujillo on 11/19/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hero.h"

@implementation Hero

-(id) initWithDictionary:(NSDictionary *)heroDictionary //construnctor
{
    self = [super init];
    if(self)
    {
        //do something
        _name = (NSString *)[heroDictionary valueForKey:@"name"];
        _homeWorld = (NSString *)[heroDictionary valueForKey:@"homeworld"];
        _powers = (NSString *)[heroDictionary valueForKey:@"powers"];
        _imagePath = (NSString*)[heroDictionary valueForKey:@"image"];
    }
    return self;
}

-(void) setHero:(NSDictionary*)heroDictionary
{
    _name = (NSString *)[heroDictionary valueForKey:@"name"];
    _homeWorld = (NSString *)[heroDictionary valueForKey:@"homeworld"];
    _powers = (NSString *)[heroDictionary valueForKey:@"powers"];
    _imagePath = (NSString*)[heroDictionary valueForKey:@"image"];
}

@end

