//
//  CircleView.m
//  PersonalUIViewAnimation
//
//  Created by andson-zhw on 16/5/18.
//  Copyright © 2016年 andson. All rights reserved.
//

#import "CircleView.h"


@interface CircleView ()
@property(nonatomic,strong) CircleProgressLayer *circleProgressLayer;
@property(nonatomic,strong) UILabel *progressLabel;
@end

@implementation CircleView


-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.circleProgressLayer = [CircleProgressLayer layer];
        self.circleProgressLayer.frame = self.bounds;
        self.circleProgressLayer.contentsScale = [UIScreen mainScreen].scale;
        [self.layer addSublayer:self.circleProgressLayer];
        
        self.progressLabel = [[UILabel alloc]initWithFrame:self.bounds];
        self.progressLabel.textColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.9 alpha:1.0];
        self.progressLabel.textAlignment = NSTextAlignmentCenter;
        self.progressLabel.font = [UIFont boldSystemFontOfSize:15.0];
        self.progressLabel.text = @"0 %";
        [self addSubview:self.progressLabel];
    }
    
    return self;
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    
//    CGFloat radius = self.bounds.size.width/4;
//    CGFloat lineWidth = 10.0;
////    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 200)];
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius*2, radius*2) radius:radius-lineWidth/2 startAngle:0.f endAngle:M_PI *2 * self.progress clockwise:YES];
//    [[UIColor colorWithRed:0.5 green:0.5 blue:0.9 alpha:1.0] setStroke];
//    [path setLineWidth:lineWidth];
//    [path stroke];
//}


//- (void)drawInContext:(CGContextRef)ctx {
//    CGFloat radius = self.bounds.size.width / 4;
//    CGFloat lineWidth = 10.0;
//    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius*2, radius*2) radius:radius - lineWidth / 2 startAngle:0.f endAngle:M_PI * 2 * self.progress clockwise:YES];
//    CGContextSetRGBStrokeColor(ctx, 0.5, 0.5, 0.9, 1.0);//笔颜色
//    CGContextSetLineWidth(ctx, 10);//线条宽度
//    CGContextAddPath(ctx, path.CGPath);
//    CGContextStrokePath(ctx);
//}

-(void)setProgress:(CGFloat)progress{
    self.circleProgressLayer.progress = progress;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"progress"];
    animation.duration = 5.0 *fabs(progress - _progress);
    animation.toValue = @(progress);
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    animation.delegate = self;
    [self.circleProgressLayer addAnimation:animation forKey:@"progress"];

    self.progressLabel.text = [NSString stringWithFormat:@"%0.2f%%",progress *100];
    _progress = progress;
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    self.circleProgressLayer.progress = self.progress;
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    self.circleProgressLayer.progress += (arc4random() % 4 +1) * 0.1;
//}

@end
