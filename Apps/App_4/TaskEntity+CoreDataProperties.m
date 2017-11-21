//
//  TaskEntity+CoreDataProperties.m
//  App_4
//
//  Created by Pedro Trujillo on 11/21/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "TaskEntity+CoreDataProperties.h"

@implementation TaskEntity (CoreDataProperties)

+ (NSFetchRequest<TaskEntity *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"TaskEntity"];
}

@dynamic status;
@dynamic expirationDate;
@dynamic taskDescription;

@end
