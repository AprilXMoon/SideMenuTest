//
//  WebViewController.h
//  SideMenuTest
//
//  Created by April Lee on 2014/12/17.
//  Copyright (c) 2014年 april. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>


-(void)setURLString:(NSString *)currentURL;

@end
