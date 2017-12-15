//
//  MainTableViewController.m
//  App_5
//
//  Created by Pedro Trujillo on 12/10/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

#import "MainTableViewController.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _modelArray = [[NSMutableArray alloc] init];
    _feedImagesArray = [[NSArray alloc] initWithObjects:
                        @"http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
                        @"http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
                        nil];
    
    _profileImagesArray = [[NSArray alloc] initWithObjects: @100,@101,@200,@201,@202,@204,@206, nil];//@207,@300,@301,@302,@303,@304,@305,@307,@400,@401,@402,@403,@404,@405,@406,@408,@409,@410,@411,@412,@413,@414,@415,@416,@417,@418,@420,@421,@422,@423,@424,@425,@426,@429,@431,@444,@450,@451,@500,@502,@503,@504,@506,@507,@508,@509,@511,@599, nil];
    
    _catsURL = @"https://http.cat/";
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return _modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    FeedTableViewCell * feedCell = (FeedTableViewCell *)[tableView dequeueReusableCellWithIdentifier: @"FeedTableViewCell" forIndexPath: indexPath];
    
    // Configure the cell...
    FeedModel * aModel = _modelArray[indexPath.row];
    NSLog(@"aModel: %@", aModel.profileName);
    [feedCell setUIElementsWithModel:aModel];
    
    return feedCell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction) StartDownload:(UIBarButtonItem * )sender
{
    // Grand Central Dispatch (GCD) low level C API First In First Out (FIFO)
    NSLog(@"Start download...");
//    [self nonResposiveDownload];
//    [self GCDSerialQueuesDownload];
//    [self GCDConcurrentQueuePriorityHighDownload];
//    [self GCDConcurrentQueuePriorityDefaultDownload];
//    [self GCDConcurrentQueuePriorityLowDownload];
//    [self GCDConcurrentQueuePriorityBackgroundDownload];
//    [self GCDConcurrentCreateQueue];
    
    // NSOperationQueue, high level, Object Oriented concurrent queues
//    [self NSOperationQueueDownload];
//    [self NSOperationQueueDownloadWithNSBlockOperationAndCompletionBlock];
//    [self NSOperationQueueDownloadWithNSBlockOperationAndDependency];
    [self NSOperationQueueDownloadCancelWithNSBlockOperationAndDependency];
    
    
}

-(IBAction) CancelDownload:(UIBarButtonItem *)sender
{
    [_aNSOperationQueue cancelAllOperations];
}

-(void) nonResposiveDownload
{
    NSLog(@"nonResposiveDownload:..");

    int i = 0;
    
    for(NSNumber * catNumber in _profileImagesArray)
    {
        [_modelArray addObject:[[FeedModel alloc] initWithName:[NSString stringWithFormat:@"#Gato_%@",catNumber]
                                                    FeedTitle:[NSString stringWithFormat:@"Cat %@ is traveling there!",catNumber]
                                                    ProfileImageURL: [NSString stringWithFormat: @"%@%@",_catsURL,catNumber]
                                                    FeedImageURL:_feedImagesArray[i++]]];
        if(i>1)i=0;
        NSLog(@"Downloading image %@",catNumber);
//        [_modelArray addObject:aFeedModel];
    }
    
    NSLog(@"_modelArray count: %lu",(unsigned long)_modelArray.count);
    [self.tableView reloadData];
    
}

-(void) GCDSerialQueuesDownload
{
    
    NSLog(@"GCDSerialQueuesDownload:..");
    dispatch_queue_t serialQueue = dispatch_queue_create("com.dispatch.feed.serial.queue",DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    int i = 0;
    
    void (^addFeedBlock)(int,NSNumber *) = ^(int i,NSNumber *catNumber )
    {
        NSLog(@"Downloading image %@",catNumber);
        FeedModel * aFeedModel = [[FeedModel alloc] initWithName:[NSString stringWithFormat:@"#Gato_%@",catNumber]
                                                    FeedTitle:[NSString stringWithFormat:@"Cat %@ is traveling there!",catNumber]
                                                    ProfileImageURL: [NSString stringWithFormat: @"%@%@",_catsURL,catNumber]
                                                    FeedImageURL:_feedImagesArray[i]];
        dispatch_async(mainQueue,^{
            [_modelArray addObject:aFeedModel];
            NSLog(@"Image for %@, downloaded!",aFeedModel.profileName);
            NSLog(@"_modelArray count: %lu",(unsigned long)_modelArray.count);
            [self.tableView reloadData];
        });
        
    };
    
    
    for(NSNumber * catNumber in _profileImagesArray)
    {
        
        dispatch_async(serialQueue, ^{
            addFeedBlock(i,catNumber);
        });
        i++;
        if(i>_feedImagesArray.count-1)i=0;
        
    }
}

-(void) GCDConcurrentQueuePriorityHighDownload
{
    NSLog(@"GCDConcurrentQueuePriorityHighDownload:..");

    dispatch_queue_t concurrentQueuePriorityHigh = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,0);
    
    void (^addFeedBlock)(int,NSNumber *) = ^(int i,NSNumber * catNumber)
    {
        NSLog(@"Downloading image %@",catNumber);
        FeedModel * aFeedModel = [[FeedModel alloc] initWithName:[NSString stringWithFormat:@"#Gato_%@",catNumber]
                                                       FeedTitle:[NSString stringWithFormat:@"Cat %@ is traveling there!",catNumber]
                                                 ProfileImageURL: [NSString stringWithFormat: @"%@%@",_catsURL,catNumber]
                                                    FeedImageURL:_feedImagesArray[i]];
        dispatch_async(dispatch_get_main_queue(),^{
            [_modelArray addObject:aFeedModel];
            NSLog(@"Image for %@, downloaded!",aFeedModel.profileName);
            NSLog(@"_modelArray count: %lu",(unsigned long)_modelArray.count);
            [self.tableView reloadData];
        });
    };
    
    int i = 0;
    for(NSNumber * catNumber in _profileImagesArray)
    {
        dispatch_async(concurrentQueuePriorityHigh, ^{
            addFeedBlock(i,catNumber);
        });
        i++;
        if(i>_feedImagesArray.count-1)i=0;
    }
    
}

