//
//  Feed.h
//  RoposoTest
//
//  Created by Varsha on 2/6/16.
//
//

#import <Foundation/Foundation.h>
typedef enum : NSUInteger {
    HEADER,
    STORY,
    UNKNOWN
    
} FeedType;

@interface Feed : NSObject


@property(nonatomic, readonly) FeedType feedType;
@property(nonatomic, strong, readonly) NSString *userName;
@property(nonatomic, strong, readonly) NSString *feedId;
@property(nonatomic, strong, readonly) NSString *short_description;
@property(nonatomic, strong, readonly) NSString *followers;
@property(nonatomic, strong, readonly) NSString *following;
@property(nonatomic, strong, readonly) NSString *image;
@property(nonatomic, strong, readonly) NSString *url;
@property(nonatomic, strong, readonly) NSString *handle;
@property(nonatomic,readonly) NSString *is_following;
@property (nonatomic,strong) NSString *createdOn;

@property(nonatomic, strong, readonly) NSString *verb;
@property(nonatomic, strong, readonly) NSString *db;
@property(nonatomic, strong, readonly) NSString *si;
@property(nonatomic, strong, readonly) NSString *type;
@property(nonatomic, strong, readonly) NSString *title;
@property(nonatomic, strong, readonly) NSString *likes_count,*like_flag,*comment_count;



+(instancetype)createFeedWithData:(NSDictionary *)dic;
@end
