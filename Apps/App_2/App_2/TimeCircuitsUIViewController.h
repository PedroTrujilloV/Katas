//
//  TimeCircuitsUIViewController.h
//  App_2
//
//  Created by Pedro Trujillo on 11/18/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Protocols.h"

@interface TimeCircuitsUIViewController : UIViewController

#pragma IBOutlets
@property (nonatomic,weak) IBOutlet UIDatePicker * dateUIDatePicker;

@property NSDateFormatter * timeNSDateFormater;

@property NSString * datePickerString;

@property (nonatomic, weak) NSObject<TimeCircuitsProtocolDelegate>* delegateDataSource; //declare delegate

@end
