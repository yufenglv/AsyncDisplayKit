//
//  SlowpokeShareNode.m
//  Sample
//
//  Created by Ryan Nystrom on 12/3/14.
//  Copyright (c) 2014 Facebook. All rights reserved.
//

#import "SlowpokeShareNode.h"

#import <AsyncDisplayKit/ASDisplayNode+Subclasses.h>

static NSUInteger const kRingCount = 3;
static CGFloat const kRingStrokeWidth = 1.0;
static CGSize const kIconSize = (CGSize){ 60.0, 17.0 };

@implementation SlowpokeShareNode

+ (void)drawRect:(CGRect)bounds withParameters:(id<NSObject>)parameters isCancelled:(asdisplaynode_iscancelled_block_t)isCancelledBlock isRasterizing:(BOOL)isRasterizing
{
  usleep( (long)(0.8 * USEC_PER_SEC) ); // artificial delay of 1.2s

  [[UIColor colorWithRed:0.f green:122/255.f blue:1.f alpha:1.f] setStroke];

  for (NSUInteger i = 0; i < kRingCount; i++) {
    CGFloat x = i * kIconSize.width / kRingCount;
    CGRect frame = CGRectMake(x, 0.f, kIconSize.height, kIconSize.height);
    CGRect strokeFrame = CGRectInset(frame, kRingStrokeWidth, kRingStrokeWidth);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:strokeFrame cornerRadius:kIconSize.height / 2.f];
    [path setLineWidth:kRingStrokeWidth];
    [path stroke];
  }
}

- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize
{
  return kIconSize;
}

@end
