//
//  SideView.h
//  SideMenuTest
//
//  Created by April Lee on 2014/12/15.
//  Copyright (c) 2014年 april. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREENFRAME_WIDTH [[UIScreen mainScreen]applicationFrame].size.width
#define SCREENFRAME_HEIGHT [[UIScreen mainScreen]applicationFrame].size.height

#define SCREENFRAME_Y [[UIScreen mainScreen]applicationFrame].origin.y

#define MENU_WIDTH  SCREENFRAME_WIDTH - 90

#define SIDEMENU_FRAME CGRectMake(-MENU_WIDTH, SCREENFRAME_Y, MENU_WIDTH, SCREENFRAME_HEIGHT)

@interface SideView : UIView <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain)IBOutlet UITableView *menuTableView;
@property (nonatomic,copy) NSArray *MenuNames;


-(id)initWithFrame:(CGRect)frame andSuperView:(UIViewController *)superView;

-(void)openMenu;
-(void)closeMenu;

@end
