//
//  HeroUITaTableViewController.h
//  App_3
//
//  Created by Pedro Trujillo on 11/19/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Hero.h"
#import "HeroDetailUIViewController.h"

@interface HeroUITaTableViewController : UITableViewController

@property  NSArray<Hero *> * heroModel;

-(void) loadHeroesFromJSONFile;
-(BOOL) sortArrayLexicografically:(Hero *)H1 and:(Hero*)H2;


@end
