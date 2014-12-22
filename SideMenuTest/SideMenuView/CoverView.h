//
//  CoverView.h
//  SideMenuTest
//
//  Created by April Lee on 2014/12/17.
//  Copyright (c) 2014年 april. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CoverViewDelegate <NSObject>

@optional

-(void)respondToTapGestureRecognizer;


@end

@interface CoverView : UIView

@property (nonatomic,assign)id <CoverViewDelegate> delegate;


@end
