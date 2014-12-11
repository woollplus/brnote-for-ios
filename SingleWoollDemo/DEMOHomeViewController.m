//
//  DEMOHomeViewController.m
//  REFrostedViewControllerExample
//
//  Created by Roman Efimov on 9/18/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "DEMOHomeViewController.h"
#import "DEMONavigationController.h"
#import "DoubleViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#include "ZJLViewController.h"
@interface DEMOHomeViewController ()

@end

UIViewController *firstViewController;
UIViewController *secondViewController;
UIViewController *thirdViewController;
UIViewController *fourViewController;
UIViewController *currentViewController;

UIViewController* contentView;

@implementation DEMOHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.title = @"";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"菜单"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:(DEMONavigationController *)self.navigationController
                                                                            action:@selector(showMenu)];
    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    imageView.image = [UIImage imageNamed:@"Balloon"];
//    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    imageView.contentMode = UIViewContentModeScaleAspectFill;
//    [self.view addSubview:imageView];
    
    
    contentView = [[UIViewController alloc]init];
    [self.view addSubview:contentView.view];
    
    
    firstViewController= [[ZJLViewController alloc]init];
    secondViewController= [[SecondViewController alloc]init];
    thirdViewController =[[ThirdViewController alloc]init];
    fourViewController =[[FourViewController alloc]init];
    
    [contentView.view addSubview:firstViewController.view];
    currentViewController=firstViewController;
    
    AnimateTabbarView *tabbar=[[AnimateTabbarView alloc]initWithFrame:self.view.frame];
    tabbar.delegate=self;
    [self.view addSubview:tabbar];
    
}

// callback
int g_flags=1;
-(void)FirstBtnClick{
    NSLog(@"第1个界面");
    if(g_flags==1)
        return;
    [currentViewController.view removeFromSuperview];
    [contentView.view addSubview:firstViewController.view];
    g_flags=1;
    currentViewController=firstViewController;
}
-(void)SecondBtnClick{
    NSLog(@"第2个界面");
    if(g_flags==2)
        return;
    g_flags=2;
    [currentViewController.view removeFromSuperview];
    [contentView.view addSubview:secondViewController.view];
    currentViewController=firstViewController;
    
}
-(void)ThirdBtnClick{
    //BarView.text=@"third";
    NSLog(@"第三个界面");
    if(g_flags==3)
        return;
    [currentViewController.view removeFromSuperview];
    [contentView.view addSubview:thirdViewController.view];
    g_flags=3;
    currentViewController=thirdViewController;
}
-(void)FourthBtnClick{
    //BarView.text=@"fourth";
    NSLog(@"第四个界面");
    if(g_flags==4)
        return;
    [currentViewController.view removeFromSuperview];
    [contentView.view addSubview:fourViewController.view];
    g_flags=4;
    currentViewController=fourViewController;
}







@end