-(void) GCDConcurrentQueuePriorityDefaultDownload
{
    NSLog(@"GCDConcurrentQueuePriorityDefaultDownload:..");
    
    dispatch_queue_t concurrentQueuePriorityDefautl = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    void (^addFeedBlock)(int,NSNumber *) = ^(int i, NSNumber *catNumber)
    {
        NSLog(@"Downloading image %@",catNumber);
        FeedModel * aFeedModel = [[FeedModel alloc] initWithName:[NSString stringWithFormat:@"#Gato_%@",catNumber]
                                                       FeedTitle:[NSString stringWithFormat:@"Cat %@ is traveling there!",catNumber]
                                                 ProfileImageURL: [NSString stringWithFormat: @"%@%@",_catsURL,catNumber]
                                                    FeedImageURL:_feedImagesArray[i]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_modelArray addObject:aFeedModel];
            NSLog(@"Image for %@, downloaded!",aFeedModel.profileName);
            NSLog(@"_modelArray count: %lu", (unsigned long)_modelArray.count);
            [self.tableView reloadData];
        });
    };
    
    int i=0;
    
    for(NSNumber * catNumber in _profileImagesArray)
    {
        dispatch_async(concurrentQueuePriorityDefautl, ^{
            addFeedBlock(i,catNumber);
        });
        i++;
        if(i>_feedImagesArray.count-1)i=0;
    }
    
}

-(void) GCDConcurrentQueuePriorityLowDownload
{
    NSLog(@"GCDConcurrentQueuePriorityLowDownload:..");
    
    dispatch_queue_t concurrentQueuePriorityLow = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    
    void (^addFeedBlock)(int, NSNumber *) = ^(int i, NSNumber *catNumber)
    {
        NSLog(@"Downloading image %@",catNumber);
        FeedModel * aFeedModel = [[FeedModel alloc] initWithName:[NSString stringWithFormat:@"#Gato_%@",catNumber]
                                                       FeedTitle:[NSString stringWithFormat:@"Cat %@ is traveling there!",catNumber]
                                                 ProfileImageURL: [NSString stringWithFormat: @"%@%@",_catsURL,catNumber]
                                                    FeedImageURL:_feedImagesArray[i]];
        dispatch_async(dispatch_get_main_queue(),^{
            [_modelArray addObject:aFeedModel];
            NSLog(@"Image for %@, downloaded!",aFeedModel.profileName);
            NSLog(@"_modelArray count: %lu", (unsigned long)_modelArray.count);
            [self.tableView reloadData];
            
        });
    };
    
    int i=0;
    
    for(NSNumber * catNumber in _profileImagesArray)
    {
        dispatch_async(concurrentQueuePriorityLow, ^{
            addFeedBlock(i,catNumber);
        });
        i++;
        if(i>_feedImagesArray.count-1)i=0;
    }
}

