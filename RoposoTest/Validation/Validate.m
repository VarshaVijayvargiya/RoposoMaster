//
//  Validate.m

#import "Validate.h"


@implementation Validate

/**
 * Function name isNull                         
 *                                              
 * @params: NSString *str                       
 *                                              
 * @object: function to check a string to null  
 *
 * return BOOL
 */

+ (BOOL)isNull:(NSString*)str{
	if ([str isKindOfClass:[NSNull class]] || str == nil || [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""] || [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"(null)"] || [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"<null>"] || [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"null"]|| [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@" "]) {
		return YES;
	}
	return NO;
}
/**
 * Function name isValidEmailId                
 *                                              
 * @params: NSString                            
 *                                              
 * @object: function to check a valid email id  
 *
 * return BOOL
 */
+ (BOOL)isValidEmailId:(NSString*)email
{
    
	NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"; 
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex]; 
    
	return [emailTest evaluateWithObject:email];
}
/**
 * Function name isValidMobileNumber           
 *                                              
 * @params: NSString                            
 *                                              
 * @object: function to check a valid Mobile # 
 *
 * return BOOL
 */
+ (BOOL)isValidMobileNumber:(NSString*)number
{
    number=[number stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	if ([number length]<5 || [number length]>17) {
		return FALSE;
	}
	NSString *Regex = @"^([0-9]*)$"; 
    NSPredicate *mobileTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex]; 
	
    return [mobileTest evaluateWithObject:number];
}
/**
 * Function name isValidUserName                
 *                                             
 * @params: NSString                            
 *                                              
 * @object: function to check a valid user name 
 *
 * return BOOL
 */
+ (BOOL) isValidUserName:(NSString*)userName{
    NSString *regex=@"^[a-z0-9_-]{5,15}$";
    NSPredicate *userNameTest=[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [userNameTest evaluateWithObject:userName];
}
/**
 * Function name isValidPassword                
 *                                              
 * @params: NSString                            
 *                                              
 * @object: function to check a valid password 
 *
 * return BOOL
 */
+ (BOOL) isValidPassword:(NSString*)password{
    NSString *regex=@"^[a-z0-9_-[!#$%&]]{5,15}$";
    NSPredicate *passwordTest=[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [passwordTest evaluateWithObject:password];
}
@end
