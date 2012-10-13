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
  // User defaults on loading app
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  
  // Adds the object for event
  if (defaults != nil) {
    NSString *eventInfoString = [defaults objectForKey:@"event"];
    
    textView.text = eventInfoString;
  }

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)DidSave:(NSString *)eventString
{
  // Appends on text view all the new events on the same screen
  textView.text = [textView.text stringByAppendingString:eventString];
}

// Save button handler
- (IBAction)saveButton:(id)sender
{
  // User defaults, setting object and key for string
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  if (defaults !=nil) {
    NSString *eventInfoString = textView.text;
    [defaults setObject:eventInfoString forKey:@"event"];
    
    [defaults synchronize];
  }
}

-(void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  
  // Add right swipe gesture
  rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipe:)];
  rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
  
  // Add gesture to label
  [swipeLabel addGestureRecognizer:rightSwipe];
  
}

// Create selector function to handle swipes
-(void)onSwipe:(UISwipeGestureRecognizer *)recognizer
{
  if (recognizer.direction == UISwipeGestureRecognizerDirectionRight){
   
    DatePickerViewController *viewController = [[DatePickerViewController alloc] initWithNibName:@"DatePickerViewController" bundle:nil];
  
    if (viewController != nil){
      viewController.delegate = self;
      
      // Transition type for modal view
      [viewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
      
      // Presents the modal view
      [self presentViewController:viewController animated:TRUE completion:nil];
    }
}

}

@end
