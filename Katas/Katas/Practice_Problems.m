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
    
    NSMutableArray * anArray = [NSMutableArray arrayWithArray:givenArray];
    
    NSLog(@"anArray: %@",anArray);
    
    int counter =  0;
    
    for(int i = 0 ; i < anArray.count; i++ )
        if([[anArray objectAtIndex:i] intValue] != 0 )
        {
            [anArray replaceObjectAtIndex:counter withObject:[[anArray objectAtIndex:i] copy]];
            counter++;
        }
    
    for(int i = counter ; i < anArray.count; i++ )
        [anArray replaceObjectAtIndex:i withObject:@(0)];
    
    NSLog(@"anArray: %@",anArray);
    
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



-(NSString * ) problem_3_AdditionTwoBinaryNumbers:(NSString *)binaryStringNumberA and:(NSString * )binaryStringNumberB
{
    
    /*
     Addition of two binary numbers
     
     time complexity: 0(3n) => O(n)
     */
    
//    NSMutableString * sum = [[NSMutableString alloc] init];
    NSMutableString * result = [[NSMutableString alloc] init];
    NSMutableString * stringA = [[NSMutableString alloc] init];
    NSMutableString * stringB = [[NSMutableString alloc] init];

    int carry = 0;

    long maxLength = [binaryStringNumberA length] > [binaryStringNumberB length] ? [binaryStringNumberA length] : [binaryStringNumberB length];
    
    for(int i = (int)[binaryStringNumberA length]; i<maxLength; i++)
        [stringA appendString:@"0"];
    
    for(int i = (int)[binaryStringNumberB length]; i<maxLength; i++)
        [stringB appendString:@"0"];
    
    [stringA appendString:binaryStringNumberA];
    [stringB appendString:binaryStringNumberB];
    
    NSLog(@"number A: %@",stringA);
    NSLog(@"number B: %@",stringB);
    NSLog(@"length: %li",[stringA length]);


    for(long i = [stringA length]-1; i >= 0; i--)
    {
        
        int numA =((int)[stringA characterAtIndex:i] & 1) ? 1 : 0;//necessary use mask to not get another value
        int numB = ((int)[stringB characterAtIndex:i]  & 1) ? 1 : 0; //necessary use mask to not get another value
        
        NSMutableString * sum =  [[NSMutableString alloc] initWithFormat:@"%i%@", (numA^numB^carry),result]; //XOR door works same as a sum, just necessary carry out in other variable
        
        result = [sum mutableCopy];
        
        carry = (numA && numB) || (numA && carry) || (numB && carry); // the carry value for next iteration
    }
    
    return result;
}


-(BOOL) problem_4_isValidPalindrome:(NSString *)possiblePalindrome
{
    /* Is a valid palindrome word?
    
    time  complexity O(log(n)) */
    
    if([possiblePalindrome length] <= 1)
        return YES;
    
    NSString * leftExtreme = [possiblePalindrome substringWithRange:NSMakeRange(0, 1)];
    NSString * rigthExtreme = [possiblePalindrome substringWithRange:NSMakeRange(possiblePalindrome.length-1, 1)];
    NSString * centerPart = [possiblePalindrome substringWithRange:NSMakeRange(1, possiblePalindrome.length-2)];
    
    return  [ leftExtreme isEqualToString:rigthExtreme] && [self problem_4_isValidPalindrome:centerPart];
}


/*
 1. "copy” is not a property of which following class?
 a. NSArray b. NSInteger c. NSString d. NSNumber
 
 2. You can not call which following method directly?
 a. sizeThatFits b. sizeToFit c. layoutSubview d. setNeededLayout
 
 3. What type can be used for a delegate?
 a. strong b. weak c. inout d. copy
 
 4. Which of following can not be appended to an Array. a. Int b. NSObject c. CGColor d. Date
 
 5. In following mechanism, which  one can not be used to decouple class?
 a. delegate b. mutex c. notification d. block
 
 Answer: b, c, b, c, b
 */


/*
 

 The same list, back to inorder binary tree

 Design a simple photo stream app
 */

/*
 Find the intersection between 2 NSRanges

 Define the differences between Weak, Strong, Assign and Retain

 */



/*
 
 Given a dictionary of words, return an array of the words whose match. (i.e. pattern "c.t" match with "cat", "cut", etc. because the dot notation stand for ANY character).
 
 
 SUGGEST: use suffix tree, for(for()) is not a good solution.
 

 */
/*
 Write a function that takes in an array of strings and outputs a dictionary with the first character of each string as the key and the remaining characters as the object.*/


/*
 You have a simple tree structure Ⓐ and its clone ⓐ.
 
 Each node in the tree has a pointer to it's parent as well as an array of its children.

 */

