//
//  StoryCell.m
//  RoposoTest
//
//  Created by Okutech on 2/6/16.
//
//

#import "StoryCell.h"
#import "Feed.h"
#import "ImageCacheVC.h"
#import "UIImageView+WebCache.h"

@interface StoryCell()
{
    
}
@property (strong, nonatomic) Feed *feedObj;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLbl;
@property (weak, nonatomic) IBOutlet UIImageView *imageVieww;
@property (weak,nonatomic)  IBOutlet UILabel *userNameLbl;
@end

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


-(void)displayCellData:(id)data
{
    
    
    self.feedObj = (Feed *)data;
    _titleLbl.text =self.feedObj.title;
    _descriptionLbl.text = self.feedObj.short_description;
    
    NSString *imagePath=[NSString stringWithFormat:@"%@",self.feedObj.si];
    [self getImagee:imagePath name:[self.feedObj.userName capitalizedString] profileImage:self.imageVieww];
    _userNameLbl =[[NSUserDefaults standardUserDefaults] valueForKey:@"username"];
    
    
    
}




-(void) getImagee:(NSString*)imagePath name:(NSString*)name profileImage:(UIImageView *)profileImage
{
    [profileImage sd_setImageWithURL:[NSURL URLWithString:imagePath]
                    placeholderImage:[ImageCacheVC imageForUser:name WithBG:[ImageCacheVC randomColor]]
                           completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                               if (image) {
                                   profileImage.image=image;
                               }
                           }];
    
}
@end
