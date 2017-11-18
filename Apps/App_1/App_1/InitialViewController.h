//
//  InitialViewController.h
//  App_1
//
//  Created by CrunchyUser on 11/17/17.
//  Copyright © 2017 CrunchyUser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InitialViewController : UIViewController<UITextFieldDelegate>

    @property (nonatomic, weak) IBOutlet UITextField * nameUITextField;
    @property (nonatomic, weak) IBOutlet UITextField * aUITextField;
    @property (nonatomic,weak) IBOutlet UIButton * aUIButton;
    @property (nonatomic,weak) IBOutlet UILabel * aUILabel;
    @property (nonatomic, weak) IBOutlet UITextView * aUITextView;

@end