-(void) GCDConcurrentQueuePriorityBackgroundDownload
{
    NSLog(@"GCDConcurrentQueuePriorityLowDownload:..");
    
    dispatch_queue_t concurrentQueuePriorityBackground = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND,0);
    
    void (^addFeedBlock)(int,NSNumber *) = ^(int i, NSNumber * catNumber)
    {
        NSLog(@"Downloading image %@",catNumber);
        FeedModel * aFeedModel = [[FeedModel alloc] initWithName:[NSString stringWithFormat:@"#Gato_%@",catNumber]
                                                       FeedTitle:[NSString stringWithFormat:@"Cat %@ is traveling there!",catNumber]
                                                 ProfileImageURL: [NSString stringWithFormat: @"%@%@",_catsURL,catNumber]
                                                    FeedImageURL:_feedImagesArray[i]];
        dispatch_async(dispatch_get_main_queue(),^{
            [_modelArray addObject:aFeedModel];
            NSLog(@"Image for %@, downloaded!",aFeedModel.profileName);
            NSLog(@"_modelArray count: %lu", (unsigned long)_modelArray.count);
            [self.tableView reloadData];
        });
    };
    
    int i = 0;
    
    for(NSNumber * catNumber in _profileImagesArray)
    {
        dispatch_async(concurrentQueuePriorityBackground, ^{
            addFeedBlock(i,catNumber);
        });
        i++;
        if(i>_feedImagesArray.count-1) i=0;
    }
        

}

-(void) GCDConcurrentCreateQueue
{
    NSLog(@"GCDConcurrentCreateQueue:..");
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.dispatch.feed.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
    
    void (^addFeedBlock)(int,NSNumber *) = ^(int i, NSNumber * catNumber){
        NSLog(@"Downloading image %@",catNumber);
        FeedModel * aFeedModel = [[FeedModel alloc] initWithName:[NSString stringWithFormat:@"#Gato_%@",catNumber]
                                                    FeedTitle:[NSString stringWithFormat:@"Cat %@ is traveling there!",catNumber]
                                                    ProfileImageURL: [NSString stringWithFormat: @"%@%@",_catsURL,catNumber]
                                                    FeedImageURL:_feedImagesArray[i]];
        
        dispatch_async(dispatch_get_main_queue(),^{
            [_modelArray addObject:aFeedModel];
            NSLog(@"Image for %@, downloaded!",aFeedModel.profileName);
            NSLog(@"_modelArray count: %lu", (unsigned long)_modelArray.count);
            [self.tableView reloadData];
        });
    };
    
    int i = 0;
    
    for(NSNumber * catNumber in _profileImagesArray)
    {
        dispatch_async(concurrentQueue,^{
            addFeedBlock(i,catNumber);
        });
        
        i++;
        if(i>_feedImagesArray.count-1) i=0;
    }
}

-(void)NSOperationQueueDownload//concurrent
{
    NSLog(@"NSOperationQueueDownload:..");

    NSOperationQueue * aNSOperationQueue = [[NSOperationQueue alloc] init];
    
    void (^addFeedBlock)(int, NSNumber *) = ^(int i, NSNumber *catNumber)
    {
        FeedModel * aFeedModel = [[FeedModel alloc] initWithName:[NSString stringWithFormat:@"#Gato_%@",catNumber]
                                                       FeedTitle:[NSString stringWithFormat:@"Cat %@ is traveling there!",catNumber]
                                                 ProfileImageURL: [NSString stringWithFormat: @"%@%@",_catsURL,catNumber]
                                                    FeedImageURL:_feedImagesArray[i]];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [_modelArray addObject:aFeedModel];
            NSLog(@"Image for %@, downloaded!",aFeedModel.profileName);
            NSLog(@"_modelArray count: %lu", (unsigned long)_modelArray.count);
            [self.tableView reloadData];
        }];
        
    };
    int i = 0;
    for(NSNumber * catNumber in _profileImagesArray)
    {
        
        [aNSOperationQueue addOperationWithBlock: ^{
            addFeedBlock(i, catNumber);
        }];
        i++;
        if(i>_feedImagesArray.count-1) i=0;
    }
}

-(void) NSOperationQueueDownloadWithNSBlockOperationAndCompletionBlock
{
    NSLog(@"NSOperationQueueDownloadWithNSBlockOperationAndCompletionBlock:..");
    
    NSOperationQueue * aNSOperationQueue = [[NSOperationQueue alloc] init];
    
    void (^addFeedBlock)(int,NSNumber * ) = ^(int i, NSNumber * catNumber)
    {
        FeedModel * aFeedModel = [[FeedModel alloc] initWithName:[NSString stringWithFormat:@"#Gato_%@",catNumber]
                                                       FeedTitle:[NSString stringWithFormat:@"Cat %@ is traveling there!",catNumber]
                                                 ProfileImageURL: [NSString stringWithFormat: @"%@%@",_catsURL,catNumber]
                                                    FeedImageURL:_feedImagesArray[i]];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock: ^{
            [_modelArray addObject:aFeedModel];
            NSLog(@"Image for %@, downloaded!",aFeedModel.profileName);

        }];
    };
    
    int i = 0;
    
    for(NSNumber * catNumber in _profileImagesArray)
    {
        
        NSBlockOperation * aNSBlockOperation = [NSBlockOperation blockOperationWithBlock:^{ addFeedBlock(i, catNumber);}];
        
        [aNSBlockOperation setCompletionBlock:^{
            NSLog(@"_modelArray count: %lu", (unsigned long)_modelArray.count);
            [self.tableView reloadData];
        }];
        
        [aNSOperationQueue addOperation:aNSBlockOperation];
        
        i++;
        if(i>_feedImagesArray.count-1) i=0;
        
    }
}

