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
        
        NSLog(@"sizeof(char): %lu byte",sizeof(char));
        
        //unsigned char = 1byte = 0 to 255
        unsigned char uChar0 = 'n';
        unsigned char uChar1[17] = "an unsigned char";
        unsigned char uChar2[] = "an unsigned char2";
        unsigned char uChar3 = 400;
        
        NSLog(@"uChar0: %c",uChar0);
        NSLog(@"uChar1: %s",uChar1);
        NSLog(@"uChar2: %s", uChar2);
        NSLog(@"uChar2: %c", uChar3);
        NSLog(@"sizeof(unsigned char): %lu byte",sizeof(unsigned char));

        
        //signed char = 1byte = -128 to 127
        signed char sChar0 = -1;
        signed char sChar1 = 200;
        signed char sChar2 = 'c';
        signed char sChar3[] = "a Signed char3";
        
        NSLog(@"sChar0: %c", sChar0);
        NSLog(@"sChar1: %c", sChar1);
        NSLog(@"sChar2: %c", sChar2);
        NSLog(@"sChar3: %s", sChar3);
        NSLog(@"sizeof(signed char): %lu byte",sizeof(signed char));
        
        
        //int  = 2 or 4 bytes = -32,768 to 32,767 or -2,147,483,648 to 2,147,483,647
        
        int anInt0 = 327683456;
        int anInt1 = -327683456;
        int omega = 8;
        
        NSLog(@"anInt0: %i", anInt0);
        NSLog(@"anInt1: %i", anInt1);
        NSLog(@"omega: %i", omega);
        NSLog(@"sizeof(int): %lu bytes",sizeof(int));
        
        
        //unsigned int = 2 or 4 bytes = 0 to 65,535 or 0 to 4,294,967,295
        
        unsigned int uInt = 327683456;
        
        NSLog(@"uInt: %i", uInt);
        NSLog(@"sizeof(unsigned int): %lu bytes",sizeof(unsigned int));

        
        //short = 2bytes = -32,768 to 32,767
        
        short aShort = 32768;
        short aShort2 = -32768;

        NSLog(@"aShort: %i", aShort);
        NSLog(@"aShort2: %i", aShort2);
        NSLog(@"sizeof(short): %lu bytes",sizeof(short));

        
        //unsigned short = 2bytes = 0 to 65,535
        
        unsigned short aShort3 = 32768;
        
        NSLog(@"aShort3: %i", aShort3);
        NSLog(@"sizeof(unsigned short): %lu bytes",sizeof(unsigned short));

        
        //long = 4 to 8 bytes = -2,147,483,648 to 2,147,483,647
        
        long aLong = 327683456327683456;
        long aLong1 = -327683456327683456;

        NSLog(@"aLong: %li",aLong);
        NSLog(@"aLong1: %li",aLong1);
        NSLog(@"sizeof(long): %lu bytes",sizeof(long));
        
        //unsigned long  = 4 to 8 bytes  = 0 to 4,294,967,295
        unsigned long anULong =  327683456327683456;
        
        NSLog(@"anULong: %li",anULong);
        NSLog(@"sizeof(unsigned long): %lu bytes",sizeof(unsigned long));
        

        //-floating point types:

        //float = 4 bytes =	1.2E-38 to 3.4E+38	6 decimal places
        
        float aFloat1 = 4.1;
        float aFloat2 = -4.1;
        
        NSLog(@"aFloat1: %f",aFloat1);
        NSLog(@"aFloat2: %f",aFloat2);
        NSLog(@"sizeof(float): %lu bytes",sizeof(float));
        
        //double = 8bytes = 2.3E-308 to 1.7E+308	15 decimal places
        
        double aDouble = 3445651233434.123123123123345345123;
        
        NSLog(@"aDouble: %f",aDouble);
        NSLog(@"sizeof(double): %lu bytes",sizeof(double));
        
        // long double = 10 byte = 3.4E-4932 to 1.1E+4932	19 decimal places

        long double aLDouble = 3445651233434334.12312312312334534512333434;
        
        NSLog(@"aLDouble: %Lf",aLDouble);
        NSLog(@"sizeof(long double): %lu bytes",sizeof(long double));
        
        
        
        
    }

@end
