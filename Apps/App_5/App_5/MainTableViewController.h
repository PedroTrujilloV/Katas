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

-(IBAction) StartDownload:(UIBarButtonItem * )sender;
-(void) nonResposiveDownload;
-(void) GCDSerialQueuesDownload;

@end
