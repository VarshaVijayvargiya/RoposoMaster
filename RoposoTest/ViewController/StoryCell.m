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
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) Feed *feedObj;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLbl;
@property (weak, nonatomic) IBOutlet UIImageView *imageVieww,*userProfileImagView;
@property (weak,nonatomic)  IBOutlet UILabel *userNameLbl;
@property (weak,nonatomic)  IBOutlet UIButton *followBtn;
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
    
    self.containerView.layer.cornerRadius = 5.0f;
    self.containerView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.containerView.layer.shadowOpacity = 0.4;
    self.containerView.layer.shadowRadius = 1;
    self.containerView.layer.shadowOffset = CGSizeMake(1.2, 1.2);
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
    [self getImagee:imagePath name:[[NSUserDefaults standardUserDefaults] valueForKey:@"userName"] profileImage:self.imageVieww];
    _userNameLbl.text =[[NSUserDefaults standardUserDefaults] valueForKey:@"userName"];
    
    [self getImagee:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"Image"]] name:[[NSUserDefaults standardUserDefaults] valueForKey:@"userName"] profileImage:self.userProfileImagView];
    
    
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"is_following"]isEqualToString:@"0"]) {
        
        [self.followBtn setBackgroundColor:[UIColor lightGrayColor]];
    }
    else
    {
        
        [self.followBtn setBackgroundColor:[UIColor greenColor]];
    }
    
    
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



-(IBAction)followBtnAction:(id)sender
{
    
    if ([_delegate respondsToSelector:@selector(storyFollowBtnTappedAction:)])
    {
        [_delegate storyFollowBtnTappedAction:sender];
    }
    
}

@end
