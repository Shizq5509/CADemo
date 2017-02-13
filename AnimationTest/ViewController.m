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

@interface ViewController ()
{
    NSArray<NSString *> *_tests;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    if (indexPath.row == 0)
    {
        SimpleAnimeVC *vc = [[SimpleAnimeVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 1)
    {
        UIViewAnimationTestVC *vc = [[UIViewAnimationTestVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 2)
    {
        CAPauseTestVC *vc = [[CAPauseTestVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 3)
    {
        PMLayerTestVC *vc = [[PMLayerTestVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 4)
    {
        TimeFuncTestVC *vc = [[TimeFuncTestVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)initTests
{
    _tests = @[@"简单动画",@"UIView动画",@"动画的暂停和继续",@"modelLayer与presentationLayer",@"模拟时间函数插值"];
}

@end
