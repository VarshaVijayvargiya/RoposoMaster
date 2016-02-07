
//  RoposoTest
//
//  Created by Varsha on 2/6/16.
//
//


#import "ImageCacheVC.h"
#import "Validate.h"

@interface ImageCacheVC ()

@end

@implementation ImageCacheVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



+(void)saveImage:(UIImage *)image withName:(NSString *)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:name];
    // imageView is my image from camera
    NSData *imageData = UIImagePNGRepresentation(image);
    [imageData writeToFile:savedImagePath atomically:NO];
    
}

+(UIImage*)getImgeName:(NSString*)name
{
    @try {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *getImagePath = [documentsDirectory stringByAppendingPathComponent:name];
        UIImage *img = [UIImage imageWithContentsOfFile:getImagePath];
        return img;
    }
    @catch (NSException *exception) {
        
    }
   
  
}



+(NSString*)convertUserID:(NSString*)userid
{
    NSInteger len = [userid length];
    NSString *alphabate_string=@"abcdefghijklmnopqrstuvwxyz";
    
    NSMutableString *reverseName = [[NSMutableString alloc] initWithCapacity:len];
    for(NSInteger i=len-1;i>=0;i--)
    {
        
        NSString *yy=[NSString stringWithFormat:@"%c",[userid characterAtIndex:i]];
        char fifthChar = [alphabate_string characterAtIndex:[yy integerValue]];
        
        [reverseName appendString:[NSString stringWithFormat:@"%c",fifthChar]];
    }
    
    
    
    
    return reverseName;
}

+ (void)removeImage:(NSString*)fileName {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", fileName]];
    [fileManager removeItemAtPath: fullPath error:NULL];
  
}

//+(void)removeImage:(NSString *)fileName
//{
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    
//    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
//    NSError *error;
//    BOOL success = [fileManager removeItemAtPath:filePath error:&error];
//    if (success) {
//       
//    }
//    else
//    {
//       
//    }
//}



+ (UIImage *)imageForUser:(NSString *)name WithBG:(UIColor *) color;
{
    
    if([Validate isNull:name]) {
        name = @"U";
    }

    
    
    
    UIView *view=[self viewForString:name WithBG:color];
    
    
    UIGraphicsBeginImageContextWithOptions(view.frame.size, false, [[UIScreen mainScreen] scale]);
    //[view drawViewHierarchyInRect:view.frame afterScreenUpdates:TRUE];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor clearColor] set];
    CGContextSetRGBFillColor(context, 0,0,0, 0);
    CGContextFillRect(context, (CGRect){CGPointZero,view.frame.size});
    
    [view.layer renderInContext:context];
    
    UIImage *viewImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return viewImage;
}

+ (UILabel *)viewForString:(NSString  *)name WithBG:(UIColor *) color
{
    UILabel *l=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    [l setFont:[UIFont boldSystemFontOfSize:25]];
    [l setTextAlignment:NSTextAlignmentCenter];
    [l setTextColor:[UIColor whiteColor]];

    l.text = [NSString stringWithFormat:@"%c",[name characterAtIndex:0]];
    l.backgroundColor = color;
    l.layer.cornerRadius = l.frame.size.height/2;
    l.clipsToBounds = YES;
    
    return l;
}




+(UIColor *)randomColor
{
    CGFloat red = arc4random() % 255 / 255.0;
    CGFloat green = arc4random() % 255 / 255.0;
    CGFloat blue = arc4random() % 255 / 255.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    //NSLog(@"%@", color);
    return color;
}
@end
