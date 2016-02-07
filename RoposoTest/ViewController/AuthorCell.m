//
//  AuthorCell.m
//  RoposoTest
//
//  Created by Varsha on 2/6/16.
//
//

#import "AuthorCell.h"
#import "Feed.h"
#import "ImageCacheVC.h"
#import "UIImageView+WebCache.h"
#import "HexColor.h"

@interface AuthorCell()
{
    
}
@property (strong, nonatomic) Feed *feedObj;
@property (weak, nonatomic) IBOutlet UILabel *userNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *aboutUserLbl;
@property (weak,nonatomic)  IBOutlet UILabel *handleLbl;
@property (weak, nonatomic) IBOutlet UIImageView *userProfileImageView;
@property (weak,nonatomic)  IBOutlet UILabel *followingCountLbl, *followerCountLbl;
@property (weak,nonatomic) IBOutlet UIButton *followBtn;


@end
@implementation AuthorCell

+(instancetype)headerCell
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
    [[NSUserDefaults standardUserDefaults]setObject:self.feedObj.userName  forKey:@"userName"];
    [[NSUserDefaults standardUserDefaults]setObject:self.feedObj.image  forKey:@"Image"];
    NSString *imagePath=[NSString stringWithFormat:@"%@",self.feedObj.image];
    [self getImagee:imagePath name:[self.feedObj.userName capitalizedString] profileImage:self.userProfileImageView];
    
    self.userNameLbl.text = self.feedObj.userName;
    self.aboutUserLbl.text = self.feedObj.short_description;
    self.followerCountLbl.text =self.feedObj.followers;
    self.followingCountLbl.text =self.feedObj.following;
    self.handleLbl.text = self.feedObj.handle;
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"is_following"]==nil) {
        NSString *is_following = [NSString stringWithFormat:@"%@",self.feedObj.is_following];
        [[NSUserDefaults standardUserDefaults]setObject:is_following forKey:@"is_following"];
    }
   
    
    
    if([[[NSUserDefaults standardUserDefaults] valueForKey:@"is_following"]isEqualToString:@"0"]){
        [self.followBtn setBackgroundColor:[UIColor lightGrayColor]];
         [self.followBtn setTitle:@"Follow" forState:UIControlStateNormal];
        
    }
    else{
        
        [self.followBtn setBackgroundColor:[HexColor setbuttonColor]];
        [self.followBtn setTitle:@"Following" forState:UIControlStateNormal];
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
    
    if ([_delegate respondsToSelector:@selector(authorFollowBtnTappedAction:)])
    {
        [_delegate authorFollowBtnTappedAction:sender];
    }
    
}


@end
