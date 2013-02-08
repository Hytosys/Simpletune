//
//  STView.m
//  Simpletune
//
//  Created by Skyler on 2/7/13.
//  Copyright (c) 2013 Skyler. All rights reserved.
//

#import "STView.h"

@implementation STView

- (void)drawRect:(CGRect)rect {
  CGContextRef currentContext = UIGraphicsGetCurrentContext();
  
  CGGradientRef glossGradient;
  CGColorSpaceRef colorspace;
  size_t num_locations = 2;
  CGFloat locations[2] = { 0.0, 1.0 };
  CGFloat components[8] = { 0.22, 0.816, 0.443, 1.0, 0.161, 0.682, 0.361, 1.0 };
  
  colorspace = CGColorSpaceCreateDeviceRGB();
  glossGradient = CGGradientCreateWithColorComponents(colorspace, components, locations, num_locations);
  
  CGRect currentBounds = self.bounds;
  CGPoint topCenter = CGPointMake(CGRectGetMidX(currentBounds), 0.0f);
  CGPoint midCenter = CGPointMake(CGRectGetMidX(currentBounds), CGRectGetMaxY(currentBounds));
  CGContextDrawLinearGradient(currentContext, glossGradient, topCenter, midCenter, 0);
  
  CGGradientRelease(glossGradient);
  CGColorSpaceRelease(colorspace);

}

@end
