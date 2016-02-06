//
//  ViewController.m
//  RoposoTest
//
//  Created by Varsha on 2/6/16.
//
//

#import "ViewController.h"
#import "Feed.h"
#import "AuthorCell.h"
#import "StoryCell.h"


@interface ViewController ()
{
    NSMutableArray *feedsMutableArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger rowsCount = [self feedsCount];
    return rowsCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Feed *feed = [self feedAtIndex:indexPath.section];
    if (feed.feedType == HEADER) {
        
        StoryCell *cell = (StoryCell *)[self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
        
        if (!cell)
        {
            cell = [StoryCell storyCell];
        }
        
        [self configureStoryCell:cell forRowAtIndexPath:indexPath];
        return cell;
        
    }
    
    AuthorCell *authorCell = (AuthorCell *)[self.tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    
    if (!authorCell)
    {
        authorCell = [AuthorCell headerCell];
    }
    [self configureAuthorCell:authorCell forRowAtIndexPath:indexPath];
    
    return authorCell;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *) indexPath
//{
//    
//    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1)
//    {
//        Feed *feed = [self feedAtIndex:indexPath.section];
//        
//         if (feed.feedType == HEADER)
//        {
//            CGFloat height = [self calculateHeight:feed];
//            return height;
//        }
//        else if (feed.feedType == STORY)
//        {
//            CGFloat height = [self calculateCustomFeedHeight:feed];
//            return height;
//        }
//    }
//    
//    return UITableViewAutomaticDimension;
//}



#pragma  mark - Local data modal

-(NSInteger)feedsCount {
    return feedsMutableArray.count;
}


-(Feed *)feedAtIndex:(NSInteger)index
{
    return [feedsMutableArray objectAtIndex:index];
}

- (void)configureAuthorCell:(AuthorCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell displayCellData:[self feedAtIndex:indexPath.section]];
    
}

- (void)configureStoryCell:(StoryCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell displayCellData:[self feedAtIndex:indexPath.section]];
   
}



@end