/*
 - Convert a string into an integer without using the inbuilt frameworks.
 */

/*
 Given a binary encoded string, find the range of all consecutive 1's and use them to draw an arc.
 */

-(void )problem_5_BinaryTreeToListInOrder
{
    /*
     Binary tree to list, inorder
     */
    
    BinaryTree_p * aTree = [[BinaryTree_p alloc] initWithValue:7];
            [aTree sortedInsert:3];
            [aTree sortedInsert:9];
            [aTree sortedInsert:7];
            [aTree sortedInsert:0];
            [aTree sortedInsert:8];
            [aTree sortedInsert:2];
            [aTree sortedInsert:4];
            [aTree sortedInsert:6];
            [aTree sortedInsert:1];
            [aTree sortedInsert:5];
    
    NSMutableArray * inOrderArray = [aTree inOrderTraversal];
    
    NSLog(@"* inOrderArray: %@", inOrderArray);
    
    NSMutableArray * preOrderArray = [aTree preOrderTraversal];
    
    NSLog(@"* preOrderArray: %@",preOrderArray);
    
    NSMutableArray * posOrderArray = [aTree posOrderTraversal];
    
    NSLog(@"* posOrderArray: %@",posOrderArray);
    
}


-(void)problem_6_LinkedListPairSwapedNodes
{
    /*
     Return the head node of the singly linked list with each pair of nodes swapped. If there is a last odd node leave it in place.
     
     Example:
     Input: 1 -> 2 -> 3 -> 4 -> 5
     Output: 2 -> 1 -> 4 -> 3 -> 5
     */
    
    LinkedListNode * aList = [[LinkedListNode alloc] initWithValue: 1];
    
    [aList addValue:2];
    [aList addValue:3];
    [aList addValue:4];
    [aList addValue:5];
    
    NSLog(@"aList before swap values:");
    [aList printList];
    
    //     [aList swapValues];
    
    //     NSLog(@"List after swap values:");
    
    //     [aList printList];
    
    LinkedListNode * swapedListHead = [aList swapNodes];
    
    NSLog(@"aList after swap nodes:");
    
    [aList printList];
    
    NSLog(@"swapedListHead after swap nodes:");
    
    [swapedListHead printList];
}


-(int)problem_7_arraySumElementsMultiplyDeep:(NSArray *)anArray andDeep:(int)deep
{
    /*
     Given an array that contains numbers and/or other nested arrays, write an algorithm to come up with a sum of these elements, multiplied by the depth (or how many arrays deep) you are.
     
     For example, what would you do with an input array that looks like:
     
     [ 2, 3, [ 9, [ 1, 2 ]], 4]
     */
    
    int sum = 0;
    for(id i in anArray)
        if([i isKindOfClass:[NSArray class]])
            sum += [self problem_7_arraySumElementsMultiplyDeep:i andDeep:deep+1];//problem_7_arraySumElementsMultiplyDeep(i, deep+1);
        else
            sum += [(NSNumber * )i intValue];

    return sum*deep;

}

-(NSArray *) problem_8_allCombinationsInPhoneNumberKeyLetters:(NSArray *) numbersArray and:(NSString *) curentCombination
{
    /*
     Given the following hashmap for numeric to alpha translation of a telephone keypad:keyBoardDict
     
     Write a method that takes a phone number as input and returns all possible letter combinations for that phone number.
     */
    NSDictionary * keyBoardDict = @{
                                    @1:@[@"1"],
                                    @2:@[@"A",@"B",@"C"],
                                    @3:@[@"D",@"E",@"F"],
                                    @4:@[@"G",@"H",@"I"],
                                    @5:@[@"J",@"K",@"L"],
                                    @6:@[@"M",@"N",@"O"],
                                    @7:@[@"P",@"Q",@"R",@"S"],
                                    @8:@[@"T",@"U",@"V"],
                                    @9:@[@"W",@"X",@"Y",@"Z"],
                                    @0:@[@"0"]};
    
    NSMutableArray * numbersCombinations = [[NSMutableArray alloc] init];
    NSMutableArray * remainNumbers = [NSMutableArray arrayWithArray: [numbersArray subarrayWithRange:NSMakeRange(1, numbersArray.count-1)]];
    
    
    if([numbersArray count] >0)
        for(NSString * i in keyBoardDict[[numbersArray firstObject]])
        {
            NSMutableString * combination = [NSMutableString stringWithFormat:@"%@", curentCombination ];
            
            combination = [ NSMutableString stringWithString:  [combination stringByAppendingString: i ]];
            
            if([remainNumbers count] >0)
            {
                NSArray * posibleCombinations = [self problem_8_allCombinationsInPhoneNumberKeyLetters: remainNumbers and:combination];
                [numbersCombinations addObjectsFromArray: posibleCombinations];
            }
            else
                [numbersCombinations addObject: combination];
        }
    else
        [numbersCombinations addObject: curentCombination];
    
    
    return numbersCombinations;
    
    
}

