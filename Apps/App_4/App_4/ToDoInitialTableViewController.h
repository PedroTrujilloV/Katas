//
//  ToDoInitialTableViewController.h
//  App_4
//
//  Created by Pedro Trujillo on 11/20/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaksUITableViewCell.h"
#import <CoreData/CoreData.h>
#import "TaskModel.h"
#import "AppDelegate.h"
#import "TimeCircuitsUIViewController.h"


@interface ToDoInitialTableViewController : UITableViewController <UITextFieldDelegate,TimeCircuitsProtocolDelegate>

    @property (strong) NSArray<TaskModel * > * taksList;
    @property (strong) TaskModel * editingTask;

@end
