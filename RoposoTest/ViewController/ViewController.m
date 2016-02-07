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
#import "HexColor.h"


@interface ViewController ()<AuthorCellDelegate,StoryCellDelegate>
{
    NSMutableArray *feedsMutableArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.estimatedRowHeight = 500;

    [self getDataFromJson];
    
    
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
    if (feed.feedType == STORY) {
        
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *) indexPath
{
    
    return UITableViewAutomaticDimension;
}
#pragma  mark - Local data modal

-(NSInteger)feedsCount {
    return feedsMutableArray.count;
}


-(Feed *)feedAtIndex:(NSInteger)index
{
    return [feedsMutableArray objectAtIndex:index];
}

-(void)addFeeds:(NSArray *)array
{
    if (!feedsMutableArray) {
        feedsMutableArray = [NSMutableArray array];
    }
    
    for (NSDictionary *obj in array) {
        Feed *feed = [Feed createFeedWithData:obj];
        [feedsMutableArray addObject:feed];
    }
    
}


- (void)configureAuthorCell:(AuthorCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.delegate =self;
    [cell displayCellData:[self feedAtIndex:indexPath.section]];
    
}

- (void)configureStoryCell:(StoryCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.delegate =self;
    [cell displayCellData:[self feedAtIndex:indexPath.section]];
   
}



-(void)getDataFromJson
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"json"];
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:nil];
    [self addFeeds:[NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableContainers error:nil]];
}



#pragma mark - delegate method for Follow Button

-(void)authorFollowBtnTappedAction:(id)sender
{
       [self setValyeForFollowBtn:sender];

}


-(void)storyFollowBtnTappedAction:(id)sender
{
    [self setValyeForFollowBtn:sender];

}


-(void)setValyeForFollowBtn:(id)sender
{
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"is_following"]isEqualToString:@"0"]) {
        
        [sender setBackgroundColor:[HexColor setbuttonColor]];
        [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"is_following"];
    }
    else
    {
        [sender setBackgroundColor:[UIColor lightGrayColor]];
        [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:@"is_following"];
        
        
    }
    
    [self.tableView reloadData];
}

@end
