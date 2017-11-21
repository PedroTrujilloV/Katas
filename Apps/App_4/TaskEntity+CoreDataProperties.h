//
//  TaskEntity+CoreDataProperties.h
//  App_4
//
//  Created by Pedro Trujillo on 11/21/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "TaskEntity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface TaskEntity (CoreDataProperties)

+ (NSFetchRequest<TaskEntity *> *)fetchRequest;

@property (nonatomic) BOOL status;
@property (nullable, nonatomic, copy) NSDate *expirationDate;
@property (nullable, nonatomic, copy) NSString *taskDescription;

@end

NS_ASSUME_NONNULL_END
