//
//  ViewController.m
//  ScrollViewImageGallaries
//
//  Created by Mohammad Shahzaib Ather on 2017-08-07.
//  Copyright © 2017 Mohammad Shahzaib Ather. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"


@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong,nonatomic) UITapGestureRecognizer *tapGesture;
@property (nonatomic, strong) UIStackView * stackView;
@property (nonatomic ,strong) NSArray<UIImageView *> *imageViews;
@property (nonatomic ,strong) UILabel *pageLabel;
@property (nonatomic ) int index;


@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];

 
    self.imageViews = @[
            [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]],
            [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night"]],
            [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-zoomed"]]
            ];
    
    for (UIImageView *imageView in self.imageViews) {
        imageView.userInteractionEnabled = YES;
    }
    
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:self.imageViews];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.userInteractionEnabled = YES;
    
    
    [self.scrollView addSubview:stackView];
    
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [stackView.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor multiplier:self.imageViews.count].active = YES;
    [stackView.heightAnchor constraintEqualToAnchor:self.scrollView.heightAnchor multiplier:1].active = YES;
    
    [stackView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [stackView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [stackView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor                                                                                                                                                                                                                                                                                       ].active = YES;
    [stackView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;
    
    self.stackView = stackView;
    
    self.scrollView.pagingEnabled =YES;
    self.scrollView.delegate = self;
    
    
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(foo:)];
    [self.scrollView addGestureRecognizer:self.tapGesture];

    
    
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.scrollView.frame.size.width;
    float fractionalPage = self.scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    
     self.navigationItem.title = [NSString stringWithFormat:@"Page Number %ld",(long)page];
}


-(void)foo:(UITapGestureRecognizer*)sender{
   
    [self performSegueWithIdentifier:@"tapSeg" sender:self];
    
}

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     if ([segue.identifier isEqualToString:@"tapSeg"]) {
      
         // Get the proper index
          self.index =  self.scrollView.contentOffset.x  /  [[UIScreen mainScreen] bounds].size.width;
         
         // Get the current imageview from the array of imageviews with the index
         UIImageView *currentImageView = self.imageViews[self.index];

         // Get the image from the imageview
         UIImage *imageFromCurrentImageView = currentImageView.image;

         // Pass the image to the next view
         
         NewViewController *vc = segue.destinationViewController;
         vc.image = imageFromCurrentImageView;
     }
 
 
 
 }


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.stackView;
}




@end
