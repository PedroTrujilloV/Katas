//
//  Kata2_Arrays.m
//  Katas
//
//  Created by Pedro Trujillo on 9/28/16.
//  Copyright © 2016 Pedro Trujillo. All rights reserved.
//  sources:
//  [1] http://rypress.com/tutorials/objective-c/data-types/nsarray
//  [2] https://www.tutorialspoint.com/objective_c/objective_c_functions.htm

#import "main.h"

@implementation Kata2_Arrays

    - (void) introductionToArrays
    {
        
        // Declare arrays
        
        NSArray * petArray = @[@"Penny", @"Snipee",@"Kedy"];
        
        NSArray * numbersArray = @[@5,@2,@3,@1]; // Array of integer numbers and sum them
        
        //Enumerating Arrays
        
        int sum = 0;
        for(NSNumber * aNum in numbersArray)
        {
            NSLog(@"%@", aNum);
            sum += [aNum intValue]; //to get the integer value in the aNum index in numbersArray
        }
        NSLog(@"%i",sum);
        
        for(int i =0; i<3; i++)
        {
            NSLog(@"pet: %@", petArray[i]);
            
        }
        
        for(NSString * aPet in petArray)
        {
            NSLog(@" aPet: %@", aPet);
        }
        
        for(int i=0; i<[petArray count];i++)
        {
            NSLog(@"pet: %@",petArray[i]);
        }

    }
    
    - (void) comparingArrays
    {
        NSArray *germanMakes = @[@"Mercedes - Benz", @"BMW", @"Porshe", @"Audi"];
        NSArray *sameGermanMakes = [NSArray arrayWithObjects: @"Porshe", @"BMW", @"Mercedes - Benz", @"Audi", nil];
        
        if ([germanMakes isEqualToArray: sameGermanMakes])
        {
            NSLog(@"Yes, they are same!");
        }
        else
        {
            NSLog(@"No, they are different!");
        }
    }
    
    - (void) membershipChecking: (NSString *) aColor
    {
        NSArray * colors = [NSArray arrayWithObjects: @"Black", @"Brown", @"Tan", @"Yellow", @"White", nil];
        
        
        if([colors containsObject: aColor])
        {
            NSLog(@"Yes, the array contains %@",aColor);
        }
        else
        {
            NSLog(@"No, the array doesn’t contains %@",aColor);
        }
        
        
        if([colors indexOfObject: @"Black"] != NSNotFound)
        {
            NSLog(@"Yes, the array contains Black");
        }
        else
        {
            NSLog(@"No, the array doesn’t contains Black");
        }

    }
    
    - (void) sortingArrays
    {
        
        NSArray * colors = [NSArray arrayWithObjects: @"Black", @"Brown - Red", @"Tan", @"Yellow", @"White", @"Magenta", nil];
        
        NSArray * sortedColors = [colors sortedArrayUsingComparator: ^NSComparisonResult (id obj1, id obj2)
        {
           if([obj1 length] < [obj2 length])
            {
                return NSOrderedAscending;
            }
            else if ([obj1 length] > [obj2 length])
            {
                return NSOrderedDescending;
            }
            else
            {
                return NSOrderedSame;
            }
        }];
        
        NSLog(@"Sorted colors: %@",sortedColors);
    }
    
    - (void) subdividingArrays
    {
        NSArray * colors = [NSArray arrayWithObjects: @"Black", @"Brown - Red", @"Tan", @"Yellow", @"White", @"Magenta", nil];
        
        NSArray * firstThree = [colors subarrayWithRange:NSMakeRange(0,3)];
        NSLog(@"fist three: %@",firstThree);
        //NSUInteger  colorSizeInt = (NSUInteger)(((int)[colors count])-1);
        //NSLog(@"colorSizeInt, %lu",(unsigned long)colorSizeInt);
        //NSLog(@"new colorzise %lu",(unsigned long)[colors count]);
        //NSUInteger from = colors.count-3;
        //NSUInteger count = colors.count-1;
        //NSRange range = NSMakeRange(from,count);
        //NSArray *lastTwo = [colors subarrayWithRange:range];
        //NSLog(@"lastTwo, %@",lastTwo);
    }



@end
