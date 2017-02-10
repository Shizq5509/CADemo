//
//  MyTestLayer.m
//  AnimationTest
//
//  Created by zhengqian.shi on 17/1/23.
//  Copyright © 2017年 QITMAC000263. All rights reserved.
//

#import "MyTestLayer.h"

@implementation MyTestLayer

- (void)setFrame:(CGRect)frame
{
#ifdef printLog
    NSLog(@"----layer setFrame -%@",self);
    [super setFrame:frame];
    NSLog(@"----layer setFrame end -%@",self);
#else
    [super setFrame:frame];
#endif
}

- (void)setPosition:(CGPoint)position
{
#ifdef printLog
    NSLog(@"----layer setPosition -%@",self);
    [super setPosition:position];
    NSLog(@"----layer setPosition end -%@",self);
#else
    [super setPosition:position];
#endif
}

- (void)setBounds:(CGRect)bounds
{
#ifdef printLog
    NSLog(@"----layer setBounds -%@",self);
    [super setBounds:bounds];
    NSLog(@"----layer setBounds end -%@",self);
#else
    [super setBounds:bounds];
#endif
}

- (CGPoint)position
{
#ifdef printLog
    NSLog(@"----layer getPosition -%@",self);
    CGPoint position = [super position];
    NSLog(@"----layer getPosition end -%@",self);
#else
    CGPoint position = [super position];
#endif
    return position;
}

- (CGRect)bounds
{
#ifdef printLog
    NSLog(@"----layer getBounds -%@",self);
    CGRect bounds = [super bounds];
    NSLog(@"----layer getBounds end -%@",self);
#else
    CGRect bounds = [super bounds];
#endif
    return bounds;
}

- (CGRect)frame
{
#ifdef printLog
    NSLog(@"----layer getFrame -%@",self);
    CGRect frame = [super frame];
    NSLog(@"----layer getFrame end -%@",self);
#else
    CGRect frame = [super frame];
#endif
    return frame;
}

@end
