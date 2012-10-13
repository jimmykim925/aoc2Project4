//
//  ViewController.h
//  aoc2Week3
//
//  Created by Jimmy Kim on 10/6/12.
//  Copyright (c) 2012 Full Sail University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatePickerViewController.h"

@interface ViewController : UIViewController <DatePickerDelegate> 
{
  UISwipeGestureRecognizer *leftSwipe;
  UISwipeGestureRecognizer *rightSwipe;
}

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UILabel *swipeLabel;


@end
