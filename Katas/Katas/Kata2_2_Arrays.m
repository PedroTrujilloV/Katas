//
//  Kata2_2_Arrays.m
//  Katas
//
//  Created by Pedro Trujillo on 11/15/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

#import "main.h"


@implementation Kata2_2_Arrays: NSObject

    - (void) introductionToArrays2
    {
        
        //arrays
        int anArray [5] = {1,2,3,4,5};
        
        float anArray2[] = {1.1,2.2,3.33,4.4};
        
        // multidimensional
        double aDArray[3][5] = {{1,2,3,4,5},{1,2,3,4,5},{1,2,3,4,5}};
        
        
        for(int i =0; i < 5; i++)
        {
            NSLog(@"anArray2[%i]: %f",i, anArray2[i]);

        }
        for( int i = 0; i < 3; i++)
        {
            for( int j = 0; j < 5; j++)
            {
                NSLog(@"aDArray[%i][%i]: %f", i,j, aDArray[i][j]);
            }
            
        }
        
        //pointer to array
        float * aPArray;
        
        aPArray = anArray2;
        
        [self printArrayWay1:anArray andLength:5];
        
        
        [self printArrayWay2:aPArray andLength:4];
        
        [self printArrayWay3:aDArray];
        
        [self printArrayWay2:[self getANewArray:anArray2 andLength:4] andLength:4];
        
    }

// get array as parameter way 1
    - (void)printArrayWay1: (int [])anArray andLength:(int)length
    {
        
        for(int i =0; i < length; i++)
        {
            NSLog(@"anArrayW1[%i]: %i",i, anArray[i]);
        }
    }

// get array as parameter way 2
    -(void) printArrayWay2: (float*)anArray andLength:(int)lenght
    {
        for(int i =0; i < lenght; i++)
        {
            NSLog(@"anArrayW2[%i]: %f",i, anArray[i]);
        }
    }

// get array as parameter way 3
    -(void) printArrayWay3: (double [3][5])anArray
    {
        for( int i = 0; i < 3; i++)
        {
            for( int j = 0; j < 5; j++)
            {
                NSLog(@"anArrayW3[%i][%i]: %f", i,j, anArray[i][j]);
            }
            
        }
    }

//return array from function
    - (float *) getANewArray: (float *)anArray andLength:(int)length
    {
        
        //static because objective c does not recomend send address of local variables outside
        static float * anOtherArray;
        
        for(int i =0; i < length; i++)
        {
            anArray[i] = anArray[i]*3;
        }
        anOtherArray = anArray;
        
        return anOtherArray;
    }

@end
