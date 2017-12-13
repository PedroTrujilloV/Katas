//
//  FeedTableViewCell.m
//  App_5
//
//  Created by Pedro Trujillo on 12/10/17.
//  Copyright © 2017 Pedro Trujillo. All rights reserved.
//

#import "FeedTableViewCell.h"

@implementation FeedTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    _profileName.text = @"Cat";
    _feedTitle.text = @"Nothing to show..";
    _profilePhoto.image = [UIImage imageNamed:@"cat_icon.png"];
    _feedImage.image = [UIImage imageNamed:@"cat_icon.png"];
    
    
}

- (void) setUIElementsWithModel:(FeedModel * )aModel
{
    _profileName.text = [aModel profileName];
    _feedTitle.text = [aModel feedTitle];
//    UIImage * aProfileImage = [[UIImage alloc] initWithData:[aModel profileImageData]];
//    UIImage * aFeedImage = [[UIImage alloc] initWithData:[aModel feedImageData]];
    _profilePhoto.image = [UIImage imageWithData:[aModel profileImageData]];
    _feedImage.image = [UIImage imageWithData:[aModel feedImageData]];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
