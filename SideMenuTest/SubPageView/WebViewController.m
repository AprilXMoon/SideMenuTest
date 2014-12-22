//
//  WebViewController.m
//  SideMenuTest
//
//  Created by April Lee on 2014/12/17.
//  Copyright (c) 2014年 april. All rights reserved.
//

#import "WebViewController.h"
#import "SideView.h"
#import "CoverView.h"


@interface WebViewController ()<CoverViewDelegate>
{
    NSString *URLString;
    IBOutlet UIWebView *contentWebView;
    IBOutlet UIView *contentView;
    UIActivityIndicatorView *indicator;
    
    SideView *sideMenu;
    CoverView *bgCoverView;
}
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    contentWebView.delegate = self;
    
    [self addSideMenu];
    [self addbgCoverView];
    [self addActivityIndicator];

    [self loadWebContentFromURL];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadWebContentFromURL
{
    if (URLString == nil || [URLString isEqualToString:@""]) {
        [self getDefaultURL];
    }
    
    contentWebView.scalesPageToFit = YES;
    NSURL *url = [NSURL URLWithString:URLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [contentWebView loadRequest:request];

    [indicator startAnimating];
    bgCoverView.hidden = NO;
    
}

-(IBAction)menuBtnPressed:(id)sender
{
    [sideMenu openMenu];
    bgCoverView.hidden = NO;
}

#pragma mark - CoverView Delegate
-(void)respondToTapGestureRecognizer
{
    if (!indicator.isAnimating) {
        [sideMenu closeMenu];
        bgCoverView.hidden = YES;

    }
}

#pragma mark - Add SideMenu & CoverView
-(void)addSideMenu
{
    if (sideMenu == nil) {
        sideMenu = [[SideView alloc]initWithFrame:SIDEMENU_FRAME andSuperView:self];
    }
    [self.view addSubview:sideMenu];
}

-(void)addbgCoverView
{
    bgCoverView = [[CoverView alloc]initWithFrame:contentView.frame];
    
    bgCoverView.hidden = YES;
    bgCoverView.delegate = self;
    
    [contentView addSubview:bgCoverView];
}

-(void)addActivityIndicator
{
    indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator.color = [UIColor colorWithRed:1.000 green:0.502 blue:0.000 alpha:1.000];
    indicator.center = self.view.center;
    [contentView addSubview:indicator];
}


#pragma mark - Setting URL

-(void)setURLString:(NSString *)currentURL
{
    URLString = currentURL;
}

-(void)getDefaultURL
{
    URLString = [[NSUserDefaults standardUserDefaults]stringForKey:@"WebviewloadingURL"];
}

#pragma mark - webViewDelegate

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [indicator stopAnimating];
    bgCoverView.hidden = YES;
}


-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSString *errorMsg = @"";
    if (error.code == NSURLErrorCancelled) {
        errorMsg = [NSString stringWithFormat:@"Canceled request:%@",[webView.request.URL absoluteString]];
    }else{
        errorMsg = error.description;
    }
    
    [indicator stopAnimating];
    UIAlertView *errorAlertView = [[UIAlertView alloc]initWithTitle:@"Loading Error" message:errorMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlertView show];
}



@end
