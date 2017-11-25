//
//  main.m
//  Katas
//
//  Created by Pedro Trujillo on 9/27/16.
//  Copyright © 2016 Pedro Trujillo. All rights reserved.
//
#import "main.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        // DataTypes
        
        //Kata1_DataTypes *kata1 = [[Kata1_DataTypes alloc]init];
        
        //[kata1 introductionToDataTypes];
        
        //Kata1_2_DataTypes *kata1_2  = [[Kata1_2_DataTypes alloc] init];

        //[kata1_2 introductionToDataTypes2];
        
        //Arrays
        
        //Kata2_Arrays *kata2 = [[Kata2_Arrays alloc]init];
        
        //[kata2 introductionToArrays];
        
        //[kata2 comparingArrays];
        
        //[kata2 membershipChecking:@"Blue"];
        
        //[kata2 sortingArrays];
        
        //[kata2 subdividingArrays];
        
        //Kata2_2_Arrays * kata2_2 = [[Kata2_2_Arrays alloc]init];
        
        //[kata2_2 introductionToArrays2];
        //[kata2_2 nsMutableArrays];
        
        //Linked Lists
        
        //Kata3_LinkedLists * kata3 = [[Kata3_LinkedLists alloc]init];
        
        //[kata3 implementationOfLLInOC];
        
        //Stacks
        
        //Kata4_Stack * kata4 = [[Kata4_Stack alloc]init];
        
        //[kata4 stackImplementation];
        
        //Binary Tree
        
        //Kata5_BinaryTree * kata5 = [[Kata5_BinaryTree alloc]init];
        
        //[kata5 treeImplementation];
        
//        Kata6_Dictionary * kata6 = [[Kata6_Dictionary alloc]init];
        
//        [kata6 dictionaryImplementation];
        
        Practice_Problems * questions = [[Practice_Problems alloc]init];
        
//        NSArray * givenArray = [NSArray arrayWithObjects:@6,@2,@1,@4,@0,@0,@1,@5,@0,@0,@3, nil];
        
//        int answer = [questions problem_1_moveAllZeros:givenArray];
        
//        NSLog(@"answer: %i",answer);
        
//        BOOL answer = [questions problem_2_pairInArray:givenArray sumThisInt:7];
        
//        NSLog(@"answer: %hhd",answer);
        
        NSString * numA = [NSString stringWithFormat:@"1010"];
        NSString * numB = [NSString stringWithFormat:@"11"];
        
        NSString * answer = [questions problem_3_AdditionTwoBinaryNumbers:numA and:numB];
        
        NSLog(@"answer: %@",answer);

        
        
       
    }
    return 0;
}


