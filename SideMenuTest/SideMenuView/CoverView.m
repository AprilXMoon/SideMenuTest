//
//  CoverView.m
//  SideMenuTest
//
//  Created by April Lee on 2014/12/17.
//  Copyright (c) 2014年 april. All rights reserved.
//

#import "CoverView.h"

@interface CoverView ()

@property (nonatomic,retain)UIViewController *superController;

@end

@implementation CoverView

-(id)initWithFrame:(CGRect)frame
{
    UINib *CoverNib = [UINib nibWithNibName:@"CoverView" bundle:nil];
    NSArray *nibArr = [CoverNib instantiateWithOwner:nil options:nil];
    
    self = (CoverView *)[nibArr lastObject];

    if (self) {
        self.frame = frame;
        [self addTapGestureRecognizer];
    }
    
    return self;
}

-(void)addTapGestureRecognizer
{
    UITapGestureRecognizer *tapRecoginzer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(respondToTapGestureRecognizer)];
    tapRecoginzer.numberOfTapsRequired = 1;
    
    [self addGestureRecognizer:tapRecoginzer];
}

-(void)respondToTapGestureRecognizer
{
    if ([self.delegate respondsToSelector:@selector(respondToTapGestureRecognizer)]) {
        [self.delegate respondToTapGestureRecognizer];
    }
}

@end
