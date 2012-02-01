//
//  EditBugViewController.h
//  ScaryBugs
//
//  Created by Joseph Diekhoff on 1/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RateView.h"

@class ScaryBugDoc;
@class DSActivityView;

@interface EditBugViewController : UIViewController <UITextFieldDelegate, RateViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
	ScaryBugDoc *_bugDoc;
	UITextField *_titleField;
	UIImageView *_imageView;
	RateView *_rateView;
	UIImagePickerController *_picker;
	DSActivityView *_activityView;
	NSOperationQueue *_queue;
}

@property (retain) ScaryBugDoc *bugDoc;
@property (retain) IBOutlet UITextField *titleField;
@property (retain) IBOutlet UIImageView *imageView;
@property (retain) IBOutlet RateView *rateView;
@property (retain) UIImagePickerController *picker;
@property (retain) DSActivityView *activityView;
@property (retain) NSOperationQueue *queue;

- (IBAction)titleFieldValueChanged:(id)sender;
- (IBAction)addPictureTapped:(id)sender;

@end
