//
//  ViewController.h
//  RoposoTest
//
//  Created by Varsha on 2/6/16.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,retain) IBOutlet UITableView *tableView;


@end
