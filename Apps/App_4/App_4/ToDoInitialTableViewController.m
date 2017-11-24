//
//  ToDoInitialTableViewController.m
//  App_4
//
//  Created by Pedro Trujillo on 11/20/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//


#import "ToDoInitialTableViewController.h"

@interface ToDoInitialTableViewController ()

@end

@implementation ToDoInitialTableViewController


#pragma mark - Core Data:

#pragma mark - CD Managed Object Context:

-  ( NSManagedObjectContext * )managedObjectContext
{
    NSManagedObjectContext * moc = nil;
    
    id appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if([appDelegate performSelector:@selector(managedObjectContext)])
    {
        moc = [appDelegate managedObjectContext];
    }
    
    return moc;
}

#pragma mark - CD Fetching:

- (void) fetchRequest
{
//    NSArray<TaskModel *> * result = nil;
    NSManagedObjectContext * context = [self managedObjectContext];
    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName:@"TaskModel"];
    NSError * error = nil;
    if(!(_taksList = (NSArray<TaskModel *> *)[context executeFetchRequest:request error:&error]))
    {
        NSLog(@"Error fetching TaskModel entity: %@", [error localizedDescription]);
        abort();
    }
    
    
}


//#pragma mark - CD Save:
//-(void)addTaskWithStatus:(BOOL)taskStatus Description:(NSString *)taskDescription andDate:(NSDate *)taskDate
//{
//    NSManagedObjectContext * context = [self managedObjectContext];
//    NSManagedObject * moTaks = [NSEntityDescription insertNewObjectForEntityForName:@"TaskModel" inManagedObjectContext: context];
//    [moTaks setValue:taskDate forKey:@"taskDate"];
//    [moTaks setValue:taskDescription forKey:@"taskDescription"];
//    [moTaks setValue:taskStatus forKey:@"taskStatus"];
//    [self saveContext];
//}

#pragma mark - CD Save:
- (void) saveContext
{
    NSError * error = nil;
    if([[self managedObjectContext] save:&error] == NO)
    {
        NSAssert(NO, @"Error saving context: %@", [error localizedDescription]);
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
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
    return _taksList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    TaksUITableViewCell * cell = (TaksUITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TaksUITableViewCell" forIndexPath:indexPath];
    
    
    cell.taskDescriptionUITextField.text = @"";
   
    TaskModel * aTask = [[self taksList] objectAtIndex:indexPath.row];
    
    if(aTask.taskDescription == nil || [aTask.taskDescription  isEqual: @""])
    {
        cell.statusUISwitch.enabled = false;
        cell.statusUISwitch.on = false;
        [cell.taskDescriptionUITextField becomeFirstResponder];
    }
    else
    {
        cell.statusUISwitch.enabled = true;
        cell.statusUISwitch.on = aTask.taskStatus;
        
        cell.taskDescriptionUITextField.text = aTask.taskDescription;
        
    }
    
    return cell;
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier]  isEqual: @"ShowTimeCircuitsSegue"])
    {
        TimeCircuitsUIViewController * datePickerVC = (TimeCircuitsUIViewController *)[segue destinationViewController];
        datePickerVC.delegateDataSource = self;
    }
}


#pragma mark - IBActions 

-(IBAction)addTaskAction:(UIBarButtonItem * )sender
{
    TaskModel * aTask = [NSEntityDescription insertNewObjectForEntityForName:@"TaskModel" inManagedObjectContext: [self managedObjectContext]];
    NSMutableArray<TaskModel *> * copyArray = [_taksList mutableCopy];
    [copyArray addObject:aTask];
    
    _taksList = copyArray;
    _editingTask = aTask;
    [[self tableView] reloadData];
    
}

-(IBAction)changeTaskStatus:(UISwitch * )sender
{
    
}



#pragma Protocol - methods

-(void) dateWasPicked:(NSDate *)datePickerString
{
    NSLog(@"#####--- dateWasPicked: %@",datePickerString);
    _editingTask.taskDate = datePickerString;
}

#pragma mark - UITextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return false;
}


@end
