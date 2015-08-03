//
//  HypnosisView.m
//  MyFirstApp
//
//  Created by 李峰艳 on 15/8/3.
//  Copyright (c) 2015年 李峰艳. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGRect bounds = [self bounds];
    
    CGPoint center;
    
    center.x = bounds.origin.x + bounds.size.width/2.0f;
    center.y = bounds.origin.y + bounds.size.height/2.0f;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height)/2.0f;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 10);
    
    [[UIColor lightGrayColor] setStroke];
    
    for (float c = maxRadius; c>0; c-=20) {
        CGContextAddArc(context, center.x, center.y, c, 0.0, M_PI*2.0, YES);
        CGContextStrokePath(context);
    }
    // Drawing code
}


@end
