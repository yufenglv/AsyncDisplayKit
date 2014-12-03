//
//  SlowpokeImageNode.m
//  Sample
//
//  Created by Ryan Nystrom on 12/3/14.
//  Copyright (c) 2014 Facebook. All rights reserved.
//

#import "SlowpokeImageNode.h"

#import <AsyncDisplayKit/ASDisplayNode+Subclasses.h>

static CGFloat const kASDKLogoAspectRatio = 2.79;

@implementation SlowpokeImageNode

+ (UIImage *)displayWithParameters:(id<NSObject>)parameters isCancelled:(asdisplaynode_iscancelled_block_t)isCancelledBlock
{
  usleep( (long)(0.5 * USEC_PER_SEC) ); // artificial delay of 0.5s
  
  return [super displayWithParameters:parameters isCancelled:isCancelledBlock];
}

- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize
{
  if (constrainedSize.width > 0.0) {
    return CGSizeMake(constrainedSize.width, constrainedSize.width / kASDKLogoAspectRatio);
  } else if (constrainedSize.height > 0.0) {
    return CGSizeMake(constrainedSize.height * kASDKLogoAspectRatio, constrainedSize.height);
  }
  return CGSizeZero;
}

- (UIImage *)placeholderImageForSize:(CGSize)size
{
  UIGraphicsBeginImageContext(size);
  [[UIColor colorWithWhite:0.9 alpha:1] setStroke];

  UIBezierPath *path = [UIBezierPath bezierPath];
  [path moveToPoint:CGPointZero];
  [path addLineToPoint:(CGPoint){size.width, size.height}];
  [path stroke];

  [path moveToPoint:(CGPoint){size.width, 0.0}];
  [path addLineToPoint:(CGPoint){0.0, size.height}];
  [path stroke];

  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return image;
}

@end
