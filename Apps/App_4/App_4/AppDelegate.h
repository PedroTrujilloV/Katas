//
//  AppDelegate.h
//  App_4
//
//  Created by Pedro Trujillo on 11/20/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

