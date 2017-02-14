//
//  ViewController.m
//  AnimationTest
//
//  Created by zhengqian.shi on 17/1/14.
//  Copyright © 2017年 QITMAC000263. All rights reserved.
//

#import "ViewController.h"
#import "MoveLogoImg.h"
#import "SimpleAnimeVC.h"
#import "UIViewAnimationTestVC.h"
#import "PMLayerTestVC.h"
#import "CAPauseTestVC.h"
#import "TimeFuncTestVC.h"
#import "MaskLayerTestVC.h"
#import "EmitterLayerTestVC.h"

@interface ViewController ()
{
    NSArray<NSString *> *_tests;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"CoreAnimationTest";
    
    [self initTests];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewStylePlain;
    self.tableView.rowHeight = 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tests.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (indexPath.row >= 0 && indexPath.row < _tests.count)
    {
        cell.textLabel.text = _tests[indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc;
    
    if (indexPath.row == 0)
    {
        vc = [[SimpleAnimeVC alloc] init];
    }
    else if (indexPath.row == 1)
    {
        vc = [[UIViewAnimationTestVC alloc] init];
    }
    else if (indexPath.row == 2)
    {
        vc = [[CAPauseTestVC alloc] init];
    }
    else if (indexPath.row == 3)
    {
        vc = [[PMLayerTestVC alloc] init];
    }
    else if (indexPath.row == 4)
    {
        vc = [[TimeFuncTestVC alloc] init];
    }
    else if (indexPath.row == 5)
    {
        vc = [[MaskLayerTestVC alloc] init];
    }
    else if (indexPath.row == 6)
    {
        vc = [[EmitterLayerTestVC alloc] init];
    }
    
    if (vc)
    {
        vc.title = _tests[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)initTests
{
    _tests = @[@"简单动画",@"UIView动画",@"动画的暂停和继续",@"modelLayer与presentationLayer",@"模拟时间函数插值",@"蒙版实现刮刮卡效果",@"粒子效果"];
}

@end