//Necessary test with UIKit.
//-(NSArray*)problem_9_getCommonSuperViews:(UIView *)viewA and:(UIView * )viewB
//{
//    /* How to detect a common superview. */
//    
//    NSMutableArray * viewsArrayA = [NSMutableArray arrayWithArray:[self getSuperViews:viewA]];
//    NSMutableArray * viewsArrayB = [NSMutableArray arrayWithArray:[self getSuperViews:viewB]];
//    
//    
//    NSMutableSet * intersection = [NSMutableSet setWithArray:viewsArrayA];
//    [intersection intersectsSet:[NSSet setWithArray:viewsArrayB]];
//    
//    return [intersection allObjects];
//}
//
//-(NSArray*)getSuperViews:(UIView *)aView
//{
//    NSMutableArray * viewsArray = [NSMutableArray arrayWithObject:aView];
//    if([aView superview])
//        [viewsArray addObjectsFromArray:[self getSuperViews:[aView superview]]];
//    return viewsArray;
//}

-(NSString *)problem_10_intersectionOfTwoRanges:(NSRange)rangeA and:(NSRange)rangeB
{
    /*
     Find the intersection between 2 NSRanges
     */
//    NSRange rangeA = NSMakeRange(20,120);
//    NSRange rangeB = NSMakeRange(75,135);
    
    NSRange intersection = NSIntersectionRange(rangeA, rangeB);
    
    return NSStringFromRange(intersection);
}

-(void)problem_11_getLongestPathFromTree
{
    
    
    BinaryTree_p * aTree = [[BinaryTree_p alloc] initWithValue:7];
    [aTree sortedInsert:3];
    [aTree sortedInsert:9];
    [aTree sortedInsert:7];
    [aTree sortedInsert:0];
    [aTree sortedInsert:8];
    [aTree sortedInsert:2];
    [aTree sortedInsert:4];
    [aTree sortedInsert:6];
    [aTree sortedInsert:1];
    [aTree sortedInsert:5];
    [aTree sortedInsert:12];
    [aTree sortedInsert:10];
    [aTree sortedInsert:14];
    
    NSMutableArray * mutableArray = [[NSMutableArray alloc] init];
    
    NSArray *longesPath =[NSArray arrayWithArray: [aTree getLongestPathFrom: aTree and: mutableArray ]];
    
    NSLog(@"longest path: %@",longesPath);
    
}

-(void) problem_12_isIndeedABinaryTree
{
    /*
     Verify that a binary search tree is indeed a binary search  tree.
     */
    
    BinaryTree_p * aTree = [[BinaryTree_p alloc] initWithValue:7];
    [aTree sortedInsert:3];
    [aTree sortedInsert:9];
    [aTree sortedInsert:7];
    [aTree sortedInsert:0];
    [aTree sortedInsert:8];
    [aTree sortedInsert:2];
    [aTree sortedInsert:4];
    [aTree sortedInsert:6];
    [aTree sortedInsert:1];
    [aTree sortedInsert:5];
    [aTree sortedInsert:12];
    [aTree sortedInsert:10];
    [aTree sortedInsert:14];
    
    
    NSMutableArray * queue = [[NSMutableArray alloc] init];
    NSMutableArray * nodeTable = [[NSMutableArray alloc] init];
    
    BOOL isTree = [aTree isABinarrySearchTreeNoRecursive:aTree Queue:queue VisitedNodes:nodeTable];
    
    NSLog(@"Is 'aTree' a binary tree?: %hhu",isTree);
    
    BinaryTree_p * aNodeChild = [[aTree getRightBranch] getRightBranch];
    
    
    //after swap some nodes from left to right what happen?
    
    [[[aTree getLeftBranch] getLeftBranch] setLeftBranch:aNodeChild];
    
    BOOL isTree2 = [aTree isABinarrySearchTree:aTree Queue:queue VisitedNodes:nodeTable];
    
    NSLog(@"And Now? is 'aTree' a binary tree?: %hhu",isTree2);
}

