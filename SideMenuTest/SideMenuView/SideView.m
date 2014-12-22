//
//  SideView.m
//  SideMenuTest
//
//  Created by April Lee on 2014/12/15.
//  Copyright (c) 2014年 april. All rights reserved.
//

#import "SideView.h"
#import "MenuOneViewController.h"
#import "ViewController.h"
#import "WebViewController.h"
#import "SettingViewController.h"


@interface SideView()

@property (nonatomic,retain)UIViewController *superController;

@end

@implementation SideView


-(id)initWithFrame:(CGRect)frame andSuperView:(UIViewController *)superView
{
    self = [self initWithFrame:frame];
    
    if (self) {
        self.superController = superView;
        
        [self defaultArrayItem];
    }
    
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    UINib *sideNib = [UINib nibWithNibName:@"SideView" bundle:nil];
    NSArray *nibArr = [sideNib instantiateWithOwner:nil options:nil];
    
    self = (SideView *)[nibArr lastObject];
    
    if (self) {
        self.frame = frame;
        self.menuTableView.dataSource = self;
        self.menuTableView.delegate = self;
    }
    
    return self;
}


-(void)defaultArrayItem
{
    self.MenuNames = @[@"Home",@"Photo",@"Web page",@"Setting"];
}


#pragma mark - MenuAction

-(void)openMenu
{
    CGRect newFrame = self.frame;
    newFrame.origin.x = 0;
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         self.frame = newFrame;
                     }];
}

-(void)closeMenu
{
    CGRect newFrame = self.frame;
    newFrame.origin.x = -MENU_WIDTH;
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         self.frame = newFrame;
                     }];

}

#pragma mark - tableView DataSoure

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.MenuNames count];
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Menu";
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MenuCell"];
    
    if (cell) {
        cell.textLabel.text = [self.MenuNames objectAtIndex:indexPath.row];
    }
    
    return cell;
}


#pragma mark - tableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    switch (indexPath.row) {
        case 0:
        {
            ViewController *MainView = (ViewController *)[mainStory instantiateViewControllerWithIdentifier:@"MainView"];
            [self.superController.navigationController setViewControllers:[NSArray arrayWithObject:MainView] animated:YES];
            break;
        }
        case 1:
        {
            MenuOneViewController *menuOneView = (MenuOneViewController *)[mainStory instantiateViewControllerWithIdentifier:@"MenuOneView"];
            [self.superController.navigationController setViewControllers:[NSArray arrayWithObject:menuOneView] animated:YES];
            break;
        }
        case 2:
        {
            WebViewController *webView = (WebViewController *)[mainStory instantiateViewControllerWithIdentifier:@"WebView"];
            [self.superController.navigationController setViewControllers:[NSArray arrayWithObject:webView]animated:YES];
            break;
        }
        case 3:
        {
            SettingViewController *settingView = (SettingViewController *)[mainStory instantiateViewControllerWithIdentifier:@"SettingView"];
            [self.superController.navigationController setViewControllers:[NSArray arrayWithObject:settingView]animated:YES];
            break;
        }
            
        default:
            
            NSLog(@"Item %i",(int)indexPath.row);
            break;
    }
}

@end
