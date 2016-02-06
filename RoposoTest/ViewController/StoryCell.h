//
//  StoryCell.h
//  RoposoTest
//
//  Created by Varsha on 2/6/16.
//
//

#import <UIKit/UIKit.h>
@protocol StoryCellDelegate <NSObject>

-(void)storyFollowBtnTappedAction:(id)sender;

@optional

@end
@interface StoryCell : UITableViewCell
@property (nonatomic, weak) id<StoryCellDelegate> delegate;




+(instancetype)storyCell;

-(void)displayCellData:(id)data;
@end