-(void) problem_13_FBSuperEnumerator
{
    // Design an enumerator (e.g. named FBSuperEnumerator) that  has two API's: - (id) nextObject; - (NSArray *) allObjects; // all objects remaining which, when given an input array that has content that can be either NSNumbers or NSArray, will expand all arrays embedded inside it. That is, given an input of something like @[@1, @[@2, @[@3, @4]], @[ ], @5], each call to nextObject will display items in the expected order.
    
    NSArray * nestedArray =  @[@1, @[@2, @[@3, @4]], @[ ], @5];
    FBSuperEnumerator * FBEnumerator = [nestedArray objectFBSuperEnumerator];

//    NSLog(@"my FBenumerator allObjects: %@",[FBEnumerator allObjects]);
    
    id anObject = nil;
    while((anObject = [FBEnumerator nextObject]))
        NSLog(@"anObject: %@",anObject);

}

//Necessary test with UIKit.
//-(UIView * ) problem_14_return_b_GivenNodeB:(UIView *)BView And_a:(UIView * )aView
//{
    /*
     You have a simple tree structure Ⓐ and its clone ⓐ. Given an original tree's node Ⓑ, find and return the cloned tree's node ⓑ that is the clone of node Ⓑ.
     
     Each node in the tree has a pointer to its parent as well as an array of its children.
     
     ** You are given B and a. Return b.
     
     Original       Clone
     Ⓐ            ⓐ
     ┏━┻━━┓        ┏━┻━━┓
     ◯    ◯        ◯    ◯
     ┏┻┓ ┏━╋━┓     ┏┻┓ ┏━╋━┓
     ◯ ◯ ◯ ◯ ◯     ◯ ◯ ◯ ◯ ◯
     ┏┻┓  ┃        ┏┻┓  ┃
     ◯ Ⓑ  ◯       ◯ ⓑ  ◯
     
     */
    
    // leetcode.com
    
//
//    UIView * myParent = [BView superview];
//    NSMutableArray * pathViewsArray = [[NSMutableArray alloc]init];
//    
//    
//    while([myParent superview])
//    {
//        [pathViewsArray addObject: [[myParent subviews] indexOfObject:BView]];
//        myParent = [myParent superview];
//    }
//    
//    NSArray * reversedPath = [[pathViewsArray reverseObjectEnumerator] allObjects];
//    
//    UIView * childView = aView;
//    int i =0;
//    for(NSNumber * index in reversedPath)
//    {
//        childView = [[childView subviews] objectAtIndex:[index intValue]];
//    }
//    
//    return childView;
//        
//    
//}

-(NSArray* ) problem_15_removeDuplicatesInArray:(NSArray * )anArray
{
//    Given a string, remove all the duplicate characters (not necessarily consecutive)
//    ["CAT", "CAR", "CAR", "DOG", "CAT", "MOUSE"]
//    ["CAT", "CAR", "DOG", "MOUSE"]
    NSMutableArray * aMutableArray = [NSMutableArray arrayWithArray:anArray];
    NSMutableDictionary * exist = [[NSMutableDictionary alloc] init];
    
    int j = 0;
    for(id word in anArray)
        if(![exist objectForKey:word])
        {
            [aMutableArray replaceObjectAtIndex:j++ withObject:word];
            [exist setValue:@YES forKey:word];
        }
    for(NSUInteger i = [anArray count] - 1 ; i >= j; i--)
        [aMutableArray removeObjectAtIndex:i];
    
    return aMutableArray;
}


-(NSString * ) problem_16_returnSortedAlphabetsAndSumFromString: (NSString * )aString
{
    /*Given a string containing uppercase alphabets and integer digits (from 0 to 9), the task is to print the alphabets in the order followed by the sum of digits.
     Ex:
     inputs:
     
     AC2BEW3
     ACCBA10D2EW30
     
     outputs:
     
     ABCEW5
     AABCCDEW6
     
     */
    
    NSDictionary * numbersDictionary = @{@"0":@0,@"1":@1,@"2":@2,@"3":@3,@"4":@4,@"5":@5,@"6":@6,@"7":@7,@"8":@8,@"9":@9};
    
    NSMutableArray *alphabetArray =  [[NSMutableArray alloc] init];
    
    for(char i = 'A';  i<= 'Z'; i++)
    {
        [alphabetArray addObject:[NSString stringWithFormat:@"%c",i]];
    }
    
    NSMutableDictionary * alphabetDictionary = [[NSMutableDictionary alloc] init];
    
    
    int sum = 0;
    
    for(int  i = 0 ;i< [aString length] ; i++ )
    {
        int  n = 0;
        NSString * aChar = [aString substringWithRange:NSMakeRange(i,1)];
        if( ( n = [[numbersDictionary objectForKey:aChar]  intValue]) )
        {
            sum += n;
        }
        else
        {
            int repeated = 0;
            if( (repeated = [[alphabetDictionary objectForKey: aChar] intValue]) )
            {
                repeated+=1;
                [alphabetDictionary setValue:@(repeated) forKey:aChar];

            }
            else
                [alphabetDictionary setObject:@(1) forKey:aChar];
        }
    }
    
    
    NSMutableString * aMutableString = [[NSMutableString alloc] init];
    
    for (NSString * key in alphabetArray)
    {
        int times = [[alphabetDictionary objectForKey:key] intValue];
        for (int i = 0; i<times; i++)
            [aMutableString appendString: key];
    }
    
    [aMutableString appendFormat:@"%i",sum];
    return [NSString stringWithString: aMutableString];
}

