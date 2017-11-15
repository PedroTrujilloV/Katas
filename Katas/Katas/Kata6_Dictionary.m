//
//  Kata6_Dictionary.m
//  Katas
//
//  Created by Pedro Trujillo on 10/6/16.
//  Copyright © 2016 Pedro Trujillo. All rights reserved.
//

#import "main.h"

@implementation Kata6_Dictionary

    - (void) dictionaryImplementation
    {
        NSDictionary * myDictionary1 = @{@"Eleven": [NSNumber numberWithInt:11], @"Seven":[NSNumber numberWithInt:7],@"Four": [NSNumber numberWithInt:4]};
        
        NSLog(@"My Dictionaty : @%@", myDictionary1);
        
        myDictionary1 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1],@"One", [NSNumber numberWithInt:2],@"Two",[NSNumber numberWithInt:3], @"Three", nil];
        
        NSLog(@"My Dictionary with objects and keys : @%@", myDictionary1);
        
        
        NSArray * namesNumbers = @[@"Eight",@"Nine",@"Ten"];
        NSArray * justNumbers = @[@8,@9,@10];
        
        myDictionary1 = [NSDictionary dictionaryWithObjects: justNumbers forKeys: namesNumbers];
        
        NSLog(@"My Dictionary with objects for keys: @%@", myDictionary1);
    }

@end
