//
//  Feed.m
//  RoposoTest
//
//  Created by Varsha on 2/6/16.
//
//

#import "Feed.h"

@implementation Feed


+(instancetype)createFeedWithData:(NSDictionary *)dic
{
     return [[Feed alloc]initWithFeedData:dic];
}


-(instancetype)initWithFeedData:(NSDictionary *)dic
{
    if (self = [super init])
    {
        if ([[dic allKeys] containsObject:@"type"]) {
            //Story data
            _short_description = dic[@"description"];
            _feedId            = dic[@"id"];
            _verb              = dic[@"verb"];
            _db                = dic[@"db"];
            _url               = dic[@"url"];
            _si                = dic[@"si"];
            _type              = dic[@"type"];
            _title             = dic[@"title"];
            _like_flag         = [NSString stringWithFormat:@"%@",dic[@"like_flag"]];
            _likes_count       =[NSString stringWithFormat:@"%@",dic[@"likes_count"]];
            _comment_count     =[NSString stringWithFormat:@"%@",dic[@"comment_count"]];
            _feedType          =STORY;
            
        }
        else
        {
            _short_description = dic[@"about"];
            _feedId            = dic[@"id"];
            _userName          = dic[@"username"];
            _followers         =[NSString stringWithFormat:@"%@",dic[@"followers"]];
            _following         =[NSString stringWithFormat:@"%@",dic[@"following"]];
            _image             =dic[@"image"] ;
            _url               =dic[@"url"];
            _handle            =dic[@"handle"];
            _is_following      =dic[@"is_following"];
            _createdOn         = [NSString stringWithFormat:@"%@",dic[@"createdOn"]];
             _feedType          = HEADER;
            
        }
    }
    
    return self;
}
@end