-(NSString * ) problem_16_2_returnSortedAlphabetsAndSumFromString: (NSString * )aString //this is better
{
    /*Given a string containing uppercase alphabets and integer digits (from 0 to 9), the task is to print the alphabets in the order followed by the sum of digits.
     Ex:
     inputs:
     
     AC2BEW3
     ACCBA10D2EW30
     
     outputs:
     
     ABCEW5
     AABCCDEW6
     
     */
    
    NSDictionary * numbersDictionary = @{@"0":@0,@"1":@1,@"2":@2,@"3":@3,@"4":@4,@"5":@5,@"6":@6,@"7":@7,@"8":@8,@"9":@9};
    
    NSMutableDictionary * alphabetOcurrencesDictionary = [[NSMutableDictionary alloc] init];
    
    int sum = 0;
    
    for(int  i = 0 ;i< [aString length] ; i++ )
    {
        NSString * aChar = [aString substringWithRange:NSMakeRange(i,1)];
        
        if([aString characterAtIndex:i] >= 'A' && [aString characterAtIndex:i]<= 'Z')
            // if(aChar >= @'A' && aChar <= @'Z')
        {
            
            int repeated = 0;
            
            if( (repeated = [[alphabetOcurrencesDictionary objectForKey: aChar] intValue]) )
            {
                repeated+=1;
                [alphabetOcurrencesDictionary setValue:@(repeated) forKey: aChar];
            }
            else
            {
                [alphabetOcurrencesDictionary setObject:@(1) forKey:aChar];
            }
        }
        else
        {
            sum += [ [numbersDictionary objectForKey:aChar] intValue];
        }
    }
    
    NSMutableString * aMutableString = [[NSMutableString alloc] init];
    
    for(char c = 'A'; c<='Z'; c++)
    {
        NSString * aStringCharKey = [NSString stringWithFormat:@"%c",c];
        int times = [[alphabetOcurrencesDictionary objectForKey:aStringCharKey] intValue];
        for (int i = 0; i<times; i++)
            [aMutableString appendString: aStringCharKey];
    }
    
    [aMutableString appendFormat:@"%i",sum];
    return [NSString stringWithString: aMutableString];
}



-(NSArray *) problem_17_largestSubArrayWithAtLeastKNumbersInArray:(NSArray *) anArray andK:(int)k // with Kadanes lagorithms
{
    /*Largest sum subarray with at-least k numbers
     
     Given an array, find the subarray 'contiguous' (containing at least k numbers) which has the largest sum.
     
     Examples:
     
     Input : arr[] = {-4, -2, 1, -3}
     k = 2
     Output : -1
     The sub array is {-2, 1}
     
     Input : arr[] = {1, 1, 1, 1, 1, 1}
     k = 2
     Output : 6
     The sub array is {1, 1, 1, 1, 1, 1}
     */
    
    
    int maxCurrentIndex = 0;
    int maxGlobalIndex = 0;
    
    int maxCurrent = [ anArray[0] intValue];
    int maxGlobal = [ anArray[0] intValue];
    
    for(int i = 1; i< anArray.count; i++ )
    {
        
        int newMaxCurent = maxCurrent + [ anArray[i] intValue];
        // NSLog(@" [ %i ]  > %i + [ %i ] ",[anArray[i] intValue],[anArray[i] intValue],maxCurrent);
        
        if([anArray[i] intValue] > newMaxCurent  && maxGlobalIndex - maxCurrentIndex >= k)
        {
            maxCurrent = [anArray[i] intValue];
            maxCurrentIndex = i;
        }
        else
        {
            maxCurrent = newMaxCurent;
        }
        
        
        if(maxCurrent > maxGlobal  )
        {
            maxGlobal = maxCurrent;
            maxGlobalIndex = i;
        }
        
        //       NSLog(@" maxCurrent sum: %i",maxCurrent);
        //       NSLog(@" maxGlobal sum: %i",maxGlobal);
        //       NSLog(@" newMaxCurent sum: %i",newMaxCurent);
        //       NSLog(@"indexDiference : %i",maxGlobalIndex-maxCurrentIndex);
        //       NSLog(@" ------------Gi: %i Ci: %i",maxGlobalIndex,maxCurrentIndex);
        
    }
    
    
    NSLog(@"Kadanes K bigger sum: %i",maxGlobal);
    
    if(k >= anArray.count)
        return anArray;
    
    if(maxGlobalIndex - maxCurrentIndex+1 < k)
        return [self problem_17_largestSubArrayWithAtLeastKNumbersInArray:[anArray subarrayWithRange:NSMakeRange(1,anArray.count-1)] andK:k];
    else
        return [anArray subarrayWithRange:NSMakeRange(maxCurrentIndex,maxGlobalIndex-maxCurrentIndex+1)];
    
    
}

