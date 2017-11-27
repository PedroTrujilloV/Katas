//
//  main.h
//  Katas
//
//  Created by Pedro Trujillo on 9/28/16.
//  Copyright © 2016 Pedro Trujillo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Kata1_DataTypes : NSObject
    
    - (void) introductionToDataTypes;
    
@end

@interface Kata1_2_DataTypes : NSObject

    - (void) introductionToDataTypes2;

@end

@interface Kata2_Arrays : NSObject
    
    - (void) introductionToArrays;
    - (void) comparingArrays;
    - (void) membershipChecking: (NSString * )aColor;
    - (void) sortingArrays;
    - (void) subdividingArrays;
    
@end

@interface Kata2_2_Arrays : NSObject

    - (void) introductionToArrays2;
    - (void) nsMutableArrays;

@end

@interface Kata3_LinkedLists : NSObject
    
    - (void) implementationOfLLInOC;

@end

@interface Node : NSObject
    
    @property int index;
    @property int value;
    @property Node * link;

    - (id) init;
    - (id) initWithValue: (int) value;
    - (id) initWithValue:(int)value andLink:(Node *) nodeLink;

    - (void) setNodeIndex;
    - (void) setNodeValue: (int) value;
    - (void) setNodeLink: (Node *) nodeLink;
    
    - (int) getNodeIndex;
    - (int) getNodeValue;
    - (Node *) getNodeLink;
    
    - (void) printData;

@end

@interface Stack : NSObject

    @property Node * top;
    @property int sizeStack;

    - (id) init;
    - (BOOL) isEmpty;
    - (int) getSize;
    - (void) push: (int) value;
    - (int) pop;
    - (int) peek;
    - (void) destroy;
    - (void) printStack;

@end

@interface  Kata4_Stack : NSObject

    - (void) stackImplementation;
@end


@interface BinaryTree : NSObject

    @property (nonatomic) int value;
    @property (nonatomic) int level;
    @property (nonatomic) BinaryTree * parent;
    @property (nonatomic) BinaryTree * leftBranch;
    @property (nonatomic) BinaryTree * rightBranch;

    - (id) init;
    - (id) initWithValue: (int) value;

    - (void) setLeftBranch:(BinaryTree *)leftBranch;
    - (void) setRightBranch:(BinaryTree *)rightBranch;
    - (void) setParent:(BinaryTree *)parent;
    - (void) setValue: (int) value;
    - (void) sortedInsert: (int) value;

    - (BinaryTree *) getLeftBranch;
    - (BinaryTree *) getRightBranch;
    - (BinaryTree *) getParent;
    - (int) getValue;

    - (void) inOrderTraversal;
    - (void) preOrderTraversal;
    - (void) posOrderTraversal;

@end

@interface Kata5_BinaryTree : NSObject
    - (void) treeImplementation;
@end

@interface Kata6_Dictionary:NSObject
    - (void) dictionaryImplementation;
@end


@interface BinaryTree_p : NSObject

@property (nonatomic) int value;
@property(nonatomic) BinaryTree_p * parentBranch_p;
@property(nonatomic) BinaryTree_p * leftBranch_p;
@property(nonatomic) BinaryTree_p * rightBranch_p;

-(id)init;
-(id)initWithValue:(int)value;

-(void)setValue:(int)value;
-(void)setLeftBranch:(BinaryTree_p *)leftBranch;
-(void)setRightBranch:(BinaryTree_p *)rightBranch;
-(void)setParentBranch:(BinaryTree_p *)parentBranch;

-(NSMutableArray * )preOrderTraversal;
-(NSMutableArray * )inOrderTraversal;
-(NSMutableArray * )posOrderTraversal;

-(void)sortedInsert:(int)aValue;


@end

@interface LinkedListNode : NSObject

@property(nonatomic) int nodeIndex;
@property(nonatomic) int value;
@property(nonatomic) LinkedListNode * nextNode;
-(id)init;
-(id)initWithValue:(int)value;
-(id)initWithValue:(int)value andIndex:(int)index;
-(void)setNodeValue:(int)value;
-(void)setNextNode:(LinkedListNode * )nextNode;
-(int)getValue;
-(LinkedListNode *)getNextNode;
-(void)addValue:(int)value;
-(void)printList;
-(void)swapValues;
-(LinkedListNode * )swapNodes;

@end


@interface Practice_Problems : NSObject

-(int) problem_1_moveAllZeros:(NSArray *)givenArray;
-(BOOL) problem_2_pairInArray:(NSArray*)givenArray sumThisInt:(int)intNum;
-(NSString * ) problem_3_AdditionTwoBinaryNumbers:(NSString *)binaryStringNumberA and:(NSString * )binaryStringNumberB;
-(BOOL) problem_4_isValidPalindrome:(NSString *)possiblePalindrome;
-(void)problem_5_BinaryTreeToListInOrder;
-(void)problem_6_LinkedListPairSwapedNodes;
-(int)problem_7_arraySumElementsMultiplyDeep:(NSArray *)anArray andDeep:(int)deep;
-(NSArray *) problem_8_allCombinationsInPhoneNumberKeyLetters:(NSArray *) numbersArray and:(NSString *) curentCombination;
//Necessary UIKit to test.
//-(NSArray*)problem_9_getCommonSuperViews:(UIView *)viewA and:(UIView * )viewB;
//-(NSArray*)getSuperViews:(UIView *)aView;

@end