-(void) NSOperationQueueDownloadWithNSBlockOperationAndDependency//Emulated Serial Queue
{
    NSLog(@"NSOperationQueueDownloadWithNSBlockOperationAndDependency:..");
    
    NSOperationQueue * aNSOperationQueue = [[NSOperationQueue alloc] init];
    
    void (^addFeedModel)(int,NSNumber * ) = ^(int i, NSNumber * catNumber)
    {
        FeedModel * aFeedModel = [[FeedModel alloc] initWithName:[NSString stringWithFormat:@"#Gato_%@",catNumber]
                                                       FeedTitle:[NSString stringWithFormat:@"Cat %@ is traveling there!",catNumber]
                                                 ProfileImageURL: [NSString stringWithFormat: @"%@%@",_catsURL,catNumber]
                                                    FeedImageURL:_feedImagesArray[i]];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock: ^{
            [_modelArray addObject:aFeedModel];
            NSLog(@"Image for %@, downloaded!",aFeedModel.profileName);
            
        }];
    };
    
    int i = 0;
    
    NSMutableArray<NSOperation*> * aNSOperationArray = [[NSMutableArray alloc] init];
    
    for(NSNumber * catNumber in _profileImagesArray)
    {
        NSBlockOperation * aNSBlockOperation = [NSBlockOperation blockOperationWithBlock: ^{addFeedModel(i,catNumber);}];
        
        [aNSBlockOperation setCompletionBlock: ^{
            NSLog(@"_modelArray count: %lu", (unsigned long)_modelArray.count);
            [self.tableView reloadData];
        }];
        
        [aNSOperationArray addObject:aNSBlockOperation];
        i++;
        if(i>_feedImagesArray.count-1) i=0;
    }
    
    NSEnumerator * anEnumerator = [aNSOperationArray objectEnumerator];
    
    id anObject = nil;
    id previousObject = nil;
    
    while((anObject = [anEnumerator nextObject]))
    {
        if(previousObject)
        {
            [anObject addDependency:previousObject];
        }
    }
    
    [aNSOperationQueue addOperations: aNSOperationArray waitUntilFinished:NO];
    
}


-(void) NSOperationQueueDownloadCancelWithNSBlockOperationAndDependency
{
    NSLog(@"NSOperationQueueDownloadCancelWithNSBlockOperationAndDependency:..");
    
//    NSOperationQueue * aNSOperationQueue = [[NSOperationQueue alloc] init];
    _aNSOperationQueue = [[NSOperationQueue alloc] init];

    void (^addFeedBlock)(int,NSNumber *) = ^(int i,NSNumber * catNumber)
    {
        FeedModel * aFeedModel = [[FeedModel alloc] initWithName:[NSString stringWithFormat:@"#Gato_%@",catNumber]
                                                       FeedTitle:[NSString stringWithFormat:@"Cat %@ is traveling there!",catNumber]
                                                 ProfileImageURL: [NSString stringWithFormat: @"%@%@",_catsURL,catNumber]
                                                    FeedImageURL:_feedImagesArray[i]];
        [[NSOperationQueue mainQueue] addOperationWithBlock: ^{
            [_modelArray addObject:aFeedModel];
            NSLog(@"Image for %@, downloaded!",aFeedModel.profileName);
        }];
    };
    
    int i = 0;
    NSMutableArray * operationsArray = [[NSMutableArray alloc] init];
    
    for(NSNumber * catNumber in _profileImagesArray)
    {
        NSBlockOperation * aNSBlockOperation = [NSBlockOperation blockOperationWithBlock:^{ addFeedBlock(i,catNumber);}];
        [aNSBlockOperation setCompletionBlock:^{
            if([aNSBlockOperation isCancelled] == YES)
            {
                NSLog(@"--> cat %@ operation is cancelled! :(",catNumber);
            }
            else
            {
                NSLog(@"_modelArray count: %lu", (unsigned long)_modelArray.count);
                [self.tableView reloadData];
            }
        }];
        
        [operationsArray addObject:aNSBlockOperation];
        [_aNSOperationQueue addOperation:aNSBlockOperation];
        
        i++;
        if(i>_feedImagesArray.count-1) i=0;
    }
    
    NSEnumerator * aNSEnumarator = [operationsArray objectEnumerator];
    id anObject = nil;
    id previusObject = nil;
    
    while((anObject = [aNSEnumarator nextObject]))
    {
        if(previusObject)
        {
            [anObject addDependency:previusObject];
        }
    }
}

@end
