//
//  AuthorCell.h
//  RoposoTest
//
//  Created by Varsha on 2/6/16.
//
//

#import <UIKit/UIKit.h>

@protocol AuthorCellDelegate <NSObject>

-(void)authorFollowBtnTappedAction:(id)sender;

@optional

@end
@interface AuthorCell : UITableViewCell


@property (nonatomic, weak) id<AuthorCellDelegate> delegate;

+(instancetype)headerCell;
-(void)displayCellData:(id)data;
@end
