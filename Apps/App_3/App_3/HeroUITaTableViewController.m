//
//  HeroUITaTableViewController.m
//  App_3
//
//  Created by Pedro Trujillo on 11/19/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//
// [1] soleve the problem whit selectors:https://stackoverflow.com/questions/297680/creating-a-selector-from-a-method-name-with-parameters
#import "HeroUITaTableViewController.h"

@interface HeroUITaTableViewController ()

@end

@implementation HeroUITaTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"S.H.I.E.L.D. Hero Trakcer";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self loadHeroesFromJSONFile];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Get Model

-(void) loadHeroesFromJSONFile
{
    
    @try
    {
        NSBundle * mainBundle = [NSBundle mainBundle];
        
        NSString * pathDictionary;
        
        if((pathDictionary = [mainBundle pathForResource:@"heroes" ofType:@"json"]))
        {
            NSData * heroData = [NSData dataWithContentsOfFile:pathDictionary];
            
            NSError * error = nil;
            NSMutableArray<Hero *> * aHeroArray = [[NSMutableArray alloc]init];
            NSArray * heroArray = [NSJSONSerialization JSONObjectWithData:heroData options:NSJSONReadingMutableContainers error:&error];
            
            NSLog(@"heroArray: %@", heroArray);
            if(heroArray)
            {
                
                for(NSDictionary * heroObject in heroArray)
                {
                    Hero * aNewHero = [[Hero alloc]initWithDictionary:heroObject];
                    [aHeroArray addObject:aNewHero];
                }
                _heroModel = [NSArray arrayWithArray:aHeroArray];

//                _heroModel = [heroArray sortedArrayUsingSelector:@selector(sortArrayLexicografically:and:)];//[1]
            }
            else
            {
                NSLog(@"Error in JSON serialization for arrray: %@",error);
            }
            
            
        }
    } @catch (NSException *exception) {
        NSLog(@" - reason: %@",exception.reason);
    } @finally
    {
        
    }
}

-(BOOL) sortArrayLexicografically:(Hero *)H1 and:(Hero*)H2
{
    return H1.name <H2.name;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete implementation, return the number of rows
    return [_heroModel count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"aReuseTableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSUInteger i = [indexPath row];
    Hero * aHero = [_heroModel objectAtIndex:i];
    
    cell.textLabel.text = aHero.name;
    cell.detailTextLabel.text = aHero.homeWorld;
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    Hero * selectedHero = _heroModel[indexPath.row];
    HeroDetailUIViewController * detailVC = [[self storyboard] instantiateViewControllerWithIdentifier:@"HeroDetailUIViewController"];
    
    detailVC.aHero = selectedHero;
    [[self navigationController] pushViewController:detailVC animated:true];
    
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

@end
