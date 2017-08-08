//
//  newViewController.m
//  ScrollViewImageGallaries
//
//  Created by Mohammad Shahzaib Ather on 2017-08-07.
//  Copyright © 2017 Mohammad Shahzaib Ather. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong,nonatomic) UIImageView *imageView;

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];


   self.imageView = [[UIImageView alloc] initWithImage:self.image];

    [self.scrollView addSubview:self.imageView];

    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
   
    
    [self.imageView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [self.imageView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [self.imageView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor                                                                                                                                                                                                                                                                                       ].active = YES;
    [self.imageView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;
    
    self.scrollView.pagingEnabled =YES;
    self.scrollView.delegate = self;

    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.maximumZoomScale = 2;


}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
