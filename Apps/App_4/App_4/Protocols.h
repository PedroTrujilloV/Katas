//
//  Protocols.h
//  App_2
//
//  Created by Pedro Trujillo on 11/18/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

//#ifndef Protocols_h
//#define Protocols_h
//
//
//#endif /* Protocols_h */

#import <UIKit/UIKit.h>

@protocol TimeCircuitsProtocolDelegate <NSObject>

    -(void) dateWasPicked:(NSDate*)datePickerString;

@end
