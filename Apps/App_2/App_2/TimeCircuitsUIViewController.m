//
//  TimeCircuitsUIViewController.m
//  App_2
//
//  Created by Pedro Trujillo on 11/18/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

#import "TimeCircuitsUIViewController.h"

@interface TimeCircuitsUIViewController ()

@end

@implementation TimeCircuitsUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _datePickerString = @"";
    
    _timeNSDateFormater = [[NSDateFormatter alloc]init];
    
    _timeNSDateFormater.dateStyle = NSDateFormatterMediumStyle;
    _timeNSDateFormater.timeStyle =  NSDateFormatterNoStyle;
    
    _datePickerString = [_timeNSDateFormater stringFromDate:_timeUIDatePicker.date];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma IBActions:

-(IBAction)datePickerChanged:(id)UIDatePicker
{
    _datePickerString = [_timeNSDateFormater stringFromDate:_timeUIDatePicker.date];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
