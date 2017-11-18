//
//  MainUIViewController.m
//  App_2
//
//  Created by Pedro Trujillo on 11/17/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//
//* [ ] Set the TimeCircuitsViewController class as implementing the delegate for the date picker.
//* [ ] Set the DatePickerViewController object's delegate as the TimeCircuitsViewController object in the prepareForSegue method.
//* [ ] Call the delegate method to inform the delegate of the new date chosen by the user somewhere in the DatePickerViewController.
//* [ ] Set the destinationTimeLabel with the date received from the picker view controller using the date formatter object in the destinationDateWasChosen method.
//* [ ] Call the method to start the timer in the IBAction that is called when the travel back button is tapped.
//* [ ] In the start timer method, instantiate the timer object for a 0.1 sec time interval. Set it to fire the method that updates the speed label.
//* [ ] In the stop timer method, stop the timer (there is a method you can call to do this, and it may not be called _stop_) and then set it to nil.
//* In the update speed method:
//* [ ] Check if the current speed variable has reached 88. If we have NOT:
//* [ ] Increment the current speed variable by 1.
//* [ ] Update the speed label with the current speed.
//* [ ] Once the speed has reached at least 88, stop the timer.
//* [ ] Update the value of the lastTimeDepartedLabel with the value from the presentTimeLabel.
//* [ ] Update the value of the presentTimeLabel with the value from the destinationTimeLabel.
//* [ ] Reset the value of the current speed variable to 0.


#import "MainUIViewController.h"

@interface MainUIViewController ()

@end

@implementation MainUIViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _destinationTimeUILabel.text = @"--- --, ----";
    _presentTImeUILabel.text = @"--- --, ----";
    _lastTimeDepartedUILabel.text = @"--- --, ----";
    
    self.title = @"OutaTime";
    
    
    _aNSDateFormater = [[NSDateFormatter alloc]init];
    _aNSDateFormater.timeStyle= NSDateFormatterNoStyle;
    _aNSDateFormater.dateStyle = NSDateFormatterMediumStyle;
    
    _currentDate = [[NSDate alloc]init];
    
    _aNSDateFormater.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    
    _presentTImeUILabel.text = [_aNSDateFormater stringFromDate:_currentDate];
    
    _currentSpeed = 0;
    
    _speedUILabel.text = [NSString stringWithFormat:@"%i MPH",(int)_currentSpeed];
    _
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
