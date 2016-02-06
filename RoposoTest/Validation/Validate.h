//
//  Validate.h


#import <Foundation/Foundation.h>

@interface Validate : NSObject
{
  
}

+ (BOOL)isNull:(NSString*)str;
+ (BOOL)isValidEmailId:(NSString*)email;
+ (BOOL)isValidMobileNumber:(NSString*)number;
+ (BOOL) isValidUserName:(NSString*)userName;
+ (BOOL) isValidPassword:(NSString*)password;

@end