BOOL isPerfectRoot(int n)
{
    int sqr = sqrt(n); // int remove the decimal units if this number is not a perfect root
    return ( (sqr*sqr) == n);
}

BOOL isFibonacci(int n)
{//https://en.wikipedia.org/wiki/Fibonacci_number#Recognizing Fibonacci numbers
    return (isPerfectRoot((5*(n*n))+4) || isPerfectRoot((5*(n*n))-4));
}

-(NSArray *) problem_18_findLargestSubsequenceFibonacci:(NSArray * )anArray
{
    //largest subsequence Fibonacci numbers
    
    //Given an array with positive number the task to find the largest subsequence from array that contain elements which are Fibonacci numbers.
    

    NSMutableArray * subSequenceF = [[NSMutableArray alloc] init];
    
    for(id i in anArray)
    {
        if( isFibonacci([i intValue]) )
            [subSequenceF addObject:i];
    }
    
    return [NSArray arrayWithArray:subSequenceF];
}

-(BOOL) problem_19_isPalindrome:(NSString *)aString
{
    if(aString.length <=1)
        return YES;
    
    int i = 0;
    int j = (int)([aString length])  -1;
    
    if([aString characterAtIndex:i] == ' ')
        return [self problem_19_isPalindrome:[aString substringFromIndex:i+1]];
    if([aString characterAtIndex:j] == ' ')
        return  [self problem_19_isPalindrome:[aString substringToIndex:j-1]];
    
    NSString *subString = [aString substringWithRange:NSMakeRange(i+1,j-1)];
    
    
    
    return ([aString characterAtIndex:i] == [aString characterAtIndex:j] ) && [self problem_19_isPalindrome:subString ];
    
}

-(NSArray *) problem_20_pairsWithAGivenSumBetweenArrayElementsArraA:(NSArray *) arrayA andArrayB:(NSArray *) arrayB withNumber:( int )x
{
    // Find all pairs with a given sum
    //Given two unsorted arrays A[] of size n and B[] of size m of distinct elements, the task is to find all pairs from both arrays whose sum is equal to x. O(n)
    
    // Input :  A[] = {-1, -2, 4, -6, 5, 7}
    //          B[] = {6, 3, 4, 0}
    //          x = 8
    // Output : 4 4, 5 3
    
    NSMutableDictionary<NSNumber *,id> * diferencesDict = [[NSMutableDictionary alloc] init];
    
    NSMutableArray * pairs = [[NSMutableArray alloc] init];
    
    for(id a in arrayA)
    {
        int aDif = x - [a intValue];
        [diferencesDict setObject:a forKey:@(aDif)];
    }
    
    for(id b in arrayB)
    {
        id pair = nil;
        if((pair = [diferencesDict objectForKey:b] ) )
            [pairs addObject:@[b,pair]];
        
    }
    return (NSArray *)pairs;
}


-(NSString *) problem_21_integerToRoman:(int )n
{
    NSMutableString * romanNumber = [[NSMutableString alloc] init];
    NSDictionary * romanTable = @{@1:@"I",
                                  @2:@"II",
                                  @3:@"III",
                                  @4:@"IV",
                                  @5:@"V",
                                  @6:@"VI",
                                  @7:@"VII",
                                  @8:@"VIII",
                                  @9:@"IX",
                                  @10:@"X",
                                  @50:@"L",
                                  @100:@"C",
                                  @500:@"D",
                                  @1000:@"M",};
    int i = n;
    int d = n;
    int m = 10;
    int mult = 1;
    
    while(n != 0)
    {
        i = n % m;
        d = (int)(i/mult);
        
        id romanChar = nil;
        if(!(romanChar = [romanTable objectForKey:@(i)]))
            for(int j = 0; j<d; j++)
                romanNumber = (NSMutableString *)[NSString stringWithFormat:@"%@%@",[romanTable objectForKey:@(mult)],romanNumber];
        else
            romanNumber = (NSMutableString *)[NSString stringWithFormat:@"%@%@",romanChar,romanNumber];
        
        
        mult *= 10;
        m *= 10;
        n = n - i;
        
    }
    
    return (NSString *)romanNumber;
}


@end




@implementation LinkedListNode

