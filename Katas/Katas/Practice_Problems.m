//
//  Practice_Problems.m
//  Katas
//
//  Created by Pedro Trujillo on 11/24/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

#import "main.h"

@implementation Practice_Problems

-(int)problem_1_moveAllZeros:(NSArray*)givenArray
{
    /* Given an array, without using extra space,
     move all zeros  to the end and no-zeros to the beginning. 
     The function should return the number of non-zeros. */
    
    // This problems has a time complexity of O(n)
    
    NSLog(@"given array before: %@", givenArray);

    
    NSMutableArray * localCopy = (NSMutableArray*)[givenArray mutableCopy];
    
    int counter = 0;
    
    void (^swapPositions)(int ,int) = ^(int  positionA, int  positionB )
    {
        NSLog(@"swaped : %i and %i", positionA, positionB);
        id  temporal = [localCopy objectAtIndex:positionA];
        [localCopy removeObjectAtIndex:positionA];
        [localCopy insertObject:temporal atIndex:positionB];
    };
    
    for(int i = 0; i < localCopy.count; i++)
    {
        
        if([localCopy[i] intValue] == 0)
            swapPositions( i, (int)([localCopy count]-1) );
        else
        {
            counter++;
            swapPositions( i, 0 );
        }

    }
    
    NSLog(@"given array after: %@", localCopy);
    
    return counter;
    
}

-(BOOL) problem_2_pairInArray:(NSArray*)givenArray sumThisInt:(int)intNum
{
    /* The first Jedi question was this: given an unsorted array  of numbers, like [1, 3, 5, 4, 2], write a function that takes an integer and returns true if there's any pair of numbers in that array that can be summed up to the input integer. */
    
    // whiout sort the given array, the complexity time is O(n*log(n))
    
    int startAtIndex = 0;
    for( id numA in givenArray)
    {
        for(int i = startAtIndex ; i < givenArray.count; i++)
            if(([numA intValue] + [givenArray[i] intValue]) == intNum)
                return YES;
        startAtIndex++;
    }
    
    
    return NO;
}

@end
