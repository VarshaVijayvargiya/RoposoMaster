//
//  StoryCell.m
//  RoposoTest
//
//  Created by Okutech on 2/6/16.
//
//

#import "StoryCell.h"

@implementation StoryCell


+(instancetype)storyCell
{
    // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
    id cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    
    if (cell) {
        return cell;
    }
    return nil;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
