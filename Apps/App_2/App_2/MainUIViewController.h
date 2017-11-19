//
//  MainUIViewController.h
//  App_2
//
//  Created by Pedro Trujillo on 11/17/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeCircuitsUIViewController.h"
//#import "Protocols.h"


@interface MainUIViewController : UIViewController  <TimeCircuitsProtocolDelegate>

#pragma Variables:
    @property (nonatomic,weak) IBOutlet UILabel * destinationTimeUILabel;
    @property (nonatomic,weak) IBOutlet UILabel * presentTImeUILabel;
    @property (nonatomic,weak) IBOutlet UILabel * lastTimeDepartedUILabel;
    @property (nonatomic,weak) IBOutlet UILabel * speedUILabel;
    @property (nonatomic,weak) IBOutlet UIButton * setDestinationTimeUIButton;
    @property (nonatomic,weak) IBOutlet UIButton * travelBackUIButton;

    @property NSDateFormatter * aNSDateFormater;
    @property NSDate * currentDate;
    @property int * currentSpeed;
    @property NSString * lastTimeDeparture;
    @property NSTimer * timerBack;


@end
