//
//  Algorithms.m
//  Katas
//
//  Created by Pedro Trujillo on 11/24/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

#import "main.h"

@implementation MergeSort

-(NSArray*)merge:(NSArray* )leftArray and:(NSArray*)rightArray
{
    NSMutableArray * leftArr = [NSMutableArray arrayWithArray: leftArray];
    NSMutableArray * rightArr = [NSMutableArray arrayWithArray: rightArray];
    
    NSMutableArray * result = [[NSMutableArray alloc] init];
    
    int i = 0;
    int j = 0;
    
    while(i< leftArr.count && j<rightArr.count)
    {
        if([leftArr[i] intValue] < [rightArr[j] intValue])
        {
            [result addObject:leftArr[i]];
            i++;
        }
        else
        {
            [result addObject:rightArr[j]];
            j++;
        }
    }
    
    while(i<leftArr.count)
        [result addObject:leftArr[i++]];
    while(j<rightArr.count)
        [result addObject:rightArr[j++]];
    
    return [NSArray arrayWithArray:result];
}

-(NSArray *)sort:(NSArray * )anArray
{
    if(anArray.count <= 2)
        return anArray;
    
    int middlePoint = (int)(anArray.count/2);
    
    NSArray * leftPart = [anArray subarrayWithRange:NSMakeRange(0,middlePoint)];
    NSArray * rightPart = [anArray subarrayWithRange:NSMakeRange(middlePoint,anArray.count-middlePoint-1)];
    
    NSArray * sortedLeft = [self sort:leftPart];
    NSArray * sortedRight = [self sort:rightPart];
    
    NSArray * merged = [self merge:sortedLeft and:sortedRight];
    
    return merged;
}

-(NSArray * )mergeSort:(NSArray * )anArray
{
    return [self sort:anArray];
}

@end

@implementation Algorithms

-(void)mergeSort
{
    NSMutableArray * myArray = (NSMutableArray*)@[@2,@16,@5,@22,@1,@3,@11,@7,@12,@4,@18,@9,@0,@15,@25,@6,@21,@8,@30];
    // NSMutableArray * myArray2 = (NSMutableArray*)@[@2,@16,@5,@22,@1,@3,@11,@7,@12,@4,@18,@9,@0,@15,@25,@6,@21,@8,@30];
    
    MergeSort * ms = [[MergeSort alloc]init];
    // NSArray * merged = [ms merge:myArray and:myArray2];
    NSArray * mergeSorted = [ms mergeSort:myArray];
    NSLog(@"Merge array: %@",mergeSorted);
}


@end
