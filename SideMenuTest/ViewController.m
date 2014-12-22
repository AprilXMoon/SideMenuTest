//
//  ViewController.m
//  SideMenuTest
//
//  Created by April Lee on 2014/12/15.
//  Copyright (c) 2014年 april. All rights reserved.
//

#import "ViewController.h"
#import "SideView.h"
#import "MenuOneViewController.h"
#import "CoverView.h"

@interface ViewController () <CoverViewDelegate>
{
    IBOutlet UIView *MainView;
    
    SideView *sideView;
    CoverView *bgCoverView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self addCoverView];
    [self addSideMenuView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - add SideMenu & CoverView
-(void)addSideMenuView
{
    if (sideView == nil) {
        sideView = [[SideView alloc]initWithFrame:SIDEMENU_FRAME andSuperView:self];
    }
    
    [self.view addSubview:sideView];
}

-(void)addCoverView
{
    bgCoverView = [[CoverView alloc]initWithFrame:MainView.frame];

    bgCoverView.hidden = YES;
    bgCoverView.delegate = self;
    
    [MainView addSubview:bgCoverView];
}

#pragma mark - SideMune Method

-(IBAction)MenuBtnPressed:(id)sender
{
    [sideView openMenu];
    bgCoverView.hidden = NO;
}

#pragma mark - CoverViewDelegate

-(void)respondToTapGestureRecognizer
{
    [sideView closeMenu];
    bgCoverView.hidden = YES;
}

@end
