//
//  UIImage+QRCode.h
//  Mould
//
//  Created by Jiaming Tu on 2017/5/17.
//  Copyright © 2017年 fujianzhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QRCode)

+ (UIImage *)createQRCodeWithCodeText:(NSString *)text;

@end
