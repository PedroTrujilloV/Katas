//
//  Kata3_LinkedLists.m
//  Katas
//
//  Created by Pedro Trujillo on 9/29/16.
//  Copyright © 2016 Pedro Trujillo. All rights reserved.
//  sources:
//  [1]: http://stackoverflow.com/questions/12457524/how-do-i-implement-a-linked-list-in-objective-c

#import "main.h"

// Struct
struct LinkedList
{
    int value;
    struct LinkedList * next;
};

@implementation Kata3_LinkedLists

 - (void) implementationOfLLInOC
    {
        struct LinkedList * node1 = malloc(sizeof(struct LinkedList)); //how alloc a struct
        struct LinkedList * node2 = malloc(sizeof(struct LinkedList));
        struct LinkedList * node3 = malloc(sizeof(struct LinkedList));

        
        node1->value = 1;
        node2->value = 2;
        node3->value = 3;

        
        node1->next = node2;
        node2->next = node3;
        node3->next = nil;

        
        struct LinkedList * temp = node1;
        while (temp->next != nil)
        {
            NSLog(@"node%i",temp->value);
            NSLog(@"parent of node%i",temp->next->value);
            
            temp = temp->next;

        }
        
        free(node3);
        free(node2);
        free(node1);
    }

@end
