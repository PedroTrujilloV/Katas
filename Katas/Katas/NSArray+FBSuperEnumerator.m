//
//  NSArray+FBSuperEnumerator.m
//  Katas
//
//  Created by Pedro Trujillo on 12/6/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

#import "main.h"



@implementation FBSuperEnumerator
{
    NSEnumerator* arrayEnumerator;

}

-(id)initWithArray:(NSArray*)anArray
{
    self = [super init];
    
    if(self)
    {
        NSMutableArray * temporalArray = [[NSMutableArray alloc] init];
        for(id anObject in anArray)
            if([anObject isKindOfClass:[NSArray class]])
            {
                FBSuperEnumerator * anObjEnum = [anObject objectFBSuperEnumerator];
                [temporalArray addObjectsFromArray: [anObjEnum allObjects]];
            }
            else
            {
                [temporalArray addObject:anObject];
            }
        
        arrayEnumerator = [temporalArray objectEnumerator];
    }
    return self;
}

 - (id)nextObject
{
    return [arrayEnumerator nextObject];
}

- (NSArray *) allObjects
{
    return [arrayEnumerator allObjects];
}

@end


@implementation NSArray (FB)

-(FBSuperEnumerator*)objectFBSuperEnumerator
{
    return [[FBSuperEnumerator alloc] initWithArray:self];
}

@end
