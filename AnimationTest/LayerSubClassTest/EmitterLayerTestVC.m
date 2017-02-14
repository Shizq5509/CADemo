//
//  EmitterLayerTestVC.m
//  AnimationTest
//
//  Created by zhengqian.shi on 17/2/14.
//  Copyright © 2017年 QITMAC000263. All rights reserved.
//

#import "EmitterLayerTestVC.h"

@interface EmitterLayerTestVC ()

@property(nonatomic,strong) CAEmitterLayer  *testLayer;

@end

@implementation EmitterLayerTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    [self makeSnow];
}

- (void)makeSnow
{

}

@end
