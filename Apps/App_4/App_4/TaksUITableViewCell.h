//
//  TaksUITableViewCell.h
//  App_4
//
//  Created by Pedro Trujillo on 11/21/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaksUITableViewCell : UITableViewCell<UITextFieldDelegate>

@property (nonatomic,weak) IBOutlet UITextField * taskDescriptionUITextField;
@property (nonatomic,weak) IBOutlet UISwitch * statusUISwitch;
@property (nonatomic,weak) IBOutlet UILabel * dateUILabel;

@end
