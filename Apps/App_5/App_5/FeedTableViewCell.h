//
//  FeedTableViewCell.h
//  App_5
//
//  Created by Pedro Trujillo on 12/10/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedModel.h"

@interface FeedTableViewCell : UITableViewCell

    @property (nonatomic,weak) IBOutlet UIImageView * feedImage;
    @property (nonatomic,weak) IBOutlet UILabel * feedTitle;
    @property (nonatomic,weak) IBOutlet UILabel * profileName;
    @property (nonatomic,weak) IBOutlet UIImageView * profilePhoto;


- (void) setUIElementsWithModel:(FeedModel * )aModel;


@end
