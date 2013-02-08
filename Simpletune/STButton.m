//
//  STButton.m
//  Simpletune
//
//  Created by Skyler on 2/7/13.
//  Copyright (c) 2013 Skyler. All rights reserved.
//

#import "STButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation STButton

- (void)initialize {
  [self addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:NULL];
}

- (id)initWithFrame:(CGRect)frame {
  if ((self = [super initWithFrame:frame]) != nil) {
    [self initialize];
  }
  
  return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  if ((self = [super initWithCoder:aDecoder]) != nil) {
    [self initialize];
  }
  
  return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change
                       context:(void *)context {
  [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
  self.layer.masksToBounds = NO;
  self.layer.shadowColor = [[UIColor blackColor] CGColor];
  self.layer.shadowOffset = CGSizeMake(0, 1.5);
  self.layer.shadowRadius = 0.75;
  self.layer.shadowOpacity = 0.35;
  
  UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect
                                             byRoundingCorners:UIRectCornerAllCorners
                                                   cornerRadii:CGSizeMake(5, 5)];
  if (!self.highlighted) {
    [[UIColor whiteColor] setFill];
  } else {
    [[UIColor colorWithWhite:0.65 alpha:1.0] setFill];
  }
  
  [path fill];
}

@end
