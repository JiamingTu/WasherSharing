//
//  UIImage+Scale.h
//  Mould
//
//  Created by Jiaming Tu on 2017/5/27.
//  Copyright © 2017年 fujianzhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Scale)
- (UIImage *)scaleToSize:(CGSize)size;
/**图片裁成方形*/
- (UIImage *)getCropImage;

@end