-(id)init
{
    self = [super init];
    
    if(self)
    {
        _value = -1;
        _nodeIndex = 0;
        _nextNode = nil;
    }
    
    return self;
}

-(id)initWithValue:(int)value
{
    self = [super init];
    if(self)
    {
        _value = value;
        _nodeIndex = 0;
        _nextNode = nil;
    }
    
    return self;
}

-(id)initWithValue:(int)value andIndex:(int)index
{
    self = [super init];
    if(self)
    {
        _value = value;
        _nodeIndex = index;
        _nextNode = nil;
    }
    
    return self;
}

-(void)setNodeValue:(int)value{ _value = value;}
-(void)setNextNode:(LinkedListNode * )nextNode{_nextNode = nextNode;}

-(int)getValue{return _value;}
-(LinkedListNode *)getNextNode{return _nextNode;}


-(void)addValue:(int)value
{
    if([self getValue] != -1)
        if([self getNextNode])
            [_nextNode addValue:value];
        else
        {
            LinkedListNode * aNewNode = [[LinkedListNode alloc] initWithValue:value andIndex:_nodeIndex+1];
            [self setNextNode:aNewNode];
        }
        else
            [self setNodeValue:value];
}

-(void)printList
{
    NSLog(@"value: %i", _value);
    if([self getNextNode])
        [_nextNode printList];
}

-(void)swapValues
{
    if(![self getNextNode])
        return;
    
    if(_nodeIndex % 2 == 0)
    {
        int temp = [_nextNode getValue];
        [_nextNode setNodeValue: [self getValue]];
        [self setNodeValue: temp];
    }
    else
    {
        [_nextNode swapValues];
    }
    
}

-(LinkedListNode * )swapNodes
{
    if([self getNextNode])
    {
        LinkedListNode * temporalNextNextNode = [[self getNextNode] getNextNode];//save next next node link
        [_nextNode setNextNode: self]; // break nextNode breaks with its next node (previusly saved) and points self
        LinkedListNode * temporalNextNode = _nextNode;//save next node link before break it.
        [self setNextNode:[temporalNextNextNode swapNodes]];//now self points to the now-swaped node between temporal and its Next node;
        
        return temporalNextNode;//return swaped 
        
    }
    return self;
}

@end


@implementation BinaryTree_p


-(id)init
{
    self =[super init];
    if(self)
    {
        _value = -1;
        _parentBranch_p = nil;
        _leftBranch_p = nil;
        _rightBranch_p = nil;
    }
    
    return self;
}

-(id)initWithValue:(int)value
{
    self = [super init];
    
    if(self)
    {
        _value = value;
        _parentBranch_p = nil;
        _leftBranch_p = nil;
        _rightBranch_p = nil;
    }
    return self;
}

-(void)setValue:(int)value
{
    _value = value;
}

-(void)setLeftBranch:(BinaryTree_p *)leftBranch
{
    _leftBranch_p = leftBranch;
}

-(void)setRightBranch:(BinaryTree_p *)rightBranch
{
    _rightBranch_p = rightBranch;
}

-(void)setParentBranch:(BinaryTree_p *)parentBranch
{
    _parentBranch_p = parentBranch;
}

-(int)getValue
{
    return _value;
}

-(BinaryTree_p * )getLeftBranch
{
    return _leftBranch_p;
}

-(BinaryTree_p * )getRightBranch
{
    return _rightBranch_p;
}

-(BinaryTree_p *)getParentBranch
{
    return _parentBranch_p;
}

//DFS Traversal
-(NSMutableArray * )inOrderTraversal
{
    NSMutableArray * anArray  = [[NSMutableArray alloc] init];
    
    if([self getLeftBranch])
        [anArray addObjectsFromArray: [_leftBranch_p inOrderTraversal] ];
    
    [anArray addObject: @(_value)];
//    [anArray addObject: [NSNumber numberWithInt:_value]];
    
    if([self getRightBranch])
        [anArray addObjectsFromArray: [_rightBranch_p inOrderTraversal]];
    
    return anArray;
}

-(NSMutableArray * )preOrderTraversal
{
    NSMutableArray * anArray = [[NSMutableArray alloc] init];
    
    [anArray addObject:@(_value)];
    
    if([self getLeftBranch])
        [anArray addObjectsFromArray: [_leftBranch_p preOrderTraversal]];
    
    if([self getRightBranch])
        [anArray addObjectsFromArray: [_rightBranch_p preOrderTraversal]];
    
    return anArray;
}

-(NSMutableArray * )posOrderTraversal
{
    NSMutableArray * anArray = [[NSMutableArray alloc] init];
    
    if([self getLeftBranch])
        [anArray addObjectsFromArray: [_leftBranch_p posOrderTraversal]];
    
    if([self getRightBranch])
        [anArray addObjectsFromArray: [_rightBranch_p posOrderTraversal]];
    
    [anArray addObject: @(_value)];
    
    return anArray;
}

