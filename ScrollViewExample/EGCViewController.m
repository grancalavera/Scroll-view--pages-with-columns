//
//  EGCViewController.m
//  ScrollViewExample
//
//  Created by Leon Coto on 22/10/2011.
//  Copyright (c) 2011 Team Chiquitazo. All rights reserved.
//

#import "EGCViewController.h"

@implementation EGCViewController
@synthesize scrollView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int i = 0;
    int pageWidth = 1024;
    int pageHeight = 568;
    double columnCount = 38;
    double columnsPerPage = 3;
    int columnWidth = 294;
    int columnHeight = pageHeight;
    int firstColumnGap = 36;
    int columnGap = 35;
    int pageCount = (int) ceil(columnCount / columnsPerPage);
    int viewIndex = 0;
    int pageIndex = -1;
    
    scrollView.contentSize = CGSizeMake(pageWidth * pageCount, pageHeight);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.scrollsToTop = NO;
    
    UIView *aView = nil;
    UILabel *aLabel = nil;
    UIView *currentPage = nil;
    CGRect frame;
    NSMutableArray *pages = [[NSMutableArray alloc] init];

    for (i = 0; i < pageCount; i++) 
    {
        frame = CGRectMake(0, 0, pageWidth, pageHeight);
        frame.origin.x = i * pageWidth;
        aView = [[UIView alloc] initWithFrame:frame];
//        [aView setBackgroundColor:i % 2 ? [UIColor lightGrayColor] : [UIColor darkGrayColor]];
        [scrollView addSubview:aView];
        [pages addObject:aView];
    }
    
    for (i = 0; i < (int) columnCount; i++) 
    {
        if (i % (int) columnsPerPage == 0)
        {
            currentPage = [pages objectAtIndex:++pageIndex];
        }
        
        viewIndex = [[currentPage subviews] count];
        frame = CGRectMake(0, 0, columnWidth, columnHeight);
        
        frame.origin.x = firstColumnGap + ((columnWidth + columnGap) * viewIndex);
                
        aView = [[UIView alloc] initWithFrame:frame];
        [aView setBackgroundColor:[UIColor lightGrayColor]];
        [currentPage addSubview:aView];
        
        aLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, columnWidth, 30)];
        [aLabel setBackgroundColor:[UIColor darkGrayColor]];
        [aLabel setTextColor:[UIColor whiteColor]];
        [aLabel setTextAlignment:UITextAlignmentCenter];
        aLabel.text = [NSString stringWithFormat:@"Column #%i", i + 1];
        [aView addSubview:aLabel];
    }
    
}

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (UIInterfaceOrientationLandscapeLeft == interfaceOrientation) || (UIInterfaceOrientationLandscapeRight == interfaceOrientation);
}

@end
