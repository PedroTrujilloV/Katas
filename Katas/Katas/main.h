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

@interface Kata2_Arrays : NSObject
    
    - (void) introductionToArrays;
    - (void) comparingArrays;
    - (void) membershipChecking: (NSString * )aColor;
    - (void) sortingArrays;
    - (void) subdividingArrays;
    
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
