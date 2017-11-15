//
//  Kata1_DataTypes.m
//  Katas
//
//  Created by Pedro Trujillo on 9/28/16.
//  Copyright © 2016 Pedro Trujillo. All rights reserved.
//

#import "main.h"

@implementation Kata1_DataTypes

    - (void) introductionToDataTypes
    {
        //Numbers - int - floats - etc..
        
        int myNumber;
        
        int myNumber2 = 2;
        
        
        
        myNumber = 3;
        
        int myNumber3 = myNumber + myNumber2;
        
        NSLog(@"My number3 = %i", myNumber3); // %i to print integer numbers
        
        
        float myFloat = 1.2f;
        float myFloat2 = 0.3f;
        
        float myFloat3 = myFloat - myFloat2;
        
        NSLog(@"My Float3 = %f", myFloat3);
        NSLog(@"My Float3 2 digits = %.2f",myFloat3);
        
        
        BOOL myBool = YES;
        BOOL myBool2 = NO;
        
        BOOL myBool3 = myBool && myBool2;
        
        NSLog(@"My Bool3 = %d", myBool3); // %d to print bool
        
        //Strings
        NSString * myString;
        NSString * myString2 = @"myString2";
        
        myString = @"myString";
        
        NSString * myString3 = [myString stringByAppendingString:myString2];
        NSLog(@" myString3 %@", myString3);
        
        //id
        
        id myIdStrange = @"Hello id";
        
        NSLog(@" myIdStrange = %@", [myIdStrange description]);
        
        myIdStrange = @{@"name":@"Petu", @"age":@6};
        
        NSLog(@"myIdStrange = %@", myIdStrange);
        

    }


@end
