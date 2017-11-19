//
//  MainUIViewController.m
//  App_2
//
//  Created by Pedro Trujillo on 11/17/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//



#import "MainUIViewController.h"

@interface MainUIViewController ()// for private methods/properties, declare them here first.
    -(void)startTimer;
    -(void)stopTimer;
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
    
    _speedUILabel.text = [NSString stringWithFormat:@"%i MPH",_currentSpeed];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Setter - methods

-(void) setCurrentSpeedInUI
{
    if(_currentSpeed <= 87)
    {
        _currentSpeed += 1;
        _speedUILabel.text = [NSString stringWithFormat:@"%i MPH",_currentSpeed];
    }
    else
    {
        [self stopTimer];
        _lastTimeDepartedUILabel.text = _presentTImeUILabel.text;
        _presentTImeUILabel.text = _destinationTimeUILabel.text;
        _currentSpeed = 0;
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:@"ShowTimeCircuitsSegue"])
    {
        TimeCircuitsUIViewController * datePickerVC = (TimeCircuitsUIViewController*)[segue destinationViewController];
        datePickerVC.delegateDataSource = self;
    }
}


#pragma Protocol - methods

-(void) dateWasPicked:(NSString *)datePickerString
{
    NSLog(@"#####--- dateWasPicked: %@",datePickerString);
    
    _destinationTimeUILabel.text = datePickerString;
    _lastTimeDepartedUILabel.text = _lastTimeDeparture;
    _lastTimeDeparture = datePickerString;
    
}

#pragma IBActions

-(IBAction)travelBackAction:(UIButton*)sender
{
    NSLog(@"#####--- travelBackAction!");
    [self startTimer];
}

#pragma Private - methods

-(void)startTimer
{
    _timerBack = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(setCurrentSpeedInUI) userInfo:nil repeats:true];
}

-(void)stopTimer
{
    [_timerBack invalidate];
    _timerBack = nil;
}


@end
