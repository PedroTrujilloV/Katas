//
//  Node.m
//  Katas
//
//  Created by Pedro Trujillo on 9/29/16.
//  Copyright © 2016 Pedro Trujillo. All rights reserved.
//

#import "main.h"

@implementation Node
    

    - (id) init
    {
        self = [super init];
        if(self)
        {
            self.value = 0;
            self.link = nil;
        }
        return self;
    }
    - (id) initWithValue:(int)value
    {
        self = [super init];
        if(self)
        {
            self.value = value;
            self.link = nil;
        }
        return self;
    }
    - (id) initWithValue:(int)value andLink:(Node *)nodeLink
    {
        self = [super init];
        if(self)
        {
            self.value = value;
            self.link = nodeLink;
        }
        return self;
    }

    - (void) setNodeValue: (int) value {self.value = value;}
    - (void) setNodeLink: (Node *) nodeLink {self.link = nodeLink;}
    - (void) setNodeIndex
    {
        if(self.link != nil)
            self.index = [self getNodeIndex] + 1;
        else
            self.index = 0;
    }

    - (int) getNodeIndex{ return self.index;}
    - (int) getNodeValue{ return self.value;}
    - (Node *) getNodeLink{ return self.link;}


    - (void) printData{ NSLog(@"value: %i",self.value);}
    
@end
