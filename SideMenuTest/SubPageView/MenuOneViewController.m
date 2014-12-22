//
//  MenuOneViewController.m
//  SideMenuTest
//
//  Created by April Lee on 2014/12/16.
//  Copyright (c) 2014年 april. All rights reserved.
//

#import "MenuOneViewController.h"
#import "SideView.h"
#import "CoverView.h"

@interface MenuOneViewController () <CoverViewDelegate>
{
    SideView *sideMenu;
    CoverView *bgCoverView;
    
    IBOutlet UIView *contentView;
}

@end

@implementation MenuOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addCoverView];
    [self addSideMenuView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Add Views method

-(void)addSideMenuView
{
    if (sideMenu == nil) {
        sideMenu = [[SideView alloc]initWithFrame:SIDEMENU_FRAME andSuperView:self];
    }
    
    [self.view addSubview:sideMenu];
}

-(void)addCoverView
{
    bgCoverView = [[CoverView alloc]initWithFrame:contentView.frame];
    
    bgCoverView.backgroundColor = [UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:0.500];
    bgCoverView.hidden = YES;
    
    bgCoverView.delegate = self;
    
    [contentView addSubview:bgCoverView];
}


#pragma mark - MenuAction
-(IBAction)MenuBtn:(id)sender
{
    [sideMenu openMenu];
    bgCoverView.hidden = NO;
}

#pragma mark - CoverView delegate
-(void)respondToTapGestureRecognizer
{
    [sideMenu closeMenu];
    bgCoverView.hidden = YES;
}

@end
