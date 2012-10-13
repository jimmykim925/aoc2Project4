//
//  DatePickerViewController.m
//  aoc2Week3
//
//  Created by Jimmy Kim on 10/6/12.
//  Copyright (c) 2012 Full Sail University. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController
@synthesize delegate;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    // Clears our delegate
      delegate = nil;
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  // Sets the current date
  currentDate = [NSDate date];
}

- (void)viewWillAppear:(BOOL)animated
{
  // Keyboard showing and hiding
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
  
  [super viewWillAppear:animated];

}

- (void)keyboardWillShow:(NSNotification *)notification
{

}

- (void)keyboardWillHide:(NSNotification *)notification
{

}

- (IBAction)saveButton:(id)sender {
  
  if (delegate != nil){
    
    // format string to include date and event text use delegate to send info to view controller
    if (selectedDate !=nil) {
      NSString *formattedTextDate = [NSString stringWithFormat:@"\n New Event: %@\n %@\n", textField.text, selectedDate];
      [delegate DidSave:formattedTextDate];
    } else {
      // sets date/time to current date/time if no value changed
      NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
      [dateFormat setDateFormat:@"yyyy, MMMM, dd hh:mm aaa"];
      
      NSDate *todaysDate = [NSDate date];
      [dateFormat stringFromDate:todaysDate];
      
      NSString *formattedTextDate = [NSString stringWithFormat:@"\n New Event: %@\n %@\n", textField.text, [dateFormat stringFromDate:todaysDate]];
      
      // Sends the date/time information using the delegate to the root view controller
      [delegate DidSave:formattedTextDate];
    }
    
  }
  // Dismisses modal view
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)closeKeyboard:(id)sender {
  // Resigns the text field as the first responder
  [textField resignFirstResponder];
}

- (IBAction)datePicker:(id)sender {
  // Casts the date picker
  UIDatePicker *datePicker = (UIDatePicker *)sender;
  
  if(datePicker != nil){
    // sets date/time
    NSDate *date = datePicker.date;
    
    // formats the date/time
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
     if (dateFormat != nil) {
      [dateFormat setDateFormat:@"yyyy, MMMM, dd hh:mm aaa"];
      }
        
    // Sets minimum date/time to current date
    [datePicker setMinimumDate:currentDate];
    selectedDate = [dateFormat stringFromDate:date];
  }
}
@end
