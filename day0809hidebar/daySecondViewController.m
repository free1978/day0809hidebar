//
//  daySecondViewController.m
//  day0809hidebar
//
//  Created by lijun on 13-8-9.
//  Copyright (c) 2013年 li jun. All rights reserved.
//

#import "daySecondViewController.h"
//#import <QuartzCore/QuartzCore.h>

@implementation daySecondViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //toolBar
    toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, -49,320,49)];
    //[self.view addSubview:toolbar];
    
    UIBarButtonItem * barItemBlank = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemFixedSpace) target:self action:nil];
    [barItemBlank setWidth:50.0];
    UIBarButtonItem * barItemFavorite = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settings_statistic_table_icon"] style:(UIBarButtonItemStylePlain) target:self action:@selector(clickFavorite) ];
    
    UIBarButtonItem * barItemFavoriteCount = [[UIBarButtonItem alloc] initWithTitle:@"0" style:(UIBarButtonItemStylePlain) target:self action:nil ];
    [barItemFavoriteCount setEnabled:NO];
    
    UIBarButtonItem * barItemBlankC = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemFixedSpace) target:self action:nil];
    [barItemBlankC setWidth:50.0];
    UIBarButtonItem * barItemComment = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settings_upgrade_icon"] style:(UIBarButtonItemStylePlain) target:self action:@selector(clickComment)];
    NSMutableArray * arrayItem = [[NSMutableArray alloc] init];
    UIBarButtonItem * barItemCommentCount = [[UIBarButtonItem alloc] initWithTitle:@"0" style:(UIBarButtonItemStylePlain) target:self action:nil ];
    [barItemCommentCount setEnabled:NO];
    
    [arrayItem addObject:barItemBlank];
    [arrayItem addObject:barItemFavorite];
    [arrayItem addObject:barItemFavoriteCount];
    [arrayItem addObject:barItemBlankC];
    [arrayItem addObject:barItemComment];
    [arrayItem addObject:barItemCommentCount];
    [toolbar setItems:arrayItem animated:YES];
}

-(void)clickFavorite
{
    NSLog(@"clickFavorite");
}

-(void)clickComment
{
    NSLog(@"clickComment");

}



//隐藏tabbar并显示一个toolbar,模仿系统自带的照片多选删除界面
- (IBAction)clickEdit:(id)sender
{
    NSLog(@"clickEdit");
    if (isEditing)
    {
        isEditing = NO;
        //self.tabBarController.tabBar.hidden = NO;
        self.navigationItem.rightBarButtonItem.title=@"edit";
        [toolbar removeFromSuperview];
        self.navigationItem.hidesBackButton = NO;

        [self hideTabBar:NO];

    }
    else
    {
        isEditing = YES;
        //self.tabBarController.tabBar.hidden = YES;
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.rightBarButtonItem.title= @"cancel";
        
        self.navigationItem.hidesBackButton = YES;

        [self.tabBarController.tabBar addSubview:toolbar];
        [self hideTabBar:YES];
    }
    
}

- (void) hideTabBar:(BOOL) hidden
{
    NSInteger screenHeight = [[UIScreen mainScreen] bounds].size.height;
    //NSLog(@"bottom:%d",bottom);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0];
    
    for(UIView *view in self.tabBarController.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            if (hidden)
            {
                [view setFrame:CGRectMake(view.frame.origin.x, screenHeight, view.frame.size.width, view.frame.size.height)];
            }
            else
            {
                [view setFrame:CGRectMake(view.frame.origin.x, screenHeight-49, view.frame.size.width, view.frame.size.height)];
            }
        }
        else
        {
            if (hidden)
            {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, screenHeight)];
            }
            else
            {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, screenHeight-49)];
            }
        }
    }
    
    [UIView commitAnimations];
}


//如果没有back按钮时候,使用这种写法pop view control返回
- (IBAction)clickButton1:(id)sender
{
    NSLog(@"clickButton1");
    [self.navigationController popViewControllerAnimated:YES];
}

//对应于model方式的弹出窗口
- (IBAction)clickButton2:(id)sender
{
    NSLog(@"clickButton2");
    [self dismissViewControllerAnimated:YES completion:nil];
}


//隐藏状态栏,导航栏,tabbar,使页面最大化
- (IBAction)hideNavAndBar:(id)sender
{
    NSLog(@"hideNavAndBar");
    [[UIApplication sharedApplication] setStatusBarHidden: YES withAnimation: UIStatusBarAnimationFade]; // 3.2+
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self hideTabBar:YES];
}

//显示状态栏,导航栏,tabbar
- (IBAction)showNavAndBar:(id)sender
{
    NSLog(@"showNavAndBar");
    [[UIApplication sharedApplication] setStatusBarHidden: NO withAnimation: UIStatusBarAnimationFade]; // 3.2+
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self hideTabBar:NO];
}


@end
