//
//  dayViewController.m
//  day0809hidebar
//
//  Created by lijun on 13-8-9.
//  Copyright (c) 2013年 li jun. All rights reserved.
//

#import "dayViewController.h"

@interface dayViewController ()

@end

@implementation dayViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"pushHideBarSegue"])
    {
        NSLog(@"pushHideBarSegue");
        self.hidesBottomBarWhenPushed = YES;
    }
    else
    {
        self.hidesBottomBarWhenPushed = NO;
    }

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
