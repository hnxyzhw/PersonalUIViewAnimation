//
//  CircleProgressLayer.m
//  PersonalUIViewAnimation
//
//  Created by andson-zhw on 16/5/18.
//  Copyright © 2016年 andson. All rights reserved.
//

#import "CircleProgressLayer.h"
#import <UIKit/UIKit.h>

@implementation CircleProgressLayer
-(instancetype)initWithLayer:(CircleProgressLayer *)layer{
    NSLog(@"====initLayer");
    if (self == [super initWithLayer:layer]) {
        self.progress = layer.progress;
    }
    return self;
}

- (void)drawInContext:(CGContextRef)ctx {
    CGFloat radius = self.bounds.size.width / 4;
    CGFloat lineWidth = 10.0;
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius*2, radius*2) radius:radius - lineWidth / 2 startAngle:0.f endAngle:M_PI * 2 * self.progress clockwise:YES];
    CGContextSetRGBStrokeColor(ctx, 0.5, 0.5, 0.9, 1.0);//笔颜色
    CGContextSetLineWidth(ctx, 10);//线条宽度
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
}
-(void)setProgress:(CGFloat)progress{
    _progress = progress;
    [self setNeedsDisplay];
}
+(BOOL)needsDisplayForKey:(NSString *)key{
    if ([key isEqualToString:@"porgress"]) {
        return YES;
    }
    
    return [super needsDisplayForKey:key];
}
@end
