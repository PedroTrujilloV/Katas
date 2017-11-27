//
//  HeroDetailUIViewController.h
//  App_3
//
//  Created by Pedro Trujillo on 11/19/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hero.h"

@interface HeroDetailUIViewController : UIViewController<UITextViewDelegate>

@property(nonatomic, weak) IBOutlet UIImageView * heroUIImageView;
@property(nonatomic,weak) IBOutlet UILabel * nameUILabel;
@property(nonatomic,weak) IBOutlet UILabel * homeworldUILabel;
@property(nonatomic , weak) IBOutlet UITextView * porwersUITextView;

@property Hero * aHero;
-(NSArray*)getCommonSuperViews:(UIView *)viewA and:(UIView * )viewB;
-(NSArray*)getSuperViews:(UIView *)aView;

@end
