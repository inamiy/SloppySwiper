//
//  ViewController.m
//  SloppySwiperExample
//
//  Created by Arkadiusz on 29-05-14.
//  Copyright (c) 2014 Arkadiusz Holko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSUInteger stackCount = [self.navigationController.viewControllers count];

    if (stackCount % 2 == 0) {
        self.view.backgroundColor = [UIColor colorWithRed:0.921f green:0.929f blue:1.000f alpha:1.000f];
    }

    // Bug reproduce step:
    // 1. Set left & right barButtonItems WITHOUT `title`.
    // 2. Push a new `ViewController`.
    // 3. Sloppy-swipe-back, but cancel it (don't pop).
    // 4. Sloppy-swipe-back to pop.
    // 5. RootViewController's navigationItem remains on navigationBar.
    //
    // NOTE: Bug won't reproduce if...
    // 1. `leftBarButtonItem` is not set, or
    // 2. `title` is set

    // Add left & right barButtonItems for non-root viewControllers.
    if (self.navigationController.viewControllers.count > 1) {
        UIView* v0 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        v0.backgroundColor = UIColor.greenColor;
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:v0];

        UIView* v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        v1.backgroundColor = UIColor.orangeColor;
        UIView* v2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        v2.backgroundColor = UIColor.cyanColor;
        self.navigationItem.rightBarButtonItems = @[
                                                    [[UIBarButtonItem alloc] initWithCustomView:v1],
                                                    [[UIBarButtonItem alloc] initWithCustomView:v2],
                                                    ];
    }

    // NOTE: Intentionally commented-out.
//    self.title = [@(stackCount) stringValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
