//
//  PMViewController.m
//  Pixem
//
//  Created by Jon Como on 4/7/13.
//  Copyright (c) 2013 Jon Como. All rights reserved.
//

#import "PMViewController.h"
#import "PMPixemView.h"
#import "PMPixem.h"

@interface PMViewController ()
{
    __weak IBOutlet PMPixemView *pixelView;
    PMPixem *pixem;
}

@end

@implementation PMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    pixem = [[PMPixem alloc] initWithPixelsWide:10 high:10];
    pixelView.pixem = pixem;
    
    [pixelView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Actions

- (IBAction)loadNext:(id)sender {
}

- (IBAction)save:(id)sender {
}

- (IBAction)clear:(id)sender {
}

- (IBAction)loadPrevious:(id)sender {
}


@end
