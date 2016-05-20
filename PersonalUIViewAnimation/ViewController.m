//
//  ViewController.m
//  PersonalUIViewAnimation
//
//  Created by andson-zhw on 16/5/18.
//  Copyright © 2016年 andson. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"

@interface ViewController ()
@property(nonatomic,strong) CircleView *circleView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.circleView = [[CircleView alloc]initWithFrame:self.view.bounds];
    self.circleView.backgroundColor = [UIColor whiteColor];
    self.circleView.progress =0.2;
    [self.view addSubview:self.circleView];
    
    //第一种方法：通过重载circleView的drawRect来实自定义的动画效果，看起来不够高大上。
    //可以使用添加Layer的方式来实现提高代码质量
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(50, 400, 275, 10)];
    [slider addTarget:self action:@selector(changeProgress:) forControlEvents:UIControlEventValueChanged];
    slider.maximumValue = 1.0;
    slider.minimumValue = 0.0;
    slider.value = self.circleView.progress;
    [self.view addSubview:slider];
}

-(void)changeProgress:(UISlider *)slider{
    self.circleView.progress = slider.value;
    //[self.circleView setNeedsDisplay];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    self.circleView.progress = 0.8;
//    [self.circleView setNeedsDisplay];
    self.circleView.progress += (arc4random() % 4 +1) * 0.1;
    if (self.circleView.progress >= 1.0) {
        self.circleView.progress = 1.0;
    }
    
    
}
 
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
