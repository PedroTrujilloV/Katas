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
        
        
        Algorithms * algorithmsDemo = [[Algorithms alloc]init];
//        [algorithmsDemo mergeSort];
        
        Practice_Problems * questions = [[Practice_Problems alloc]init];
        
//        NSArray * givenArray = [NSArray arrayWithObjects:@6,@2,@1,@4,@0,@0,@1,@5,@0,@0,@3, nil];
        
//        int answer = [questions problem_1_moveAllZeros:givenArray];
        
//        NSLog(@"answer: %i",answer);
        
//        BOOL answer = [questions problem_2_pairInArray:givenArray sumThisInt:7];
        
//        NSLog(@"answer: %hhd",answer);
        
        //100101 + 10101 = 111010
        
//        NSString * numA = [NSString stringWithFormat:@"1010"];
//        NSString * numB = [NSString stringWithFormat:@"11"];
        
//        NSString * numA = [NSString stringWithFormat:@"100101"];
//        NSString * numB = [NSString stringWithFormat:@"10101"];
       
//        NSString * answer = [questions problem_3_AdditionTwoBinaryNumbers:numA and:numB];
        
//        NSLog(@"answer: %@",answer);
        
//        NSString * possiblePalindrome1 = [NSString stringWithFormat:@"madam"];
//        NSString * possiblePalindrome2 = [NSString stringWithFormat:@"redder"];
//        NSString * possiblePalindrome3 = [NSString stringWithFormat:@"hello World"];
        
//        BOOL isValidThisPalindrome = [questions problem_4_isValidPalindrome:possiblePalindrome3];
        
//        NSLog(@"is ValidThis Palindrome '%@': %hhd",possiblePalindrome3,isValidThisPalindrome);
        
//        [questions problem_5_BinaryTreeToListInOrder];
//        [questions problem_6_LinkedListPairSwapedNodes];
        
//        NSArray * anArray = [NSArray arrayWithObjects: @6, @3, @[ @9, @[ @1, @[@2,@8] ]], @4, nil];
//        int result = [questions problem_7_arraySumElementsMultiplyDeep:anArray andDeep:1];
//        NSLog(@"sum result: %i",result);
        
//        NSArray * result = [questions problem_8_allCombinationsInPhoneNumberKeyLetters:@[@1,@2,@3] and: @""];
//         NSArray * result = [questions problem_8_allCombinationsInPhoneNumberKeyLetters:@[@4,@7,@0,@6,@8,@3,@8,@5,@3,@9] and: @""];
//        
//        NSLog(@"Hello, World!====================================");
//        NSLog(@"result: %@",result);
        
//            NSRange rangeA = NSMakeRange(20,120);
//            NSRange rangeB = NSMakeRange(75,135);
//        
//            NSString * result = [questions problem_10_intersectionOfTwoRanges:rangeA and:rangeB];
//        
//            NSLog(@"Intersection: %@",result );
        
//        [questions problem_11_getLongestPathFromTree];
//        [questions problem_12_isIndeedABinaryTree];
//        [questions problem_13_FBSuperEnumerator];
        
        NSArray * myArray = @[@"CAT", @"CAR", @"CAR", @"CAR", @"DOG", @"CAT", @"CAR", @"MOUSE"];
        NSLog(@"with duplicates: %@", myArray);
        NSLog(@"without duplicates: %@",[questions problem_15_removeDuplicatesInArray:myArray]);

        
    }
    return 0;
}


