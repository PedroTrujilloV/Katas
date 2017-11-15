//
//  Kata1_2_DataTypes.m
//  Katas
//
//  Created by Pedro Trujillo on 11/14/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

#import "main.h"


@implementation Kata1_2_DataTypes
    -(void) introductionToDataTypes2
    {
    //*basic arithmetic types:
        
        //-integer types:
        
        
        //char = 1byte = -128 to 127 or 255
        char alpha = 1;
        char bravo;
        bravo = 'b';
        char charlie[3] = {alpha, bravo, 'c'};
        
        NSLog(@"alpha is: %c",alpha);
        NSLog(@"bravo is: %c",bravo);
        NSLog(@"Charlie is: %s",charlie);
        
        //unsigned char = 1byte = 0 to 255
        unsigned char uChar0 = 'n';
        unsigned char uChar1[17] = "an unsigned char";
        unsigned char uChar2[] = "an unsigned char2";
        unsigned char uChar3 = 400;
        
        NSLog(@"uChar0: %c",uChar0);
        NSLog(@"uChar1: %s",uChar1);
        NSLog(@"uChar2: %s", uChar2);
        NSLog(@"uChar2: %c", uChar3);
        
        //signed char = 1byte = -128 to 127
        signed char sChar0 = -1;
        signed char sChar1 = 200;
        signed char sChar2 = 'c';
        signed char sChar3[] = "a Signed char3";
        
        NSLog(@"sChar0: %c", sChar0);
        NSLog(@"sChar1: %c", sChar1);
        NSLog(@"sChar2: %c", sChar2);
        NSLog(@"sChar3: %s", sChar3);
        
        

        //-floating point types:
        
    }

@end
