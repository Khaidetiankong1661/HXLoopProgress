//
//  UIColor+Tool.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/17.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "UIColor+Tool.h"

@implementation UIColor (Tool)

+ (UIColor *)colorWithHexString:(NSString *)string
{
    return [self colorWithHexString:string withAlpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)string withAlpha:(CGFloat)alpha {

    //Quick return in case string is empty
    if (string.length == 0) {
        return nil;
    }

    //Check to see if we need to add a hashtag
    if('#' != [string characterAtIndex:0]) {
        string = [NSString stringWithFormat:@"#%@", string];
    }

    //Make sure we have a working string length
    if (string.length != 7 && string.length != 4) {

#ifdef DEBUG
        NSLog(@"Unsupported string format: %@", string);
#endif

        return nil;
    }

    //Check for short hex strings
    if(string.length == 4) {

        //Convert to full length hex string
        string = [NSString stringWithFormat:@"#%@%@%@%@%@%@",
                  [string substringWithRange:NSMakeRange(1, 1)],[string substringWithRange:NSMakeRange(1, 1)],
                  [string substringWithRange:NSMakeRange(2, 1)],[string substringWithRange:NSMakeRange(2, 1)],
                  [string substringWithRange:NSMakeRange(3, 1)],[string substringWithRange:NSMakeRange(3, 1)]];
    }

    NSString *redHex = [NSString stringWithFormat:@"0x%@", [string substringWithRange:NSMakeRange(1, 2)]];
    unsigned red = [[self class] hexValueToUnsigned:redHex];

    NSString *greenHex = [NSString stringWithFormat:@"0x%@", [string substringWithRange:NSMakeRange(3, 2)]];
    unsigned green = [[self class] hexValueToUnsigned:greenHex];

    NSString *blueHex = [NSString stringWithFormat:@"0x%@", [string substringWithRange:NSMakeRange(5, 2)]];
    unsigned blue = [[self class] hexValueToUnsigned:blueHex];

    return [UIColor colorWithRed:(float)red/255 green:(float)green/255 blue:(float)blue/255 alpha:alpha];
}

+ (unsigned)hexValueToUnsigned:(NSString *)hexValue {

    //Define default unsigned value
    unsigned value = 0;

    //Scan unsigned value
    NSScanner *hexValueScanner = [NSScanner scannerWithString:hexValue];
    [hexValueScanner scanHexInt:&value];

    //Return found value
    return value;
}

@end
