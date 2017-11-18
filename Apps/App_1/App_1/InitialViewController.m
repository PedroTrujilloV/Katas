//
//  InitialViewController.m
//  App_1
//
//  Created by CrunchyUser on 11/17/17.
//  Copyright © 2017 CrunchyUser. All rights reserved.
//

#import "InitialViewController.h"

@interface InitialViewController ()

@end

@implementation InitialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _nameUITextField.text = @"";
    _aUITextField.text = @"";
    _aUILabel.text = @"";
    _aUITextView.text = @"Please sing in to get the gif!, Por favor ingrese para recibir el regalo!";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)  textFieldShouldReturn:(UITextField *)textField
{
    
    return [self logIn:_nameUITextField.text];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Action Handlers

-(IBAction)authenticateAgent:(id)sender
{
    // This will cause the keyboard to dismiss when the authenticate button is tapped
    
    NSString * nameString = _nameUITextField.text;
    
    if([_nameUITextField isFirstResponder])//name text field property identifier goes here.isFirstResponder
    {
        [_nameUITextField resignFirstResponder];//name text field property identifier goes here.resignFirstResponder
        [self logIn:nameString];

    }
    if([_aUITextField isFirstResponder])
    {
        [_aUITextField resignFirstResponder];//name text field property identifier goes here.isFirstResponder
        [self logIn:nameString];//name text field property identifier goes here.resignFirstResponder

        
    }

}


#pragma mark - Functions

- (BOOL) logIn: (NSString*) greetingName
{
    
    if(![_nameUITextField.text  isEqual: @""] && ![_aUITextField.text  isEqual: @""])
    {
        NSString * nameString = [_nameUITextField text];
        
        //split string by " "
        NSArray * greetingArray = [nameString componentsSeparatedByString:@" "];
        // geting agent name in splited array[1]
        NSString * agentName =  [greetingArray objectAtIndex:1];
        // concatenate agent name with "Good evening, Agent"
        _aUILabel.text  = [NSMutableString stringWithFormat:@"Good evening, Agent %@", agentName];
        _aUITextView.text = [NSString stringWithFormat:@"This mission will be and arduous one, fraught with peril. You will cover much strange and unfamiliar territory. Should you choose to accept this mission, Agent %@, you will certainly be disavowed, but you will be doing your country a great service. This message will self destruct in 5 seconds.", agentName];
        
//        
//        view.backgroundColor = UIColor(red: 0.585, green: 0.78, blue: 0.188, alpha: 1.0)
//        
        return true;
    }
    
//    view.backgroundColor = UIColor(red: 0.78, green: 0.188, blue: 0.188, alpha: 1.0)
    
    _aUITextView.text = @"Please sing in to get the gif!, Por favor ingrese para recibir el regalo!";
    
    
    return false;
}

@end
