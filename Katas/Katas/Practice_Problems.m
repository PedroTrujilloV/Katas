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


//inorder BS
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
 Return the head node of the singly linked list with each pair of nodes swapped. If there is a last odd node leave it in place.
 
 Example:
 Input: 1 -> 2 -> 3 -> 4 -> 5
 Output: 2 -> 1 -> 4 -> 3 -> 5
 */



/*
 How to detect a common superview.
 

 The same list, back to inorder binary tree

 Design a simple photo stream app
 */

/*
 Find the intersection between 2 NSRanges

 Define the differences between Weak, Strong, Assign and Retain

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
    return -1;
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

@end



//https://coderpad.io/YN7G3FJG
