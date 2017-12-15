//
//  MainTableViewController.h
//  App_5
//
//  Created by Pedro Trujillo on 12/10/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedTableViewCell.h"
#import "FeedModel.h"



@interface MainTableViewController : UITableViewController

    @property (nonatomic, strong) NSMutableArray * modelArray;
    @property (nonatomic, readonly) NSArray * feedImagesArray;
    @property (nonatomic, readonly) NSArray * profileImagesArray;
    @property (nonatomic, readonly) NSString * catsURL;

    @property (nonatomic) NSOperationQueue * aNSOperationQueue;

-(IBAction) StartDownload:(UIBarButtonItem * )sender;
-(IBAction) CancelDownload:(UIBarButtonItem *)sender;

-(void) nonResposiveDownload;

// - GCD:

-(void) GCDSerialQueuesDownload;
-(void) GCDConcurrentQueuePriorityHighDownload;
-(void) GCDConcurrentQueuePriorityDefaultDownload;
-(void) GCDConcurrentQueuePriorityLowDownload;
-(void) GCDConcurrentQueuePriorityBackgroundDownload;
-(void) GCDConcurrentCreateQueue;

// - NSOperationQueue:

-(void)NSOperationQueueDownload;
-(void) NSOperationQueueDownloadWithNSBlockOperationAndCompletionBlock;
-(void) NSOperationQueueDownloadWithNSBlockOperationAndDependency;//Emulated Serial Queue
-(void) NSOperationQueueDownloadCancelWithNSBlockOperationAndDependency;

@end
