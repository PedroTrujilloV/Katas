//
//  HeroDetailUIViewController.m
//  App_3
//
//  Created by Pedro Trujillo on 11/19/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

#import "HeroDetailUIViewController.h"

@interface HeroDetailUIViewController ()

@end

@implementation HeroDetailUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = [_aHero name];
    
    _heroUIImageView.image = [UIImage imageNamed:_aHero.imagePath];
    _nameUILabel.text = [_aHero name];
    _homeworldUILabel.text = [_aHero homeWorld];
    _porwerUILabel.text = [_aHero powers];
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
