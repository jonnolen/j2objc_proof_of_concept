//
//  ViewController.m
//  J2ObjcConsumer
//
//  Created by Jonathan Nolen on 1/20/15.
//  Copyright (c) 2015 RJ. All rights reserved.
//

#import "ViewController.h"
#import "Canary.h"
#import "com/developertown/shared/CoalMine.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ComDevelopertownSharedCoalMine *coalMine = [ComDevelopertownSharedCoalMine new];
    
    Canary *canary = [Canary new];
    NSLog(@"canary status: %@", [canary getStatus]);
    NSLog(@"coal mine status: %@", [coalMine getStatus]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
