//
//  ViewController.m
//  aoc2Week3
//
//  Created by Jimmy Kim on 10/6/12.
//  Copyright (c) 2012 Full Sail University. All rights reserved.
//

#import "ViewController.h"
#import "DatePickerViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize textView;
@synthesize swipeLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)DidSave:(NSString *)eventString
{
  // Appends on text view all the new events on the same screen
  textView.text = [textView.text stringByAppendingString:eventString];
}

-(void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  
  leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipe:)];
  leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
  [swipeLabel addGestureRecognizer:leftSwipe];
  
  rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipe:)];
  rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
  [swipeLabel addGestureRecognizer:rightSwipe];
  
}

// Create selector function to handle swipes
-(void)onSwipe:(UISwipeGestureRecognizer *)recognizer
{

}

- (IBAction)swipeAddEvent:(id)sender {
  DatePickerViewController *viewController = [[DatePickerViewController alloc] initWithNibName:@"DatePickerViewController" bundle:nil];
  
  // presents the modal view
  if (viewController != nil){
    viewController.delegate = self;
    
    // Transition type for modal view
    [viewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    
    // Presents the modal view
    [self presentViewController:viewController animated:TRUE completion:nil];
  }
}
@end
