
//  RoposoTest
//
//  Created by Varsha on 2/6/16.
//
//


#import <UIKit/UIKit.h>
#define ICContactImageDefaultColor [UIColor colorWithWhite:0.896 alpha:1.000]
@interface ImageCacheVC : UIViewController



+(void)saveImage:(UIImage *)image withName:(NSString *)name;
+(UIImage*)getImgeName:(NSString*)name;
+(NSString*)convertUserID:(NSString*)userid;
+(void)removeImage:(NSString*)fileName;
+ (UIImage *)imageForUser:(NSString *)contact WithBG:(UIColor *) color;
+(UIColor *)randomColor;
@end
