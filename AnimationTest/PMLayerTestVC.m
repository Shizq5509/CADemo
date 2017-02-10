//
//  PMLayerTestVC.m
//  AnimationTest
//
//  Created by zhengqian.shi on 17/2/10.
//  Copyright © 2017年 QITMAC000263. All rights reserved.
//

#import "PMLayerTestVC.h"

@interface PMLayerTestVC ()

@end

@implementation PMLayerTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
}


- (void)layerTest
{
    //
    //    NSLog(@"%f",_img.layer.position.x);
    //    NSLog(@"%f",_img.layer.modelLayer.position.x);
    //    NSLog(@"%f",_img.layer.presentationLayer.position.x);
    //    _recordTime = [[NSDate date] timeIntervalSince1970]*1000;
    //
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((0) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        NSLog(@"%f",_img.layer.presentationLayer.position.x);
    //
    //        UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000;
    //        NSLog(@"%llu毫秒",recordTime-_recordTime);
    //    });
    //
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((0.012) * NSEC_PER_SEC)), dispatchQueue, ^{
    //        NSLog(@"%f",_img.layer.presentationLayer.position.x);
    //        UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000;
    //        NSLog(@"%llu毫秒",recordTime-_recordTime);
    //    });
}

@end
