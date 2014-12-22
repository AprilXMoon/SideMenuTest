//
//  SettingViewController.m
//  SideMenuTest
//
//  Created by April Lee on 2014/12/22.
//  Copyright (c) 2014年 april. All rights reserved.
//

#import "SettingViewController.h"
#import "SideView.h"
#import "CoverView.h"

@interface SettingViewController () <CoverViewDelegate>
{
    IBOutlet UITextField *urlTF;
    IBOutlet UIView *setView;
    
    SideView *sideMenu;
    CoverView *coverView;
}

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addMenuView];
    [self addCoverView];
    
    [self setURLTextField];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addMenuView
{
    if (sideMenu == nil) {
        sideMenu = [[SideView alloc]initWithFrame:SIDEMENU_FRAME andSuperView:self];
    }
    
    [self.view addSubview:sideMenu];
}

-(void)addCoverView
{
    coverView = [[CoverView alloc]initWithFrame:setView.frame];
    coverView.hidden = YES;
    
    [setView addSubview:coverView];
}


-(void)setURLTextField
{
    NSString *URLStr = [[NSUserDefaults standardUserDefaults] stringForKey:@"WebviewloadingURL"];
    
    urlTF.text = URLStr;
}

-(IBAction)saveBtnPressed:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setValue:urlTF.text forKey:@"WebviewloadingURL"];
    
    [urlTF resignFirstResponder];
}

-(IBAction)MenuBtnPressed:(id)sender
{
    [sideMenu openMenu];
    coverView.hidden = NO;
}

#pragma mark - CoverView delegate
-(void)respondToTapGestureRecognizer
{
    [sideMenu closeMenu];
    coverView.hidden = YES;
}

@end
