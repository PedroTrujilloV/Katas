//
//  Hero.h
//  App_3
//
//  Created by Pedro Trujillo on 11/19/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

//#ifndef Hero_h
//#define Hero_h
//
//
//#endif /* Hero_h */

@interface Hero : NSObject

    @property NSString * name;
    @property NSString * homeWorld;
    @property NSString * powers;
    @property NSString * imagePath;

-(id) initWithDictionary:(NSDictionary *)heroDictionary;
-(void) setHero:(NSDictionary*)heroDictionary;
@end
