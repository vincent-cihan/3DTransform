//
//  ViewController.m
//  CALayerLearn
//
//  Created by 刘乙灏 on 2017/4/19.
//  Copyright © 2017年 刘乙灏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *backView;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    backView.backgroundColor = [UIColor grayColor];
    backView.center = self.view.center;
    self.backView = backView;
    [self.view addSubview:backView];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    blueView.backgroundColor = [UIColor blueColor];
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    greenView.backgroundColor = [UIColor greenColor];
    [backView addSubview:redView];
    [backView addSubview:blueView];
    [backView addSubview:greenView];
    
    CGPoint backViewSubCenter = CGPointMake(backView.bounds.size.width / 2, backView.bounds.size.height / 2);
    
    redView.center = backViewSubCenter;
    blueView.center = backViewSubCenter;
    greenView.center = backViewSubCenter;
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = - 1.0 / 500.0;
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
    backView.layer.sublayerTransform = perspective;
    
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 50);
    redView.layer.transform = transform;
    
    transform = CATransform3DMakeTranslation(50, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    blueView.layer.transform = transform;
    
    transform = CATransform3DMakeTranslation(0, -50, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    greenView.layer.transform = transform;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    } else {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)timerAction {
    CATransform3D transform = self.backView.layer.sublayerTransform;
    transform = CATransform3DRotate(transform, 1.0 / 180.0 * M_PI, 0, 1, 0);
    self.backView.layer.sublayerTransform = transform;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
