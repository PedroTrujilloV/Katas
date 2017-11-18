//
//  TimeCircuitsUIViewController.h
//  App_2
//
//  Created by Pedro Trujillo on 11/18/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface TimeCircuitsUIViewController : UIViewController

#pragma IBOutlets
@property (nonatomic,weak) IBOutlet UIDatePicker * timeUIDatePicker;

@property NSDateFormatter * timeNSDateFormater;

@property NSString * datePickerString;

//@property (weak) TimeCircuitDelegate * delegate;

@end
