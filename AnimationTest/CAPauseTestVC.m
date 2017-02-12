//
//  CAPauseTestVC.m
//  AnimationTest
//
//  Created by zhengqian.shi on 17/2/12.
//  Copyright © 2017年 QITMAC000263. All rights reserved.
//

#import "CAPauseTestVC.h"

typedef enum : NSUInteger {
    BtnStatusStart,
    BtnStatusPause,
    BtnStatusContinue,
} BtnStatus;

@interface CAPauseTestVC ()<CAAnimationDelegate>
{
    BtnStatus _btnStatus;
}
@property(nonatomic,strong) UIButton    *btnControl;
@property(nonatomic,strong) CALayer     *testLayer;
@property(nonatomic,strong) CALayer     *testLayer2;
@property(nonatomic,strong) UISlider    *slider;
@property(nonatomic,strong) CABasicAnimation    *testAnimation;

@end

@implementation CAPauseTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self initData];
    
    [self initViewSubs];
}

- (void)initData
{
    _btnControl = 0;
    _testAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    _testAnimation.fromValue = (__bridge id _Nullable)([UIColor redColor].CGColor);
    _testAnimation.toValue = (__bridge id _Nullable)(([UIColor yellowColor].CGColor));
    _testAnimation.duration = 3.0;
    [_testAnimation setDelegate:self];
}

- (void)initViewSubs
{
    _testLayer = [[CALayer alloc] init];
    _testLayer.position = CGPointMake(self.view.frame.size.width/2, 200);
    _testLayer.bounds = CGRectMake(0, 0, 200, 100);
    _testLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:_testLayer];
    
    _testLayer2 = [[CALayer alloc] init];
    _testLayer2.position = CGPointMake(self.view.frame.size.width/2, 400);
    _testLayer2.bounds = CGRectMake(0, 0, 200, 100);
    _testLayer2.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:_testLayer2];
    
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(_testLayer.position.x - 100, _testLayer.position.y + 50, 200, 50)];
    [_slider setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:0.2]];
    [_slider setContinuous:YES];
    [_slider addTarget:self action:@selector(onSliderChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_slider];
    
    _btnControl = [[UIButton alloc] initWithFrame:CGRectMake(_slider.center.x - 50, _testLayer2.position.y + 60, 100, 30)];
    [_btnControl setBackgroundColor:[UIColor grayColor]];
    [_btnControl setTitle:@"开 始" forState:UIControlStateNormal];
    [_btnControl addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnControl];
}

- (void)btnClick:(id)sender
{
//    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(onDisplayLink:)];
//    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    if (BtnStatusStart == _btnStatus)
    {
        [_testLayer2 addAnimation:_testAnimation forKey:@"testAnimation"];
        _btnStatus = BtnStatusPause;
        [_btnControl setTitle:@"暂 停" forState:UIControlStateNormal];
    }
    else if (BtnStatusPause == _btnStatus)
    {
        _btnStatus = BtnStatusContinue;
        [self pauseAnimation];
        [_btnControl setTitle:@"继 续" forState:UIControlStateNormal];
    }
    else if (BtnStatusContinue == _btnStatus)
    {
        _btnStatus = BtnStatusPause;
        [self continueAnimation];
        [_btnControl setTitle:@"暂 停" forState:UIControlStateNormal];
    }
}

//- (void)onDisplayLink:(CADisplayLink *)link
//{
//    if (_testLayer.animationKeys.count == 0)
//    {
//        _btnStatus = BtnStatusStart;
//        [_btnControl setTitle:@"开 始" forState:UIControlStateNormal];
//        _slider.value = 0;
//        [link invalidate];
//        return;
//    }
//    
//    if (BtnStatusPause == _btnStatus)
//    {
//        CGFloat nowValue = CGColorGetComponents(_testLayer.presentationLayer.backgroundColor)[1];
//        
//        _slider.value = (nowValue - _fromValue)/(_toValue - _fromValue);
//    }
//}

- (void)pauseAnimation
{
    _testLayer2.timeOffset = [_testLayer2 convertTime:CACurrentMediaTime() fromLayer:nil];
    _testLayer2.speed = 0;
}

- (void)continueAnimation
{
    _testLayer2.beginTime = CACurrentMediaTime() - _testLayer2.timeOffset;
    _testLayer2.timeOffset = 0;
    _testLayer2.speed = 1;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag;
{
    _btnStatus = BtnStatusStart;
    [_btnControl setTitle:@"开 始" forState:UIControlStateNormal];
}

- (void)onSliderChanged:(id)sender
{
    if (_testLayer.animationKeys.count == 0)
    {
        [_testLayer addAnimation:_testAnimation forKey:@"testAnimation"];
    }
    _testLayer.speed = 0;
    
    _testLayer.timeOffset = 3*_slider.value;
}

@end