-(void)sortedInsert:(int)aValue
{
    NSLog(@"sortedInsert: %i",aValue);
    if(_value != -1)
        if(_value != aValue)
            if(_value > aValue)
                if([self getLeftBranch] == nil)
                {
                    BinaryTree_p * aLeftBranch = [[BinaryTree_p alloc] initWithValue: aValue];
                    [self setLeftBranch: aLeftBranch];
                    NSLog(@" - value in left branch: %i",aValue);
                }
                else
                {
                    [_leftBranch_p sortedInsert:aValue];
                }
                else
                    if([self getRightBranch] == nil)
                    {
                        BinaryTree_p * aRightBranch = [[BinaryTree_p alloc] initWithValue: aValue];
                        [self setRightBranch: aRightBranch];
                        NSLog(@" - value in right branch: %i",aValue);
                        
                    }
                    else
                    {
                        [_rightBranch_p sortedInsert:aValue];
                    }
    
                    else
                        NSLog(@"That value already exist in btree");
                    else
                    {
                        [self setValue:aValue];
                        NSLog(@" - value in self: %i",aValue);
                    }
    
}
-(NSMutableArray *)getLongestPathFrom:(BinaryTree_p *)aNode and:(NSMutableArray *)path
{
    NSMutableArray *aNewPath = [NSMutableArray arrayWithArray:path]; //necesary mutable copy and not pass the path directly, otherwise the path will be modified in each iteration
    [aNewPath addObject:@([aNode getValue])];
    NSMutableArray * rightPath = [[NSMutableArray alloc] init];
    NSMutableArray * leftPath = [[NSMutableArray alloc] init];
    
    if([aNode getLeftBranch])
        leftPath = [aNode getLongestPathFrom: [aNode getLeftBranch] and: aNewPath];
    if([aNode getRightBranch])
        rightPath = [aNode getLongestPathFrom: [aNode getRightBranch] and: aNewPath];
    
    if(rightPath.count >= aNewPath.count)//here you can adjust the method to get the longes or shortest path
        aNewPath = rightPath;
    
    if(leftPath.count >= aNewPath.count)//here you can adjust the method to get the longes or shortest path
        aNewPath = leftPath;
    
    return aNewPath;
}


-(BOOL)isABinarrySearchTree:(BinaryTree_p * )aNode Queue:(NSMutableArray *)queue VisitedNodes:(NSMutableArray *)nodeTable
{
    NSLog(@" - queue: %@",queue);
    NSLog(@" - nodeTable: %@",nodeTable);
    
    // [queue insertObject: aNode atIndex:0];
    [queue addObject: aNode];
    
    if([nodeTable containsObject:aNode])
        return NO;
    
    BinaryTree_p * temp = [queue objectAtIndex:[queue count]-1];
    [nodeTable addObject:temp];
    [queue removeObjectAtIndex:[queue count]-1];
    
    if([temp getLeftBranch])
    {
        if([temp getLeftBranch] != [temp getParentBranch])
            [temp isABinarrySearchTree:[temp getLeftBranch] Queue:queue VisitedNodes:nodeTable];
        else
            return NO;
    }
    
    if([temp getRightBranch])
    {
        if([temp getRightBranch] != [temp getParentBranch])
            [temp isABinarrySearchTree:[temp getRightBranch] Queue:queue VisitedNodes:nodeTable];
        else
            return NO;
    }
    
    return YES;
}

-(BOOL)isABinarrySearchTreeNoRecursive:(BinaryTree_p * )aNode Queue:(NSMutableArray *)queue VisitedNodes:(NSMutableArray *)nodeTable
{
    
    [queue addObject: aNode];
    
    while(queue.count > 0)
    {
        NSLog(@" - queue: %@",queue);
        NSLog(@" - nodeTable: %@",nodeTable);
        
        
        BinaryTree_p * temp = [queue objectAtIndex:[queue count]-1];
        
        if([nodeTable containsObject:temp])
            return NO;
        
        [nodeTable addObject:temp];
        [queue removeObjectAtIndex:[queue count]-1];
        
        if([temp getLeftBranch])
        {
            if([temp getLeftBranch] != [temp getParentBranch])
                [queue insertObject: [temp getLeftBranch] atIndex:0];
            else
                return NO;
        }
        
        if([temp getRightBranch])
        {
            if([temp getRightBranch] != [temp getParentBranch])
                [queue insertObject: [temp getRightBranch] atIndex:0];
            else
                return NO;
        }
    }
    
    return YES;
}
@end

