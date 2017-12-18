//
//  Algorithms.m
//  Katas
//
//  Created by Pedro Trujillo on 11/24/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

#import "main.h"

/*============================= MergeSort (complexity O(n log n))=============================*/
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


/*============================= end MergeSort =============================*/

/*============================= Quick Sort worst case complexity O(n^2))=============================*/



@implementation QuickSort



-(int) partition:(NSArray * )anArray Low:(int)low High:(int)high
{
    NSMutableArray * aMutableArray = [[NSMutableArray alloc] initWithArray:anArray];
//    [aMutableArray ]
//    NSUInteger pivot = [anArray[high] integerValue];
//    int i =  (low  -1);
//    for(int j = low; j <= high; j++ )
//        if([anArray[j] integerValue] <= pivot )
//            {}
    return 0;
}

-(NSArray * )quickSort:(NSArray*)anArray
{
    if([anArray count] < 2)
        return anArray;
    NSMutableArray * aMutableArray = [[NSMutableArray alloc] initWithArray:anArray];
    NSUInteger i = 0;
    NSUInteger j = [anArray count]-1;
    int mid = (int)(j/2);
    id temp = nil;
    id pivot = [anArray objectAtIndex:mid];
    while (i<=j)
    {
        while ([aMutableArray[i] integerValue] < [pivot integerValue] )
            i++;
        while ([aMutableArray[j] integerValue] > [pivot integerValue])
            j--;
        
        if(i<=j)
        {
            temp = aMutableArray[i];
            [aMutableArray replaceObjectAtIndex:i withObject:aMutableArray[j]];
            [aMutableArray replaceObjectAtIndex:j  withObject:temp];
            i++;
            j--;
        }
    }
    
//    NSArray * left =  [self quickSort:[aMutableArray subarrayWithRange:NSMakeRange(0,j)]];
    
    NSMutableArray * quickSorted = [[NSMutableArray alloc] init];
    if(mid > 0 )
        [quickSorted addObjectsFromArray: [self quickSort:[aMutableArray subarrayWithRange:NSMakeRange(0,mid-1)]]];
    
    if(mid < [anArray count])
       [quickSorted addObjectsFromArray: [self quickSort:[aMutableArray subarrayWithRange:NSMakeRange(mid,[anArray count]-1)]]];
    
    return [NSArray arrayWithArray:quickSorted];
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
    NSLog(@"Merge Sort array: %@",mergeSorted);
}

-(void) quickSort
{
    NSMutableArray * myArray = (NSMutableArray*)@[@2,@16,@5,@22,@1,@3,@11,@7,@12,@4,@18,@9,@0,@15,@25,@6,@21,@8,@30];
    
    QuickSort * qs = [[QuickSort alloc] init];
    NSArray * quickSorted = [qs quickSort:myArray];
    NSLog(@"Quick Sort array: %@", quickSorted);
    
}






@end
