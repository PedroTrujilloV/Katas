//
//  Kata4_Stack.m
//  Katas
//
//  Created by Pedro Trujillo on 9/29/16.
//  Copyright © 2016 Pedro Trujillo. All rights reserved.
//

#import "main.h"


@implementation Stack

    -(id)init
    {
        self = [super init];
        if(self)
        {
            //something
        }
        return self;
    }

    - (BOOL) isEmpty{return self.top == nil;}
    - (int) getSize{return self.sizeStack;}
    - (void) push: (int) value
    {
        if([self isEmpty])
        {
            self.top = [[Node alloc]init];
            [self.top setNodeValue:value];
        }
        else
        {
            Node * newTop = [[Node alloc]initWithValue:value];
            [newTop setLink:self.top];
            self.top = newTop;
        }
        NSLog(@"Pushed: @%i",value);

        self.sizeStack += 1;
    }
    - (int) pop
    {
        if(![self isEmpty])
        {
            int d;
            Node * topNode = self.top;
            self.top = [self.top getNodeLink];
            d = [topNode getNodeValue];
            topNode = nil;
            self.sizeStack -= 1;
            NSLog(@"Popped: @%i",d);
            return d;
        }
        NSLog(@"Empty");
        return -1;
    }
    - (int) peek{NSLog(@"Peek:"); if(![self isEmpty])return [self.top getNodeValue]; return -1;}
    - (void) destroy{while(![self isEmpty])[self pop];NSLog(@"Destroyed");}
    - (void) printStack
    {
        NSLog(@"  ");
        NSLog(@"Stack: ");
        
        if(self.isEmpty)
        {
            NSLog(@"Empty");
        }
        else
        {
            Node * aTop = self.top;
            
            while ( aTop != nil)
            {
                //NSLog(@"Node: %i",[aTop getNodeIndex]);
                NSLog(@"   Node data: %i",[aTop getNodeValue]);
                aTop = [aTop getNodeLink];
            }
        }
        
        NSLog(@"  ");
    }

@end

@implementation Kata4_Stack

    - (void) stackImplementation
    {
        Stack * aStack = [[Stack alloc]init];
        
        //print
        [aStack printStack];
        
        //push
        
        [aStack push:3];
        [aStack push:20];
        [aStack push:5];
        [aStack push:1];
        [aStack push:7];
        
        //print
        [aStack printStack];
        
        //pop
        [aStack pop];
        [aStack pop];
        
        //print
        [aStack printStack];
        
        //peek
        NSLog(@"@%i",[aStack peek]);
        
        //print
        [aStack printStack];
        
        //destroy
        [aStack destroy];
        
        //print
        [aStack printStack];
    }

@end
