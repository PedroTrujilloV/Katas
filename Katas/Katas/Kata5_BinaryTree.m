//
//  Kata5_BinaryTree.m
//  Katas
//
//  Created by Pedro Trujillo on 10/3/16.
//  Copyright © 2016 Pedro Trujillo. All rights reserved.
//

#import "main.h"

@implementation BinaryTree

    - (id) init
    {
        self = [super init];
        if(self)
        {
            _value = -1;
            _leftBranch = nil;
            _rightBranch = nil;
            _parent = nil;
        }
        return self;
    }

    - (id) initWithValue:(int)value
    {
        self = [super init];
        if(self)
        {
            _value = value;
            _leftBranch = nil;
            _rightBranch = nil;
            _parent = nil;
        }
        return self;
    }

    

    - (void) setLeftBranch:(BinaryTree *)leftBranch { _leftBranch = leftBranch;}
    - (void) setRightBranch:(BinaryTree *)rightBranch { _rightBranch = rightBranch;}
    - (void) setParent:(BinaryTree *)parent { _parent = parent;}
    - (void) setValue: (int) value {_value = value;}
    - (void) sortedInsert: (int) value
    {
        NSLog(@"insert: @%i",value);

        if(value != _value)
            if(value<_value)
                if(_leftBranch != nil)
                    [_leftBranch sortedInsert:value];
                else
                {
                    BinaryTree * aBranch = [[BinaryTree alloc]initWithValue:value];
                    [aBranch setParent:self];
                    [self setLeftBranch:aBranch];
                }
            else
                if(_rightBranch != nil)
                    [_rightBranch sortedInsert:value];
                else
                {
                    BinaryTree * aBranch = [[BinaryTree alloc]initWithValue:value];
                    [aBranch setParent:self];
                    [self setRightBranch:aBranch];
                }
        
        else
            NSLog(@"Value already exist");
    }

    - (BinaryTree *) getLeftBranch { return _leftBranch;}
    - (BinaryTree *) getRightBranch { return _rightBranch;}
    - (BinaryTree *) getParent { return _parent;}
    - (int) getValue {return _value;}

//DFS Tree Traversal:

    - (void) inOrderTraversal
    {
        if(_leftBranch != nil)
            [_leftBranch inOrderTraversal];
        NSLog(@" value: @%i",[self getValue]);
        if(_rightBranch != nil)
            [_rightBranch inOrderTraversal];
    }
    - (void) preOrderTraversal
    {
        NSLog(@" value: @%i",[self getValue]);
        if(_leftBranch != nil)
            [_leftBranch preOrderTraversal];
        if(_rightBranch != nil)
            [_rightBranch preOrderTraversal];
    }
    - (void) posOrderTraversal
    {
        if(_leftBranch != nil)
            [_leftBranch posOrderTraversal];
        if(_rightBranch != nil)
            [_rightBranch posOrderTraversal];
        NSLog(@" value: @%i",[self getValue]);
    }

@end

@implementation Kata5_BinaryTree
    - (void) treeImplementation
    {
        BinaryTree * aTree = [[BinaryTree alloc]initWithValue:10];
        
        //insert
        [aTree sortedInsert:3];
        [aTree sortedInsert:5];
        [aTree sortedInsert:18];
        [aTree sortedInsert:1];
        [aTree sortedInsert:9];
        [aTree sortedInsert:8];
        [aTree sortedInsert:15];
        [aTree sortedInsert:17];
        [aTree sortedInsert:12];
        
        //print
        NSLog(@"Inorder Traversal:");
        [aTree inOrderTraversal];
        NSLog(@"Preorder Traversal:");
        [aTree preOrderTraversal];
        NSLog(@"Posorder Traversal:");
        [aTree posOrderTraversal];
    }
@end
